<template>
    <section id="section" class="section">
        <div class="c_section "><h3><span>会员注册</span></h3></div>
        <div class="register_section ">
            <div>
                <p>账号: </p><input type="text" v-model="uname"><span>{{msg1}}</span>
                <p>密码: </p><input type="password" v-model="upwd"><span>{{msg2}}</span>
                <p>确认密码: </p><input type="password" v-model="reupwd"><span>{{msg3}}</span>
                <p>邮箱: </p><input type="text" v-model="email"><span>{{msg4}}</span>
                <p>手机号: </p><input type="text" v-model="phone"><span>{{msg5}}</span>
                <div class="register" @click="register">注册</div>
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
                upwd:"",
                email:"",
                reupwd:"",
                phone:"",
                msg1:"*",
                msg2:"*",
                msg3:"*",
                msg4:"*",
                msg5:"*"
            }
        },
        methods:{
            register(){
                this.axios.post("users/register",Qs.stringify({uname:this.uname,upwd:this.upwd,reupwd:this.reupwd,email:this.email,phone:this.phone}))
                .then((result)=>{
                    switch(result.data.code){
                        case 1:this.msg1=result.data.msg
                             break;
                        case 2:this.msg1="*";this.msg2=result.data.msg
                             break;
                        case 3:this.msg2="*";this.msg3=result.data.msg
                             break;
                        case 4:this.msg3="*";this.msg4=result.data.msg
                             break;
                        case 5:this.msg3="*";this.msg4=result.data.msg
                             break;
                        case 6:this.msg4="*";this.msg5=result.data.msg
                             break;
                        case 7:this.msg4="*";this.msg5=result.data.msg
                             break;
                        case 8:this.msg5="*";Toast(result.data.msg)
                            break;
                        case 0:Toast(result.data.msg);
                                this.$router.push("login")
                            break;
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
    .section{
        height: 700px !important;
    }
    #section>div.hidden{
        display: none;
    }
    /*  注册  */
    #section div.register_section{
        width: 1200px;
        margin: 0 auto;
    }
    #section>div.register_section>div{
        width: 400px;
        height: 360px;
        margin:0 auto;
    }
    #section>div.register_section>div>input{
        width: 272px;
        border: 1px solid #e9e9e9;
        outline-color: #dedede;
        background: #f7f7f7;
        height:27px;
        padding-left: 5px;
        box-sizing: border-box;
        margin:10px 0;
    }
    #section>div.register_section>div>p{
        display: inline-block;
        width: 85px;
        text-align: right;
        padding-right: 5px;
    }
    #section>div.register_section>div>span{
        position:absolute;
        transform:translate(0,15px);
        color: red;
        padding-left: 5px;
        font-size:13px;
    }
    #section>div.register_section>div>div.register{
        margin: 0 auto;
        width: 340px;
        height: 45px;
        line-height: 45px;
        text-align: center;
        color: #fff;
        background: #ffad2b;
        margin-top: 20px;
        cursor:pointer;
    }
</style>