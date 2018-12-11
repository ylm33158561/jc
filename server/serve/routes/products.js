const express = require('express')
const pool = require('../pool')
const router = express.Router()
/*
router.get('/newPro',(req,res)=>{
    var sql =`select * from new_pro`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       res.send(result)
    })
})
router.get('/bathPro',(req,res)=>{
    var sql =`select * from bathroom`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       res.send(result)
    })
})
router.get('/tilePro',(req,res)=>{
    var sql =`select * from tile`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       res.send(result)
    })
})
router.get('/lampsPro',(req,res)=>{
    var sql =`select * from lamps`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       res.send(result)
    })
})
router.get('/curtainPro',(req,res)=>{
    var sql =`select * from curtain`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       res.send(result)
    })
})
*/
router.get('/proList',(req,res)=>{
    var fid = req.query.fid
    var sql = `select * from laptop where family_id=?`
    pool.query(sql,[fid],(err,result)=>{
        if(err) console.log(err)
        res.send(result)
        res.end()
    })
})
//获取商品
router.get('/product',(req,res)=>{
    
    var id = req.query.id
    var sql = `select * from laptop where lid=?`
    pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err)
        res.send(result)
        res.end()
    })
})
//搜索
router.get('/search',(req,res)=>{
    var kwords = req.query.kwords
    var arr = kwords.split(" ")
    for(var i=0;i<arr.length;i++){
        arr[i]=` l_name like'%${arr[i]}%'`
    }
    console.log(arr[i])
    var where = 'where'+arr.join(" and ")
    console.log(where)
    var sql = 'select * from laptop '
    pool.query(sql+where,(err,result)=>{
        if(err) console.log(err)
        res.send(result)
        console.log(result)
        res.end()
    })
})

module.exports=router