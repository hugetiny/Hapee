
const routes = [
  {
    path: '/',
    component: () => import('layouts/Layout.vue'),
    children: [
      { path: '/search', component: () => import('components/Search/SearchResult.vue') },
      { path: '/', component: () => import('pages/PageUsers.vue') },
      { path: '/chat/:otherUserId', component: () => import('pages/PageChat.vue') },
      { path: '/auth', component: () => import('pages/PageAuth.vue') },
      {
        path: '/task',
        component: () => import('components/Task/Index'),
        alias: '/',
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
      }
    ]
  }
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('layouts/Layout.vue')
  })
}

export default routes
