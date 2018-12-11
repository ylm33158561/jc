<template>
    <section id="section2">
        <h3><span>卫浴厨具</span></h3>
        <div class="productlist">
            <div>
                <router-link :to="`/details/${bathPro[5].lid}`"></router-link><img :src="bathPro[5].l_pic" >
                <div><router-link :to="`/details/${bathPro[5].lid}`">{{bathPro[5].l_name}}</router-link><div></div><span><b>￥</b>{{bathPro[5].l_price.slice(0,-3)}}<b>.00</b></span></div>
            </div>
            <div v-for="item in bathPro.slice(-3)" :data-bid="item.lid">
                <router-link :to="`/details/${item.lid}`"></router-link>
                <img :src="item.l_pic" >
                <div>
                <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                <div></div><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
            
        </div>

        <h3><span>地板瓷砖</span></h3>
        <div class="productlist">
            <div v-for="item in tilePro.slice(-4)" :data-tid="item.lid">
                <router-link :to="`/details/${item.lid}`"></router-link>
                <img :src="item.l_pic" >
                <div>
                    <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                    <div></div><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
            
        </div>

        <h3><span>灯具吊顶</span></h3>
        <div class="productlist">
            <div v-for="item in lampsPro.slice(-4)" :data-lid="item.lid">
                <router-link :to="`/details/${item.lid}`"></router-link>
                <img :src="item.l_pic" >
                <div>
                <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                <div></div><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
            
        </div>

        <h3><span>门窗门帘</span></h3>
        <div class="productlist">
            <div v-for="item in curtainPro.slice(0,4)" :data-cid="item.lid">
                <router-link :to="`/details/${item.lid}`"></router-link>
                <img :src="item.l_pic" >
                <div>
                    <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                    <div></div><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
            
        </div>

        <h3><span>五金建材</span></h3>
        <div class="productlist" >
            <div v-for="item in toolPro" :data-cid="item.lid">
                <router-link :to="`/details/${item.lid}`"></router-link>
                <img :src="item.l_pic" >
                <div>
                    <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                    <div></div><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
           
        </div>
    </section>
</template>
<script>
 export default{
     data(){return {
          newPro:[],
            bathPro:[],
            tilePro:[],
            lampsPro:[],
            curtainPro:[],
            toolPro:[]
     }},
     methods:{
          /* 图片  */ 
        getImg(){
            this.axios.get(`products/proList?fid=1`)
            .then(result=>{
                this.newPro=result.data
            });
            this.axios.get(`products/proList?fid=2`)
            .then(result=>{
                this.bathPro=result.data
            });
            this.axios.get(`products/proList?fid=3`)
            .then(result=>{
                this.tilePro=result.data
            });
            this.axios.get(`products/proList?fid=4`)
            .then(result=>{
                this.lampsPro=result.data
            });
            this.axios.get(`products/proList?fid=5`)
            .then(result=>{
                this.curtainPro=result.data
            });
            this.axios.get(`products/proList?fid=6`)
            .then(result=>{
                this.toolPro=result.data
            });
        },
     },
     created(){
         this.getImg()
         
     }
 }
</script>
<style scoped>
    #header>div.n_header>div.nav>div:hover>ul{
        display: block;
    }
    #section2>h3{
        width: 1200px;
        margin: 0 auto;
        border-bottom: 1px solid #eee;
        padding-bottom: 15px;
        margin-bottom: 30px;
    }
    #section2>h3>span{
        color: #ff6637;
        font-weight: normal;
        border-bottom: 1px solid #ff6537;
        padding-bottom: 15px;
    }

    #section2>div.productlist{
        width: 1190px;
        height: 352px;
        margin: 0 auto;
    }
    #section2>div.productlist img{
        width: 250px;
        height: 250px;
    }
    #section2>div.productlist>div>a{
        display: block;
        border: 1px solid #ddd;
        position: absolute;
        top: 0;
        width: 250px;
        height: 250px;
        transition: all 0.5s linear;
        opacity: 0;
    }
    #section2>div.productlist>div>a:hover{
        opacity: 1;
    }
    #section2>div.productlist>div{
        width: 250px;
        height: 342px;
        float: left;
        margin: 5px 20px;
        position: relative;
    }
    #section2>div.productlist>div>div{
        text-align: center;
    }
    #section2>div.productlist>div>div>a{
        text-decoration: none;
        color: #66667d;
        font-size: 14px;
    }
    #section2>div.productlist>div>div>div{
        margin: 5px 0;
        border-top: 1px dashed #ddd;
        width: 100%;
    }
    #section2>div.productlist>div>div>span>b{
        font-weight: normal !important;
        font-size: 13px;
    }
    #section2>div.productlist>div>div>span{
        font-size: 17px;
        color: #ff6637;
        font-weight: bold;
    }


</style>
