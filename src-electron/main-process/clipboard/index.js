const { clipboard } = require('electron')
const EventEmitter = require('./EventEmitter')
const clipboardEmitter = new EventEmitter()

let clipboardInterval = null, previousText = clipboard.readText(), previousImage = clipboard.readImage()

clipboard.on = (event, listener) => {
  clipboardEmitter.on(event, listener)
  return clipboard
}

clipboard.once = (event, listener) => {
  clipboardEmitter.once(event, listener)
  return clipboard
}

clipboard.off = (event, listener) => {
  if (listener) { clipboardEmitter.removeListener(event, listener) } else { clipboardEmitter.removeAllListeners(event) }
  return clipboard
}

clipboard.startWatching = () => {
  if (!clipboardInterval) {
    clipboardInterval = setInterval(() => {
      if (isDiffText(previousText, previousText = clipboard.readText())) clipboardEmitter.emit('text-changed')
      if (isDiffImage(previousImage, previousImage = clipboard.readImage())) clipboardEmitter.emit('image-changed')
    }, 1000)
  }
  return clipboard
}

clipboard.stopWatching = () => {
  if (clipboardInterval) clearInterval(clipboardInterval)
  clipboardInterval = null
  return clipboard
}

function isDiffText (str1, str2) {
  return str2 && str1 !== str2
}

function isDiffImage (img1, img2) {
  return !img2.isEmpty() && img1.toDataURL() !== img2.toDataURL()
}

module.exports = clipboard
