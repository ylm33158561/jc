<template>
    <section id="section">
        <div class="t_section">
            <!--轮播图-->
            <div class="carouse">
                <img class="hide " src="../../public/img/1.png" >
                <img class="hide show" src="../../public/img/2.png" >
            </div>
            <table class="company" >
                <thead>
                    <th>建材加盟</th>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="#">北京建材股份有限公司</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">上海建材股份有限公司</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">杭州建材股份有限公司</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">深圳建材股份有限公司</a></td>
                    </tr>
                </tbody>
                <tfoot><tr><td><a href="#"><img src="../../public/img/lxwm.png"></a></td></tr></tfoot>
            </table>
        </div>
        <div class="c_section">
            <!--  新推产品  -->
            <h3><span>新推产品</span></h3>
            <div class="x_product">
                <div v-for="item in newPro" :data-id="item.lid">
                    <p><img :src="item.l_pic" ></p>
                    <router-link :to="`/details/${item.lid}`" >{{item.l_name}}</router-link><span><b>￥</b>{{item.l_price.slice(0,-3)}}<b>.00</b></span>
                </div>
            </div>
            <!--  1F 卫浴厨具  -->
            <div class="floor">
                <img src="../../public/img/1f_o.png" >
                <span>1F 卫浴、厨具</span>
                <img src="../../public/img/1f.png">
                <img src="../../public/img/1f_ys.png" >
                <span class="f_text">精致卫浴厨具</span>
                <span>DELECATE</span>
                <div class="f">
                    <div v-for="item in bathPro.slice(0,6)" :data-bid="item.lid">
                        <router-link :to="`/details/${item.lid}`"><img :src="item.l_pic" ></router-link>
                        <router-link :to="`/details/${item.lid}`" :title="item.l_name">{{item.l_name}}</router-link>
                    </div>
                </div>
                <div class="f_r">
                    <div>
                        <span>{{bathPro[6].l_name}}</span><p>5分钟沸腾 2-7人分享</p>
                        <router-link :to="`/details/${bathPro[6].lid}`"><img :src="bathPro[6].l_pic" ></router-link>
                    </div>
                    <div :data-bid="bathPro[7].lid">
                        <p><span>{{bathPro[7].l_name}}</span><span>破壁免滤</span><span>约时约温</span></p>
                        <router-link :to="`/details/${bathPro[7].lid}`"><img :src="bathPro[7].l_pic" ></router-link>
                    </div>
                    <div :data-bid="bathPro[8].lid">
                        <p>{{bathPro[8].b_name}}</p><p>5分钟沸腾 2-7人分享</p>
                        <router-link :to="`/details/${bathPro[8].lid}`"><img :src="bathPro[8].l_pic" ></router-link>
                    </div>
                </div>
            </div>
            <!--  2F 地板瓷砖  -->
            <div class="floor floor_2f">
                <img src="../../public/img/2f_g.png" >
                <span>2F 地板、瓷砖</span>
                <img src="../../public/img/2f.png">
                <img src="../../public/img/2f_ys.png" >
                <span class="f_text">精致地板瓷砖</span>
                <span>DELECATE</span>
                <div class="f ">
                    <div v-for="item in tilePro.slice(0,6)">
                        <router-link :to="`/details/${item.lid}`"><img :src="item.l_pic"></router-link>
                        <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link>
                    </div>
                    
                </div>
                <div class="f_r">
                    <div><span>{{tilePro[6].l_name}}</span><p>质量非凡 优秀品质</p>
                        <router-link :to="`/details/${tilePro[6].lid}`"><img :src="tilePro[6].l_pic" ></router-link>
                    </div>
                    <div><p><span>{{tilePro[7].l_name}}</span><span>同样的价</span><span>格比质量</span></p>
                        <router-link :to="`/details/${tilePro[7].lid}`"><img :src="tilePro[7].l_pic" class="floor_2f_img"></router-link>
                    </div>
                    <div><p>{{tilePro[8].t_name}}</p><p>安装简便 便于清理</p>
                        <router-link :to="`/details/${tilePro[8].lid}`"><img :src="tilePro[8].l_pic" ></router-link>
                    </div>
                </div>
            </div>
            <!--  3F 灯具吊顶  -->
            <div class="floor floor_3f">
                <img src="../../public/img/3f_y.png" >
                <span>3F 灯具、吊顶</span>
                <img src="../../public/img/3f.png">
                <img src="../../public/img/3f_ys.png" >
                <span class="f_text">精致灯具吊顶</span>
                <span>DELECATE</span>
                <div class="f ">
                    <div :data-lid="lampsPro[0].lid">
                        <router-link :to="`/details/${lampsPro[0].lid}`">{{lampsPro[0].l_name}}</router-link>
                        <router-link :to="`/details/${lampsPro[0].lid}`"><img :src="lampsPro[0].l_pic"></router-link>
                    </div>
                    <div class="floor_3f_div" :data-lid="lampsPro[2].lid">
                        <router-link :to="`/details/${lampsPro[2].lid}`"><img :src="lampsPro[2].l_pic" class="floor_3f_img"></router-link>
                        <router-link :to="`/details/${lampsPro[2].lid}`" >{{lampsPro[2].l_name}}</router-link>
                    </div>
                    <div class="floor_3f_img1" :data-lid="lampsPro[1].lid">
                        <router-link :to="`/details/${lampsPro[1].lid}`">{{lampsPro[1].l_name}}</router-link>
                        <router-link :to="`/details/${lampsPro[1].lid}`"><img :src="lampsPro[1].l_pic"></router-link>
                    </div>
                </div>
                <div class="f_r">
                    <div :data-lid="lampsPro[3].lid">
                        <span>{{lampsPro[3].l_name}}</span><p>全屋灯具一站式购齐</p>
                        <router-link :to="`/details/${lampsPro[3].lid}`"><img :src="lampsPro[3].l_pic" ></router-link>
                    </div>
                    <div :data-lid="lampsPro[4].lid">
                        <p><span>{{lampsPro[4].l_name}}</span><span>一起买省</span><span>心又省钱</span></p>
                        <router-link :to="`/details/${lampsPro[4].lid}`"><img :src="lampsPro[4].l_pic" class="floor_3f_img2"></router-link>
                    </div>
                    <div class="floor_3f_div1" :data-lid="lampsPro[5].l_id">
                        <p>{{lampsPro[5].lname}}</p><p>多种色彩 任君选择</p>
                        <router-link :to="`/details/${lampsPro[5].lid}`"><img :src="lampsPro[5].l_pic" class="floor_3f_img3" ></router-link>
                    </div>
                </div>
            </div>
            <!--  热卖产品  -->
            <div class="center_fl">
                <h3 class="product"><span>热卖产品</span></h3>
                <div class="r_product">
                    <div v-for="item in curtainPro.slice(-3)" >
                    <router-link :to="`/details/${item.lid}`"><img :src="item.l_pic"></router-link>
                    <router-link :to="`/details/${item.lid}`">{{item.l_name}}</router-link></div>
                    
                </div>
            </div>
            <div class="center_fr">
                <h3 class="newlist"><span>建材新闻</span></h3>
                <table class="newsitem" >
                    <tbody>
                    <tr>
                        <td><a href="#">年后装修看过来 怎样刷墙费用节省？</a><a href="#">2018-9-26</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">小户型旧房改造你留意了吗？</a><a href="#">2018-9-26</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">沙发坐垫介绍 沙发坐垫选购技巧</a><a href="#">2018-9-26</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">膨胀罐安装注意事项</a><a href="#">2018-9-26</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">治水防水,防水材料选择需谨慎！</a><a href="#">2018-9-26</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</template>
