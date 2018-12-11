<template>
    <header id="header">
        <!-- 登录 注册 购物车-->
        <div class="t_header">
            <div>
                <div class="h_left" @click="shopcart">
                    <span class="cart_icon"></span>
                    <span>购物车</span>
                    <span></span>
                    <div>
                        <span>您的购物车内暂时没有任何产品。</span>
                        
                        <div>去购物车结算</div>
                    </div>
                </div>
                <div class="h_right" :class="islogin==0?'':'hidden'">
                    <router-link to="/login">登录</router-link>
                    <router-link to="/register">注册</router-link>
                </div>
                <div class="h_right" :class="islogin==0?'hidden':''">
                    <span>欢迎你：{{uname}}</span>
                    <a href="#" @click="signinOut">注销</a>
                </div>
            </div>
        </div>
        <!-- logo 搜索框 -->
        <div class="l_header">
            <h1><img src="../../public/img/logo.png" alt=""></h1>
            <div class="h_search">
                <input type="text" v-model="kwords">
                <div class="search_btn" @click='search'><i></i></div>
                <span>硅藻泥</span><span>大理石</span><span>热水器</span><span>灯具</span>
            </div>
        </div>
        <!-- 导航条 -->
        <div class="n_header">
            <div class="nav">
                <!--行业分类-->
                <div @click="navHide">
                    <i></i>
                    行业分类
                    <ul>
                        <li>
                            <a href="#">卫浴、厨具</a><i></i>
                            <div><a href="#">卫浴</a><a href="#">厨具</a></div>
                        </li>
                        <li>
                            <a href="#">地板、砖瓦</a><i></i>
                            <div><a href="#">瓷砖</a><a href="#">地板</a></div>
                        </li>
                        <li>
                            <a href="#">灯具、吊顶</a><i></i>
                            <div><a href="#">吊顶</a><a href="#">灯具</a></div>
                        </li>
                        <li>
                            <a href="#">门窗、窗帘</a><i></i>
                            <div><a href="#">窗帘</a><a href="#">门窗</a></div>
                        </li>
                        <li>
                            <a href="#">五金、钢材</a><i></i>
                            <div><a href="#">钢材</a><a href="#">五金</a></div>
                        </li>
                    </ul>
                </div>
                <!--导航-->
                <ul >
                    <li :class="`url==''?on:''`" @click="routerA">
                        <router-link to="/" > 首页</router-link>
                    </li>
                    <li @click="routerA" :class="url=='kucun'?on:''">
                        <router-link to="/kucun" >产品库存</router-link>
                    </li>
                    <li @click="routerA">
                        <router-link to="#" >新品热卖</router-link>
                    </li>
                    <li @click="routerA">
                        <router-link to="#">建材加盟</router-link>
                    </li>
                    <li @click="routerA">
                        <router-link to="#">建材新闻</router-link>
                    </li>
                </ul>
            </div>
        </div>
    </header>
</template>
<script>
export default{
   /* 行业分类点击事件 */
   data(){return{
       uname:'',
       islogin:0,
       kwords:'',
       url:sessionStorage.getItem('url')
   }},
    methods:{
        navHide(){
           $("div.nav>div").children('ul').toggle()
        },
        routerA(e){
            var $a = $(e.target)
            $a.parent().addClass("on")
            .siblings().removeClass("on")
        },

        hide(){
            if(location.href.indexOf("kucun")!=-1){
                $("div.n_header>div.nav>ul>li:nth-child(2)").addClass("on")
            } 
        },
        //是否登录
        isLogin(){
            var uid = sessionStorage.getItem('uid')
           
            if(uid != null){
                this.islogin=1
                this.$http.get('users/islogin?id='+uid)
                .then((result)=>{
                    this.uname=result.data.uname
                })
            }else{
                this.islogin=0
            }
        },
        //注销
        signinOut(){
           sessionStorage.removeItem('uid')
            this.isLogin()
        },
        //搜索
        search(){
            this.$router.push('/search/'+this.kwords)
           location.reload()
        },
        //购物车
        shopcart(){
            this.$router.push('/shopcart')
        }
    },
    created(){
       this.hide();
       this.isLogin();
       //保存上一页地址
        var url = location.href.split("#")[1].slice(1)
        sessionStorage.setItem('url',url)
        console.log(this.url=='kucun')
    }
}

