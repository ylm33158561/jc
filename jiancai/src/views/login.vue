<template>
    <section id="section" class="section">
        <div class="c_section "><h3><span>会员登录</span></h3></div>
        <div class="login_section">
            <div>
                <input type="text" placeholder="账号" v-model="uname">
                <input type="password" placeholder="密码" v-model="upwd">
                <div class="login" @click="login">登录</div>
                <a href="#">免费注册&gt;</a>
            </div>
        </div>
        
    </section>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default{
        data(){
            return{
                uname:"",
                upwd:""
            }
        },
        methods:{
            login(){
                this.axios.post('users/signin',Qs.stringify({uname:this.uname,upwd:this.upwd}))
                .then((result)=>{
                    if(result.data.code==1){
                        Toast(result.data.msg)
                        sessionStorage.setItem('uid',result.data.uid)
                    //sessionStorage.getItem('url')
                        this.$router.push('/')//返回上一页
                        location.reload() 
                    }else{
                        Toast(result.data.msg)
                    }
                
                })
            }
        },
        created(){}
    }
</script>
<style scoped>  
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
    #section>img{
        width: 100%;
    }
    .section{
        height: 700px !important;
    }
    #section>div.hidden{
        display: none;
    }

    /*  登录  */
    #section>div.login_section{
        width: 1200px;
        margin: 0 auto;
    }
    #section>div.login_section>div{
        width: 240px;
        margin: 0 auto;
        text-align: right;
    }
    #section>div.login_section>div>input{
        width: 240px;
        height:34px;
        padding-left: 30px;
        border: 1px solid #e9e9e9;
        box-sizing: border-box;
        outline-color: #e7e7e7;
        display: block;
        margin: 10px auto;
    }
    #section>div.login_section>div>input:first-child{
        background: url("../../public/img/icon_user.jpg") no-repeat;
    }
    #section>div.login_section>div>input{
        background: url("../../public/img/icon_pwd.jpg") no-repeat;
    }
    #section>div.login_section>div>div.login{
        width: 240px;
        height:44px;
        text-align: center;
        line-height: 44px;
        color: #fff;
        background: #FFAD2B;
        cursor: pointer;
        margin: 20px auto;
    }
    #section>div.login_section>div>a{
        text-decoration: none;
        color: #888;
        font-size: 14px;
    }
   
</style>