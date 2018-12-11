<template>
<div >
    <div id="details">
        <div><img :src="pro[0].l_pic" ></div>
        <div class="details_center">
            <p>{{pro[0].l_name}}</p>
            <div class="details_price"><span>价格：</span><b>{{pro[0].l_price}}</b></div>
            <div class="details_shou">评论：{{pro[0].comment}}条 <span>收藏：{{pro[0].collect}}</span> </div>
            <div class="details_count">购买数量：
                <input type="text"   v-model="count">
                <!--加减号-->
                <div><span class="pro_sum" @click="countSum"><i></i></span>
                <span class="pro_sub" :class="isCount?'disabled':''" @click="countSub" ><i></i></span></div>
            </div>
            <div class="details_buy">
                <a href="#" class="add_cart" @click="addCart($event)"><i></i>加入购物车</a>
                <router-link to='/shopcart' class="buy">立即购买</router-link>
            </div>
            <div class="details_promise"><span>产品保证</span> <i></i>正品保证 <i></i>快速发货</div>
        </div>
    </div>
 </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default{
    
    data(){
        return{
            list:[],
            pro:[],
            count:1,
            isCount:true,
        }},
    methods:{
         getProduct(){
            this.axios.get("products/product",{params:{"id":this.id}})
            .then(result=>{
                this.pro=result.data
                console.log(this.pro)
            })
        },
        countSub(){
            if(this.count>1){
                this.count--;
                this.isCount=false
            }else if(this.count==1){
                this.isCount=true
            }
        },
        countSum(){
            this.isCount=false
            this.count++;
        },
        addCart(e){
            e.preventDefault();
            
            if(sessionStorage.getItem('uid')==null){
                if(confirm('请先登录')){
                    location.href='http://localhost:8080/#/login'
                }
            }else{
                this.axios.get('cart/add',{params:{"lid":this.pro[0].lid,
                                    'uid':sessionStorage.getItem('uid'),
                                    'count':this.count
                                            }
                                })
                .then((result)=>{
                    Toast(result.data)
                })
            }
        }
    },
    watch(){this.countSub()},
    created(){
        this.getProduct()
    },
    props:["name","id"]
}
</script>
<style scoped>
    *{
        margin: 0;
        padding: 0;
        box-sizing:border-box;
    }

    #details{
        width: 1200px;
        height:800px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        padding-top: 40px;
    }
    #details>div>img{
        width: 400px;
        height: 400px;
        border: 2px solid #eee;
    }
    #details>div.details_center{
        width: 735px;
        padding-left: 60px;
        color: #585858;
    }
    /*商品名称*/
    #details>div.details_center>p{
        font-size: 20px;
    }
    /*商品价格*/
    #details>div.details_center>div.details_price{
        margin: 25px 20px;
        height: 50px;
        line-height: 50px;
    }
    #details>div.details_center>div.details_price>span{
        line-height: 40px !important;
    }
    #details>div.details_center>div.details_price>b{
        color: #FF6537;
        font-size: 35px;
        line-height: 50px;
        padding-top: 15px;
    }
    #details>div.details_center>div.details_price b:before{
        content: "￥";
        font-size: 24px;
        line-height: 46px;
    }
    /* 评论 收藏*/
    #details>div.details_center>div.details_shou{
        color: #666;
        border-top:1px solid  #eee;
        width: 544px;
        border-bottom:1px solid  #eee;
        margin-bottom: 30px;
        height: 74px;
        line-height: 74px;
        padding-left: 20px;
    }
    #details>div.details_center>div.details_shou span:before{
        content: "|";
        padding-left: 20px;
        color:#eee;
        padding-right: 20px;
    }
    /*购买数量*/
    #details>div.details_center>div.details_count{
        position: relative;
    }
    #details>div.details_center>div.details_count>input{
        width: 55px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        border: 1px solid #ddd;
    }
    #details>div.details_center>div.details_count>div{
        display: flex;
        position: absolute;
        flex-wrap: wrap;
        left: 150px;
        top: 0;
        width: 16px;
    }
    #details>div.details_center>div.details_count>div>span{
        display: inline-block;
        width: 16px;
        height: 16px;
        border: 1px solid #eee;
        margin-bottom:6px;
        text-align: center;
        line-height: 16px;
        cursor: pointer;
    }
    #details>div.details_center>div.details_count>div>span.disabled,span.disabled i{
        border-top-color: #dedede !important;
        cursor: default;
    }
    #details>div.details_center>div.details_count>div>span i{
        display: inline-block;
        border: 5px solid transparent;
        border-top-color: #9a9a9a;
    }
    #details>div.details_center>div.details_count>div>span.pro_sum i{
        transform:rotate(180deg);
        margin-bottom: 5px;
    }
    /*加入购物车*/
    #details>div.details_center>div.details_buy{
        margin: 30px 0;
    }
    #details>div.details_center>div.details_buy>a{
        width: 160px;
        height:42px;
        text-align: center;
        line-height: 40px;
        display: inline-block;
        text-decoration: none;
        color: #ff6537;
        font-size: 14px;
        border-radius:3px;
        border: 1px solid #ff6537;
    }
    #details>div.details_center>div.details_buy>a.add_cart i{
        width: 25px;
        height: 24px;
        display: inline-block;
        background: url("../../public/img/shopcart.png");
        vertical-align: middle;
        margin-right: 10px;
    }
    #details>div.details_center>div.details_buy>a.buy{
        background-color: #ff6537;
        color: #fff;
        margin-left: 20px;
    }
    /*产品保障*/
    #details>div.details_center>div.details_promise>span{
        margin-right: 20px;
    }
    #details>div.details_center>div.details_promise>i{
        height: 18px;
        width: 18px;
        display: inline-block;
        background: url("../../public/img/duihao.png") no-repeat;
        vertical-align: middle;
        margin-left: 10px;
    }

</style>
