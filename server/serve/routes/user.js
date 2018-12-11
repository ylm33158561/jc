const express = require('express')
const pool = require('../pool')
const router = express.Router()

router.post('/signin',(req,res)=>{
    var uname = req.body.uname
    var upwd = req.body.upwd
    
    var sql = `select * from user where uname=? and upwd=?`
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) console.log(err)
        if(result.length>0){
            res.send({code:1,msg:"登录成功",uid:result[0].uid})
            res.end()
        }else{
            res.send({code:0,msg:"账号或密码错误"})
            res.end()
        }
    })
})
router.get('/islogin',(req,res)=>{
    var uid = req.query.id
    var sql = `select uname from user where uid=?`
    pool.query(sql,[uid],(err,result)=>{
        if(err) console.log(err)
        res.send(result[0])
        res.end()
    })
})
router.post("/register",(req,res)=>{
    var uname = req.body.uname
    var upwd = req.body.upwd
    var reupwd = req.body.reupwd
    var email = req.body.email
    var phone = req.body.phone
    //邮箱正则
    var regMail=/^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/
    //手机号
    var regPhone=/^1[356789]\d{9}$/
    if(uname==""){
        res.send({code:1,msg:"账号不能为空"})
        return
    }else
    if(upwd==""){
        res.send({code:2,msg:"密码不能为空"})
        return
    }else if(upwd !=reupwd){
        res.send({code:3,msg:"两次输入密码不一致"})
        return
    }else if(email==""){
        res.send({code:4,msg:"邮箱不能为空"})
        return
    }
     if(!regMail.test(email)){
        res.send({code:5,msg:"请输入正确邮箱"})
        return
    }else
    if(phone==""){
        res.send({code:6,msg:"手机不能为空"})
        return
    }else if(!regPhone.test(phone)){
        res.send({code:7,msg:"请输入正确手机号"})
        return
    }
    var sql1 =`select * from user where uname=?`
    var sql2 =`insert into user values(null,?,?,?,?)`
    pool.query(sql1,[uname],(err,result)=>{
        if(err) console.log(err)
        if(result.length>0){
            res.send({code:8,msg:"账号已存在!"})
            return
        }else{
            pool.query(sql2,[uname,upwd,email,phone],(err,result)=>{
                console.log(123)
                if(err) console.log(err)
                res.send({code:0,msg:"注册成功"})
                return
            })
        }
    })
    
})

 module.exports = router