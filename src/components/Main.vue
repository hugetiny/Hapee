<template>
  <q-layout view="hHh lpR fFf" class="bg-grey-9 text-white">
    <Topbar></Topbar>
    <Nav></Nav>
    <q-page-container>
<!--      <Subnav></Subnav>-->
      <router-view/>
    </q-page-container>
    <Footer></Footer>

<!--    <speedometer />-->
<!--    <add-task/>-->
<!--    <add-task/>-->
<!--    <about-panel :visible="aboutPanelVisible" />-->
<!--    <task-item-info :visible="taskItemInfoVisible" :task="currentTaskItem" />-->

<!--    for drag and drop-->
    <dragger />
  </q-layout>
</template>

<script>
import { mapState } from 'vuex'
// import AboutPanel from 'components/About/AboutPanel'
// import Aside from 'components/Aside/Index'
// import Speedometer from 'components/Speedometer/Speedometer'
// import AddTask from 'components/Task/AddTask'
// import TaskItemInfo from 'components/Task/TaskItemInfo'
import Dragger from 'components/Dragger/Index'
import Topbar from 'src/layouts/Topbar'
import Nav from 'src/layouts/Nav'
import Footer from 'src/layouts/Footer'
// import Subnav from 'src/layouts/Subnav'

export default {
  name: 'index',
  components: {
    // [AboutPanel.name]: AboutPanel,
    // [Aside.name]: Aside,
    // [Speedometer.name]: Speedometer,
    // [AddTask.name]: AddTask,
    // [TaskItemInfo.name]: TaskItemInfo,
    [Dragger.name]: Dragger,
    Topbar,
    Nav,
    Footer
    // Subnav
  },
  computed: {
    ...mapState('task', {
      current: state => state.currentList
    }),
    ...mapState('app', {
      aboutPanelVisible: state => state.aboutPanelVisible
      // addTaskVisible: state => state.addTaskVisible,
      // addTaskType: state => state.addTaskType
    }),
    ...mapState('task', {
      taskItemInfoVisible: state => state.taskItemInfoVisible,
      currentTaskItem: state => state.currentTaskItem
    })
  },
  methods: {
    open (link) {
      this.$q.electron.shell.openExternal(link)
    },
    // onStatusChange () {
    //   this.changeCurrentList()
    // },
    changeCurrentList (status) {
      // console.log(status)
      this.$store.dispatch('task/changeCurrentList', status)
    },
    nav: function (status = 'active') {
      if (status === 'active' || status === 'waiting' || status === 'stopped') {
        this.changeCurrentList(status)
        this.$router.push({
          path: `/task/${status}`
        })
      } else {
        this.changeCurrentList(status)
        this.$router.push({
          path: `/preference/${status}`
        })
      }
    },
    showAboutPanel () {
      // if (is.renderer()) {
      //   this.$q.electron.ipcRenderer.send('command', 'application:about')
      // } else {
      this.$store.dispatch('app/showAboutPanel')
      // }
    }
  }
}
</script>
