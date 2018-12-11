import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Index from './views/Index.vue'
import Kucun from './views/kucun.vue'
import Details from './views/Details.vue'
import Login from './views/login.vue'
import Common from './views/common.vue'
import Register from './views/register.vue'
import Shopcart from './views/shopcart.vue'
import Search from './views/search.vue'
Vue.use(Router)

export default new Router({
  //mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {path: '/',component: Home,children:[
      {path:"",component:Index},
      
      {path:"common",component:Common,children:[
        {path:"/kucun",component:Kucun},
        {path:"/details/:id",component:Details,props:true},
        {path:"/login",component:Login},
        {path:"/register",component:Register},
        {path:'/shopcart',component:Shopcart,beforeEnter:(to,from,next)=>{
                if(sessionStorage.getItem('uid')==null){
                  alert('请先登录')
                next({path:'/login'})
                }else
                next()
              }
        },
        {path:'/search/:kwords',component:Search,props:true}
      ]},
    ]
    },
    
  ]
})











































/*
import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Index from './views/Index'
import Details from './views/Details'
import Products from './views/Products'
import Login from './views/Login'
import NotFound from './views/NotFound'
//ES6

Vue.use(Router)

export default new Router({
  //mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    { path: '/', component: Home, children:[
        { path:"", component: Index },
        { path:"details/:lid", component: Details ,props:true},
        { path:"products/:kw", component: Products,props:true},
    ]},
    { path: '/login', component: Login },
    { path: '/*', component:NotFound }
  ]
})

*/