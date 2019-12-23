<template>
    <q-table
      dark
      dense
      :loading="loading"
      :data="data"
      :columns="columns"
      row-key="name"
    >
      <template v-slot:body="props">
        <q-tr :props="props">
<!--          <q-td auto-width>-->
<!--            <q-toggle dense v-model="props.selected" />-->
<!--          </q-td>-->
          <q-td class="action" key="action" :props="props">
            <!--            <q-btn-group >-->
            <!--              <q-btn size="md" dense color="primary" label="One" />-->
            <!--              <q-btn size="md" dense color="primary" label="Two " />-->
            <!--            </q-btn-group>-->
            <!--            <div class="q-gutter-md" >-->
            <q-btn dense round flat icon="arrow_downward"/>
<!--            <q-btn dense round flat icon="cloud"/>-->
            <!--            </div>-->
          </q-td>
          <q-td key="name" class="name" :props="props">
            <q-btn dense round flat :icon="props.expand ? 'arrow_drop_up' : 'arrow_drop_down'" @click="props.expand = !props.expand" />
            {{ props.row.name }}
<!--            <q-popup-edit dark v-model="props.row.name">-->
<!--              <q-input :placeholder="props.row.name" label="Local file name" autofocus counter />-->
<!--            </q-popup-edit>-->
            <q-tooltip>
              {{ props.row.name }}
            </q-tooltip>
          </q-td>
          <q-td  key="size" :props="props">{{ props.row.size }}</q-td>
          <q-td   key="popularity" :props="props">{{ props.row.popularity }}</q-td>
          <q-td  key="source" :props="props">source</q-td>
          <q-td  key="time" :props="props">{{ props.row.time }}</q-td>

        </q-tr>
        <q-tr v-show="props.expand" :props="props">
          <q-td colspan="100%">
            <div class="text-left">This is expand slot for row above: {{ props.row.name }}.</div>
          </q-td>
        </q-tr>
      </template>
      <template v-slot:bottom>
        <!--TODO PULL TO SEARCH MORE-->
      </template>
    </q-table>
</template>
<script>
export default {
  beforeCreate () {

  },
  data () {
    return {
      loading: true,
      selected: [],
      columns: [
        { name: 'action',
          label: 'action',
          align: 'left',
          field: 'action',
          style: 'width:10px'
        },
        {
          // format: val => `${val}`,
          name: 'name',
          required: name,
          label: this.$t('name'),
          align: 'left',
          field: row => row.name,
          sortable: true
        },
        { name: 'size',
          label: this.$t('size'),
          align: 'left',
          field: 'size',
          sortable: true,
          style: 'width:10px'
        },
        { name: 'popularity',
          label: 'popularity',
          align: 'left',
          field: 'popularity',
          sortable: true,
          style: 'width:10px'
        },
        { name: 'time',
          label: 'time',
          align: 'left',
          field: 'time',
          sortable: true,
          style: 'width:10px'
        },
        { name: 'source',
          label: 'source',
          align: 'left',
          field: 'source',
          style: 'width:10px'
        }
      ],
      data: [
        {
          name: 'building',
          size: 159,
          popularity: 6.0,
          time: 24,
          source: 'av'
        },
        {
          name: 'test long Y1111111111111111111111ogu11111111111112',
          size: 159,
          popularity: 6.0,
          time: 24,
          source: 'av'
        }
      ]
    }
  }
}
</script>
<style lang="scss">
  table tr td {
    overflow: hidden;
    text-overflow:ellipsis;
    white-space: nowrap;
    /*max-width: 4vw;*/
    &.name{
      max-width: 20vw;
     }
    /*&.action{*/
    /*  max-width: 20vw;*/
    /*}*/
  }
</style>
