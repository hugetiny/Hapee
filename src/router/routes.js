
const routes = [
  // {
  //   path: '/',
  //   component: () => import('src/basic/layouts/Layout.vue'),
  //   children: [
  //     { path: '/search/:search',
  //       component: () => import('src/basic/components/Search/SearchResult.vue'),
  //       props: true
  //     },
  //     // { path: '/chat', component: () => import('pages/PageUsers.vue') },
  //     // { path: '/chat/:otherUserId', component: () => import('pages/PageChat.vue') },
  //     // { path: '/auth', component: () => import('pages/PageAuth.vue') },
  //     {
  //       path: '/task',
  //       component: () => import('src/basic/components/Task/Index'),
  //       alias: '/',
  //       props: {
  //         status: 'active'
  //       }
  //     },
  //     {
  //       path: '/task/:status',
  //       name: 'task',
  //       component: () => import('src/basic/components/Task/Index'),
  //       props: true
  //     },
  //     {
  //       path: '/preference/basic',
  //       name: 'basic',
  //       component: () => import('src/basic/components/Preference/Basic')
  //     },
  //     {
  //       path: '/preference/advanced',
  //       name: 'advanced',
  //       component: () => import('src/basic/components/Preference/Advanced')
  //     },
  //     {
  //       path: '/videolist',
  //       name: 'videolist',
  //       component: () => import('src/basic/components/media/VideoList')
  //     },
  //     // {
  //     //   path: '/musiclist',
  //     //   name: 'musiclist',
  //     //   component: () => import('components/media/MusicList')
  //     // },
  //     // music
  //     {
  //       path: '/recommend',
  //       component: () => import('src/basic/components/recommend/recommend')
  //       // children: [
  //       //   {
  //       //     path: ':id',
  //       //     component: () => import('components/music-list/music-list')
  //       //   }
  //       // ]
  //     },
  //     {
  //       path: '/musiclist/:id',
  //       component: () => import('src/basic/components/music-list/music-list')
  //       // children: [
  //       //   {
  //       //     path: ':id',
  //       //     component: () => import('components/music-list/music-list')
  //       //   }
  //       // ]
  //     },
  //     {
  //       path: '/singer',
  //       component: () => import('src/basic/components/singer/singer'),
  //       children: [
  //         {
  //           path: ':id',
  //           component: () => import('src/basic/components/singer-detail/singer-detail')
  //         }
  //       ]
  //     },
  //     {
  //       path: '/rank',
  //       component: () => import('src/basic/components/rank/rank'),
  //       children: [
  //         {
  //           path: ':id',
  //           component: () => import('src/basic/components/rank-detail/rank-detail')
  //         }
  //       ]
  //     },
  //     {
  //       path: '/search',
  //       component: () => import('src/basic/components/search/search'),
  //       children: [
  //         {
  //           path: 'singer/:id',
  //           component: () => import('src/basic/components/singer-detail/singer-detail')
  //         },
  //         {
  //           path: 'list/:id',
  //           component: () => import('src/basic/components/music-list/music-list')
  //         }
  //       ]
  //     },
  //     {
  //       path: '/user',
  //       component: () => import('src/basic/components/user/user')
  //     }
  //     // music end
  //   ]
  // },
  {
    path: '/',
    name: 'main',
    component: () => import('components/Main'),
    children: [
      {
        path: '/search/:search',
        component: () => import('src/components/Search/SearchResult.vue'),
        props: true
      },
      {
        path: '/about',
        // alias: '/',
        component: () => import('components/About/AboutPanel')
      },
      {
        path: '/addtask',
        // alias: '/',
        component: () => import('components/Task/AddTask')
      },
      {
        path: '/task',
        // alias: '/',
        component: () => import('components/Task/Index'),
        props: {
          status: 'active'
        }
      },
      {
        path: '/task/:status',
        name: 'task',
        component: () => import('components/Task/Index'),
        props: true
      },
      {
        path: '/preference',
        name: 'preference',
        component: () => import('components/Preference/Index')
        // props: true
        // children: [
        //   {
        //     path: 'basic',
        //     alias: '',
        //     components: {
        //       // subnav: require('components/Subnav/PreferenceSubnav').default,
        //       form: require('components/Preference/Basic').default
        //     },
        //     props: {
        //       subnav: { current: 'basic' }
        //     }
        //   },
        //   {
        //     path: 'advanced',
        //     components: {
        //       // subnav: require('components/Subnav/PreferenceSubnav').default,
        //       form: require('components/Preference/Advanced').default
        //     },
        //     props: {
        //       subnav: { current: 'advanced' }
        //     }
        //   },
        //   {
        //     path: 'lab',
        //     components: {
        //       subnav: require('components/Subnav/PreferenceSubnav').default,
        //       form: require('components/Preference/Lab').default
        //     },
        //     props: {
        //       subnav: { current: 'lab' }
        //     }
        //   }
        // ]
      }
    ]
  }
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('components/Main')
  })
}

export default routes