</script>
<style scoped>
        /*********** header样式 *************/
        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    #header{
        width: 100%;
        height: 210px;
    }
    #header div.hidden{
        display:none;
    }
    /*   登录 注册 购物车  */
    #header div.t_header{
        height: 37px;
        width: 100%;
        background: url("../../public/img/white_bg.png") repeat-x;
        position: fixed;
        top: 0;
        z-index: 20;
    }
    #header>div.t_header>div{
        width:1200px;
        height:37px;
        margin: auto;
    }
    #header>div.t_header>div>div.h_left{
        width: 90px;
        height: 39px;
        float: left;
        cursor: pointer;
        position: relative;
    }
    #header>div.t_header>div>div.h_left:hover{
        background: #fff;
    }
    #header>div.t_header>div>div.h_left .cart_icon{
        width: 20px;
        height:35px;
        float: left;
        margin: 10px 5px 0 2px;
        background: url("../../public/img/mallcart_icon.gif") no-repeat;
        vertical-align: middle;
        line-height: 35px;
    }
    #header>div.t_header>div>div.h_left span:nth-child(2){
        display: inline-block;
        width: 42px;
        height: 35px;
        line-height: 35px;
        font-size: 14px;
        color: #7c7c7c;
    }
    #header>div.t_header>div>div.h_left span:nth-child(3){
        float: right;
        width: 10px;
        height: 35px;
        background: url("../../public/img/mallcart_down.gif") no-repeat;
    background-position-x:50% ;
        background-position-y:50% ;
        transition: all 0.3s linear;
    }
    #header>div.t_header>div>div.h_left>div{
        width: 290px;
        height: 114px;
        background: #fff;
        border: 1px solid #eee;
        position: absolute;
        cursor: default;
        top: 35px;
        left:-199px;
        display:none;
    }
    #header>div.t_header>div>div.h_left>div span{
        font-size: 14px;
        color: #7c7c7c;
        padding-left:40px;
        line-height: 50px;
    }
    #header>div.t_header>div>div.h_left>div>div{
        width: 135px;
        margin: 10px auto;
        background: #ff5a00;
        text-align: center;
        line-height: 40px;
        color: #fff;
        font-size: 14px;
        height:40px;
        cursor: pointer;
    }
    #header>div.t_header>div>div.h_left:hover span:nth-child(3){
        transform: rotate(180deg);
    }
    #header>div.t_header>div>div.h_left:hover>div{
        display: block;
    }
    #header>div.t_header>div>div.h_right{
        width: 220px;
        height:37px;
        float: right;
    }
    #header>div.t_header>div>div.h_right>a{
        padding: 3px 20px;
        height: 24px;
        font-size: 15px;
        text-decoration: none;
        line-height: 35px;
        border-radius: 2px;
    }
    #header>div.t_header>div>div.h_right>a:nth-child(1){
        color: #7c7c7c;
        border: 1px solid #dadada;
        margin-right: 10px;
    }
    #header>div.t_header>div>div.h_right>a:nth-child(2){
        color: white;
        background: #45a2ff;
    }
    #header>div.t_header>div>div.h_right>a:nth-child(1):hover{
        color: #45a2ff;
        border-color: #45a2ff;
    }

    /*  logo  搜索  */
    #header div.l_header{
        padding-top:60px ;
        width: 1200px;
        margin: 0 auto;
    }
    #header div.l_header h1{
        float: left;
        position:relative;
    }
    #header div.l_header h1>img{
        width:180px;
        height:180px;
        position:absolute;
        top:-50px;
        left:50px;
    }
    #header div.l_header div.h_search{
        height: 38px;
        width: 350px;
        margin: 0 auto;
    }
    #header div.l_header div.h_search input{
        outline: none;
        height:38px;
        width:258px;
        float: left;
        border: 1px solid #aaa;
        border-right: none;
        padding-left: 10px;
        font-size: 16px;
    }
    #header div.l_header div.h_search>div.search_btn{
        width: 75px;
        height: 38px;
        background: #ff6537;
        float: left;
        text-align: center;
        cursor: pointer;
        padding-top: 4px;
    }
    #header div.l_header div.h_search>div.search_btn i{
        display: inline-block;
        background: url("../../public/img/icon_sprite.png") no-repeat;
        width: 30px;
        height: 30px;
        background-position: 3px -257px;
    }
    #header div.l_header div.h_search>span{
        font-size: 14px;
        color: #666;
        padding: 5px;
        float: left;
        cursor: pointer;
    }
    /*  nav导航  */
    #header>div.n_header{
        height:50px;
        background: #ff6537;
        margin-top: 60px;
    }
    #header>div.n_header>div.nav{
        width: 1200px;
        margin: 0 auto;
        color: #fff;
        font-size: 16px;
    }
    #header>div.n_header>div.nav div,ul{
        float: left;
        list-style: none;
        line-height: 50px;
        position: relative;
    }
    #header>div.n_header>div.nav>div{
        width: 214px;
        height: 50px;
        text-align: center;
        margin-right: 80px;
        cursor: pointer;
    }
    #header>div.n_header>div.nav>div>i{
        display: inline-block;
        width: 15px;
        height:15px;
        background: url("../../public/img/vbg01.png") no-repeat;
        background-position: 0 -1478px;
        float: left;
        margin:17px -10px 20px 20px;
    }
    #header>div.n_header>div.nav>ul>li{
        float: left;
        width: 120px;
        height:50px;
        line-height:50px;
        text-align: center;
        margin-right: 5px;
    }
    #header>div.n_header>div.nav>ul>li a{
        color: #fff;
        text-decoration: none;
        width: 100px;
        height:50px;
        float: left;
        margin: 0 10px;
    }
    #header>div.n_header>div.nav>ul>li:hover{
        background: #FFC001;
    }
    #header>div.n_header>div.nav>ul>li.on{
        background: #FFC001;
    }

    #header>div.n_header>div.nav>div>ul{
        width: 214px;
    transition: all 0.5s linear;
        float: left;
        background: #f7f7f7 !important;
        position: absolute;
        top: 50px;
        display:none;
    }
    #header>div.n_header>div.nav>div>ul>li{
        width: 213px;
        height: 65px;
        padding-left: 12%;
        line-height: 65px;
        position: relative;
    }
    #header>div.n_header>div.nav>div>ul>li a{
        text-decoration: none;
        display: inline-block;
        color: #484848;
        padding-right: 40%;
        height: 65px;
    }
    #header>div.n_header>div.nav>div>ul>li>i{
        float: right;
        background: url("../../public/img/vbg01.png") no-repeat;
        width: 15px;
        height:15px;
        background-position: 0 -1571px;
        margin-top: 25px;
    }
    #header>div.n_header>div.nav>div>ul>li>div{
        position: absolute;
        width: 40px;
        height: 325px;
        background: white;
        display: none;
        top: -1px;
        left: 212px;
        -webkit-transition:width 3s linear;
    }
    #header>div.n_header>div.nav>div>ul>li:hover>div{
        width: 262px;
        display: block;
        background: white;
        border: 1px solid #ff6537;
        border-left: none;
        z-index: 5;
    }
    #header>div.n_header>div.nav>div>ul>li:hover{
        background: white;
        border-width: 1px ;
        border-color: #ff6537;
        border-style:solid ;
        border-right-width: 0;
    }
    #header>div.n_header>div.nav>div>ul:hover>li:not(:hover){
        border-right:1px solid #ff6537;
    }

    #header>div.n_header>div.nav>div>ul>li:hover>div>a{
        text-decoration: none;
        padding: 0 40px;
        display: block;
        color:#222;
    }
    #header>div.n_header>div.nav>div>ul>li:hover a:hover{
        color: #ff6537;
    }
    #header>div.n_header>div.nav>div>ul>li:nth-child(2) div{
        top: -66px;
    }
    #header>div.n_header>div.nav>div>ul>li:nth-child(3) div{
        top: -131px;
    }
    #header>div.n_header>div.nav>div>ul>li:nth-child(4) div{
        top: -196px;
    }
    #header>div.n_header>div.nav>div>ul>li:nth-child(5) div{
        top: -261px;
    }
</style>