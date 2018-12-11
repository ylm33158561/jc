<template>
    <section id="section" class="section">
    <div class="c_section"><h3><span>搜索</span></h3></div>
    <div class="productlist">
        <div v-for="item in pro">
            <a href="#"></a><img :src="item.l_pic" >
            <div><a href="#">{{item.l_name}}</a><div></div><span><b>￥</b>
            {{item.l_price.slice(0,-3)}}<b>.00</b></span></div>
        </div>
    </div>
</section>
</template>
<script>
    export default{
        data(){
            return {
                pro:[]
            }
        },
        methods:{
            search(){
                console.log(this.kwords)
                this.axios.get('products/search',{params:{'kwords':this.kwords}})
                .then((result)=>{
                    this.pro = result.data
            })
            }
        },
        created(){
            this.search()
        },
        props:['kwords']
    }
</script>
<style scoped>
    #section{
        height:800px
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
    #section>div.productlist{
    width: 1190px;
    height: 352px;
    margin: 0 auto;
    }
    #section>div.productlist img{
        width: 250px;
        height: 250px;
    }
    #section>div.productlist>div>a{
        display: block;
        border: 1px solid #ddd;
        position: absolute;
        top: 0;
        width: 250px;
        height: 250px;
        transition: all 0.5s linear;
        opacity: 0;
    }
    #section>div.productlist>div>a:hover{
        opacity: 1;
    }
    #section>div.productlist>div{
        width: 250px;
        height: 342px;
        float: left;
        margin: 5px 20px;
        position: relative;
    }
    #section>div.productlist>div>div{
        text-align: center;
    }
    #section>div.productlist>div>div>a{
        text-decoration: none;
        color: #66667d;
        font-size: 14px;
    }
    #section>div.productlist>div>div>div{
        margin: 5px 0;
        border-top: 1px dashed #ddd;
        width: 100%;
    }
    #section>div.productlist>div>div>span>b{
        font-weight: normal !important;
        font-size: 13px;
    }
    #section>div.productlist>div>div>span{
        font-size: 17px;
        color: #ff6637;
        font-weight: bold;
    }

</style>