<template>
    <q-table
      class="my-sticky-header-table"
      :data="data"
      :columns="columns"
      row-key="name"
      dark
      :dense="$q.screen.gt.md"
    />
</template>
<script>
export default {
  created () {
    // loadData () {
    //   this.$axios.get('http://bt.ituoniao.com.cn/api/search?source=%E7%A7%8D%E5%AD%90%E6%90%9C&keyword=%E6%B3%B0%E5%85%B0%E8%92%82%E4%BA%9A&page=1&sort=time')
    //     .then((response) => {
    //       // this.data = response.data
    //       console.log(response)
    //     })
    //     .catch(() => {
    //       this.$q.notify({
    //         color: 'negative',
    //         position: 'top',
    //         message: 'Loading failed',
    //         icon: 'report_problem'
    //       })
    //     })
  },
  data () {
    return {
      columns: [
        {
          name: '名称',
          required: true,
          label: '名称',
          align: 'left',
          field: row => row.name,
          format: val => `${val}`,
          sortable: true
        },
        { name: '大小', align: 'center', label: '大小', field: 'calories', sortable: true },
        { name: '人气', label: '人气', field: 'fat', sortable: true },
        { name: '发布时间', label: '发布时间', field: 'carbs', sortable: true },
        { name: '操作', label: '操作', field: 'protein', sortable: true }
      ],
      data: [
        {
          name: 'Frozen Yogurt',
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          sodium: 87
        },
        {
          name: 'Ice cream sandwich',
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          sodium: 129
        },
        {
          name: 'KitKat',
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          sodium: 54,
          calcium: '12%',
          iron: '6%'
        }
      ]
    }
  }
}
</script>
<style lang="sass">
  .my-sticky-header-table
    /* max height is important */
    /*.q-table__middle*/
    /*  max-height: 200px*/

    /*.q-table__top,*/
    /*.q-table__bottom,*/
    /*thead tr:first-child th*/
    /*background-color: #c1f4cd*/

    thead tr:first-child th
      position: sticky
      top: 0
      opacity: 1
      z-index: 1
</style>
