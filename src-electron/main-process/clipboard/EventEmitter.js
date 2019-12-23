(function () {
  class EventEmitter {
    constructor () {
      this.eventListeners = {}
    }

    on (event, listener) {
      this.eventListeners[event] = this.eventListeners[event] || []
      this.eventListeners[event].push(listener)
    }

    once (event, listener) {
      listener.$emitOnce = true
      this.eventListeners[event] = this.eventListeners[event] || []
      this.eventListeners[event].push(listener)
    }

    removeListener (event, listener) {
      if (this.eventListeners[event]) {
        let eventIndex = this.eventListeners[event].findIndex(eventListener => {
          return eventListener === listener
        })
        if (eventIndex >= 0) this.eventListeners[event].splice(eventIndex)
      }
    }

    removeAllListeners (event) {
      if (this.eventListeners[event]) this.eventListeners[event].length = 0
    }

    emit (event, ...args) {
      let self = this
      if (self.eventListeners[event]) {
        self.eventListeners[event].forEach(eventListener => {
          eventListener.call(self, ...args)
        })
        self.eventListeners[event].filter(eventListener => {
          return eventListener.$emitOnce
        })
          .forEach(eventListener => {
            self.removeListener(event, eventListener)
          })
      }
    }
  }

  module.exports = EventEmitter
})()