<script>
export default{
    data(){
        return{
            newPro:[],
            bathPro:[],
            tilePro:[],
            lampsPro:[],
            curtainPro:[]
        } 
    },
    methods:{
        /* 图片  */ 
        getImg(){
            this.axios.get(`products/proList?fid=1`)
            .then(result=>{
                this.newPro=result.data
            });
            this.axios.get(`products/proList?fid=2`)
            .then(result=>{
                console.log(result.data)
                this.bathPro=result.data
            });
            this.axios.get(`products/proList?fid=3`)
            .then(result=>{
                console.log(result.data)
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
        }
        
    },
    created() {
       /*轮播图*/
        setInterval(function(){
            $("div.carouse>img.show").removeClass("show")
            .siblings().addClass("show")
        },6000)
        this.getImg()
    }
}
</script>
<style scoped>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    }
    #header>div.n_header>div.nav>div>ul{
        display:block !important;
    }
    #section{
        height: 2400px;
        clear: both;
        box-sizing: border-box;

    }
    #section>div.t_section{
        width: 1200px;
        margin: 0 auto;
        height: 330px;
    }
    /*  轮播图  */
    #section>div.t_section>div.carouse{
        width:770px;
        float: left;
        position: absolute;
        margin-left: 220px;
    }
    #section>div.t_section>div.carouse img{
        position: absolute;
        top: 0;
        left: 0;
    }
    #section>div.t_section>div.carouse img.show{
        opacity:1 !important;
    }
    #section>div.t_section>div.carouse img.hide{
        opacity:0;
        transition:all 1.5s linear;
    }
    /*  联系我们  */
    #section>div.t_section>table.company{
        width:199px;
        height: 326px;
        float: right;
    }
    #section>div.t_section>table.company>thead th{
        height:46px;
        color:#ff6637;
        text-align: left;
        border-bottom: 1px solid #ff6537;
    }
    #section>div.t_section>table.company>tbody tr+tr>td{
        height:40px;
        text-align: left;
        line-height: 40px;
        border-top:1px dotted #bbb ;
    }
    #section>div.t_section>table.company>tbody tr td>a{
        text-decoration: none;
        color: #666;
        font-size: 14px;
    }
    #section>div.t_section>table.company>tbody tr td>a:hover{
        color: #ff6537;
    }
    /*  新推产品  */
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
    #section>div.c_section>div.x_product div{
        width: 220px;
        height: 289px;
        float: left;
        margin: 5px 9px;
        text-align: center;
    }
    #section>div.c_section>div.x_product>div>span>b{
    font-weight: normal !important;
        font-size: 13px;
    }
    #section>div.c_section>div.x_product>div>span{
        font-size: 17px;
        color: #ff6637;
        font-weight: bold;
    }
    #section>div.c_section>div.x_product div>p{
        width: 218px;
        height: 220px;
        overflow: hidden;
        padding: 0;
        margin: 0;
    }
    #section>div.c_section>div.x_product div:hover{
        border: 1px solid #ff6537;
    }
    #section>div.c_section>div.x_product div>p img{
        width: 220px;
        height: 220px;
        transition: all .3s linear;
    }
    #section>div.c_section>div.x_product>div>p:hover img{
        transform:scale(1.2);
        border: 1px solid #ff6537;
    }
    #section>div.c_section>div.x_product div>a{
        text-decoration: none;
        color: #444;
        padding: 0 10px;
    }
    /*  1f 卫浴厨具 */
    #section>div.c_section>div.floor {
        width: 1190px;
        height:368px;
        margin: 30px auto;
        background: url("../../public/img/1f_.png") no-repeat;
        float: left;
        position: relative;
        background-size: 1190px;
    }
    #section>div.c_section>div.floor>img:nth-child(1){
        position: absolute;
        top: 0;
    }
    #section>div.c_section>div.floor>span{
        position: absolute;
        color: #fff;
        font-size: 22px;
        left: 37px;
        top: 7px;
    }
    #section>div.c_section>div.floor>img:nth-child(3){
        position: absolute;
        top: 48px;
    }
    #section>div.c_section>div.floor>img:nth-child(4){
        position: absolute;
        top: 50%;
        left:25px;
        margin-top: -35px;
    }
    #section>div.c_section>div.floor>span.f_text{
        position: absolute;
        color: #000;
        top: 50%;
        font-size: 16px;
        margin-left: 23px;
        margin-top: -18px;
    }
    #section>div.c_section>div.floor>span.f_text+span{
        color: #777;
        font-size: 15px;
        top: 50%;
        margin-top: 15px;
        margin-left: 36px;
    }
    #section>div.c_section>div.floor>div.f{
        width: 556px;
        height: 354px;
        position: absolute;
        left: 220px;
        top: 0;
    }
    #section>div.c_section>div.floor>div.f>div{
        width: 130px;
        height: 173px;
        margin: 2px 25px;
        display: inline-block;
        text-align: center;
        
    }
    #section>div.c_section>div.floor>div.f>div>a{
        text-decoration: none;
        color: #444;
        line-height: 35px;
        white-space: nowrap;
        text-overflow: ellipsis;
        width:130px;
        overflow:hidden;
        float:left;
    }
    #section>div.c_section>div.floor>div.f>div:nth-child(1){
        position: absolute;
    }
    #section>div.c_section>div.floor>div.f>div:nth-child(2){
        position: absolute;
        left: 198px;
    }
    #section>div.c_section>div.floor>div.f>div:nth-child(3){
        position: absolute;
        left:385px;
    }
    #section>div.c_section>div.floor>div.f>div:nth-child(4){
        position: absolute;
        top: 185px;

    }
    #section>div.c_section>div.floor>div.f>div:nth-child(5){
        position: absolute;
        top: 185px;
        left: 198px;
    }
    #section>div.c_section>div.floor>div.f>div:nth-child(6){
        position: absolute;
        top: 185px;
        left:385px;
    }
    #section>div.c_section>div.floor>div.f>div>a img{
        width: 130px;
        height: 130px;
    }
    #section>div.c_section>div.floor>div.f_r{
        width: 400px;
        height: 368px;
        position: absolute;
        right: 0;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(1){
        position: absolute;
        left: 20px;
        top: -2px;
        width: 150px;
        text-align: center;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(1)>a img{
        width: 140px;
        height: 140px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(1)>span{
        display: block;
        margin-top: 20px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(1)>span+p{
        padding: 10px 0;
        color: #ff6537;
        font-size: 14px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(2){
        position: absolute;
        bottom:0px;
        left: -8px;
        width: 210px;
        height: 140px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(2)>a img{
        width: 120px;
        height: 120px;
        float: right;
        margin-right: 10px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(2)>p{
        width: 90px;
        position: absolute;
        top: 20px;
        left: 20px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(2)>p>span+span{
        color: #4AB344;
        font-size: 13px;
        display: block;
        margin-top: 5px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(3){
        position: absolute;
        right: 10px;
        bottom: 50px;
        height: 280px;
        width: 180px;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(3)>a img{
        width: 180px;
        height: 180px;
        position: absolute;
        bottom: 20px;
        left: 0;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(3)>p:first-child{
        position: absolute;
        top: 0;
        left: 25px;
        text-align: center;
    }
    #section>div.c_section>div.floor>div.f_r>div:nth-child(3)>p+p{
        position: absolute;
        top: 25px;
        font-size: 14px;
        left: 23px;
        color: #FFCb01;
    }
    /* 2F */
    #section>div.c_section>div.floor_2f{
        background: url("../../public/img/2f_3f.png");
        background-size: 1190px;
    }
    #section>div.c_section>div.floor_2f img.floor_2f_img{
        width:80px !important;
        height:80px !important;
        margin-right: 30px !important;
        margin-top: 20px;
    }

    /* 3F */
    #section>div.c_section>div.floor_3f{
        background: url("../../public/img/2f_3f.png") no-repeat;
        background-size: 1190px;
    }
    #section>div.c_section>div.floor_3f>div.f>div:first-child{
        margin-top: 10px;
    }
    #section>div.c_section>div.floor_3f div.floor_3f_div{
        width: 277px !important;
        height:329px !important;
        position: absolute;
        top: 7%;
        left: 38% !important;
        text-align: center;
    }
    #section>div.c_section>div.floor_3f img.floor_3f_img{
        width: 250px !important;
        height:250px !important;
        display:block !important;
        position: absolute;
        top: -246px;
        left: -24px;
    }
    #section>div.c_section>div.floor_3f div.floor_3f_img1{
        position: absolute;
        top: 55%;
        left: 1% !important;
    }
    #section>div.c_section>div.floor_3f div.floor_3f_div>a{
        font-size: 13px;
        display: block;
        width: 200px;
        position: absolute;
        top: 262px;
        left:37px;
         overflow:visible !important;
    }
    #section>div.c_section>div.floor_3f img.floor_3f_img2{
        width:95px !important;
        height:95px !important;
        margin-right: 30px !important;
        margin-top: 20px;
    }
    #section>div.c_section>div.floor_3f div.floor_3f_div1{
        width: 180px !important;
        height:290px !important;
        overflow: hidden;
    }
   
    #section>div.c_section>div.floor_3f>a>img.floor_3f_img3{
        width: 250px !important;
        height:260px !important;
        position: absolute;
        top: 50px;
        left: -40px !important;
    }

    /* 热卖产品 */
    #section>div.c_section>div.center_fl{
        width: 783px;
        height: 317px;
    }
    #section>div.c_section>div>div.r_product{
        width: 773px;
        height: 253px;
        display: flex;
        justify-content: space-between;
    }
    #section>div.c_section>div>div.r_product img{
        width: 210px;
        height:210px;
    }
    #section>div.c_section>div>div.r_product>div{
        float: left;
        width: 210px;
        margin: 5px 20px;
        text-align: center;
    }
    #section>div.c_section>div>div.r_product>div>a{
        text-decoration: none;
        color: #666;
        font-size: 14px;
    }
    /* 建材新闻 */
    #section>div.c_section>div.center_fr{
        width: 407px;
        float: right;
    }
    #section>div.c_section>div.center_fr>table.newsitem{
        width: 407px;
        height: 270px;
    }
    #section>div.c_section>div.center_fr>table.newsitem tr{
        width: 397px;
        height: 50px;
        font-size: 14px;
    }
    #section>div.c_section>div.center_fr>table.newsitem tr>td{
        display: flex;
        justify-content: space-between;
    }
    #section>div.c_section>div.center_fr>table.newsitem tr+tr>td{
        border-top: 1px dotted #bbb;
    }
    #section>div.c_section>div.center_fr>table.newsitem tr>td>a{
        text-decoration: none;
        line-height: 50px;
        color: #66667d;
    }
    #section>div.c_section>div.center_fr>table.newsitem tr>td:hover a{
        color: #ff6637;
    }


</style>
