<template>
     <section id="section" class="section">
        <div class="c_section"><h3><span>购物车</span></h3></div>
        <div class="shopcart">
            <ul>
                <li class="shopcart-title">
                    <div class="pro-title">商品</div>
                    <div class="pro-price">价格</div>
                    <div class="pro-count">数量</div>
                    <div class="pro-sumprice">小计</div>
                    <div class="pro-btn">操作</div>
                </li>
                <li class="shopcart-item" v-for="(item,index) in proItems" :key="index">
                    <input type="checkbox" :value="item" v-model="check_goods">
                    <div class="shopcart-item-title">
                        <img :src="item.l_pic" >
                        <span>{{item.l_name}}</span>
                    </div>
                    <div class="shopcart-item-price">￥ {{item.l_price}}</div>
                    <div class="shopcart-item-count">
                        <input type="text" v-model="item.count">
                        <div>
                            <span class="pro-sum" @click='countSum(item)'>+</span>
                            <span class="pro-sub " :class="isCount==0?disabled:''" @click='countSub(item)'>-</span>
                        </div>
                    </div>
                    <div class="shopcart-item-total">￥ {{item.l_price*item.count}}</div>
                    <div class="shopcart-item-del"><a  @click="deleteGoods($event,index,item.lid)">移除</a></div>
                </li>
               
              
                <li class="shopcart-item ">
                    <label><input type="checkbox" :checked='check_goods.length == proItems.length' @click="check_all"> 全选</label>
                    <p>商品总金额：<span >￥ {{total_price}}</span></p>

                </li>
                <div class="shopcart-payment">
                    <p>应付金额：<span>￥{{total_price}}</span></p>
                    <p><router-link to="/kucun">继续购物</router-link><button>结算订单</button></p>
                </div>
            </ul>
        </div>
    </section>    
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return{
                isCount:1,
                proItems:[],
                check_goods:[]
            }
        },
        methods:{
            //商品数量
            countSub(item){
                if(item.count==1){
                    this.isCount=0

                }else{
                item.count--
               }
            },
            countSum(item){
               item.count++
            },
            getTotal(){

            },
            //获取购物车数据
            getCart(){
                var url = `cart/cartItems?uid=${sessionStorage.getItem('uid')}&pno=${0}`
                this.axios.get(url)
                .then((result)=>{
                    this.proItems=result.data.products
                   
                })
            },
            //获取购物车被选中的商品
            check_all(){
                
               if (this.check_goods.length >0) {
                    this.check_goods = []
                } else {
                    this.proItems.forEach(item => {
                        this.check_goods.push(item)
                    })
                    console.log(this.check_goods)
                }
            },
            //移除商品
            deleteGoods(e,index,id){
                e.preventDefault();
                if(confirm('是否移除该商品')){
                    this.axios.get('cart/delItems',{params:{lid:id}})
                        .then((result)=>{
                            Toast(result)
                            location.reload()
                        })
                   /* this.proItems.splice(index,1)
                    this.check_goods.forEach((item,index)=>{
                        if(item.lid == id){
                        this.check_goods.splice(index,1)
                        
                        }
                    })*/
                }
            }
        },
        computed:{
            total_price(){
                var price = 0
                this.check_goods.forEach(item=>{
                    price += parseInt(item.l_price*item.count)
                })
                return price
            }
        },
        created(){
            this.getCart()
            this.countSum()

             
        }
    }
</script>
<style scoped>
    #section>div.shopcart{
    width: 1200px;
    margin: 0 auto;
    }
    #section>div.c_section{
    width: 1200px;
    margin: 20px auto;
}
#section>div.c_section h3{
    border-bottom: 1px solid #eee;
    padding-bottom: 15px;
    margin-bottom: 30px;
}
#section>div.c_section h3 span{
    color: #ff6637;
    font-weight: normal;
    border-bottom: 1px solid #ff6537;
    padding-bottom: 15px;
}
    #section>div.shopcart>ul{
        list-style: none;
        color: #666;
        margin-bottom:100px;
    }
    #section>div.shopcart>ul>li.shopcart-title{
        height: 43px;
        line-height: 43px;
        background: #f8f8f8;
        display: flex;
        justify-content: center;
    }
    #section>div.shopcart>ul>li.shopcart-title>div{
        float: left;
        text-align: center;
    }
    #section>div.shopcart>ul>li.shopcart-title>div.pro-title{
        width: 580px;
    }
    #section>div.shopcart>ul>li.shopcart-title>div:not(.pro-title){
        width: 150px;
    }

    #section>div.shopcart>ul>li.shopcart-item{
        height: 100px;
        border-bottom: 1px solid #eaeaea;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    #section>div.shopcart>ul>li.shopcart-item input[type=checkbox]{
        width: 15px;
        height: 15px;
        background-color: #fff;
        -webkit-appearance:none;
        border: 1px solid #c9c9c9;
        border-radius: 2px;
        outline: none;
    }
    #section>div.shopcart>ul>li.shopcart-item input:checked:before{
        color: #ff6537;
        display: inline-block;
        content:"\2713";
        margin: -3px 2px;
    }

    #section>div.shopcart>ul>li.shopcart-item>div:not(.shopcart-item-title){
        width: 150px;
        text-align: center;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-title{
    text-align: left;
        width: 580px;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-title>img{
        width: 80px;
        height: 80px;
        vertical-align: middle;
        margin: 0 40px;
    }

    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count{
        position: relative;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>input{
        width: 55px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        border: 1px solid #ddd;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>div{
        display: flex;
        position: absolute;
        flex-wrap: wrap;
        left: 110px;
        top: 0;
        width: 16px;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>div>span{
        display: inline-block;
        width: 16px;
        height: 16px;
        border: 1px solid #eee;
        margin-bottom:6px;
        text-align: center;
        line-height: 16px;
        cursor: pointer;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>div>span.disabled,span.disabled i{
        border-top-color: #dedede !important;
        cursor: default;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>div>span i{
        display: inline-block;
        border: 5px solid transparent;
        border-top-color: #9a9a9a;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-count>div>span.pro-sum i{
        transform:rotate(180deg);
        margin-bottom: 5px;
    }

    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-total{
        color: #ff7d37;
    }

    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-del>a{
        text-decoration:none;
        color: #444;
        margin-left: -10px;
    }
    #section>div.shopcart>ul>li.shopcart-item>div.shopcart-item-del>a:hover{
        color: #ff6637;
    }

    #section>div.shopcart>ul>div.shopcart-payment{
        display: flex;
        height:120px;
        flex-direction: column;
        justify-content: space-around;
        align-items: flex-end;
    }
    #section>div.shopcart>ul>div.shopcart-payment>p:first-child span{
        font-size: 35px;
        margin-left: 50px;
        color: #ff6637;
    }
    #section>div.shopcart>ul>div.shopcart-payment>p:last-child a{
        text-decoration:none;
        color:#555;
    }
    #section>div.shopcart>ul>div.shopcart-payment>p:last-child>button{
        width: 180px;
        height:42px;
        background: #ff6537;
        color: white;
        text-align: center;
        border: none;
        margin-left: 30px;
        font-size: 18px;
        font-weight: bold;
        cursor:pointer;
    }

</style>