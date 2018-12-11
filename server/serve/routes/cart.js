const pool = require('../pool')
const express= require('express')
const router = express.Router()
//加入购物车
router.get('/add',(req,res)=>{
        var lid = req.query.lid
        var uid = req.query.uid
        var count = req.query.count
        pool.query('select * from shopcart where user_id=? and product_id = ?',[uid,lid],
        (err,result)=>{
            if(err) console.log(err)
            if(result.length==0){
                pool.query('insert into shopcart values(null,?,?,?,0)',[uid,lid,count],(err,result)=>{
                    if(err) console.log(err)
                    res.send('加入购物车成功')
                    res.end()
                })
            }else{
                pool.query(
                    "update shopcart set count=count+? where user_id=? and product_id=?",
                    [count,uid,lid],
                    (err,result)=>{
                      if(err) console.log(err);
                      res.end();
                    }
                  )
            }
        })
})
//查询购物车商品
router.get('/cartItems',(req,res)=>{
    var uid = req.query.uid
    var output = {pageSize:6}
    output.pno = req.query.pno
    var sql = `select * from shopcart left join laptop on product_id=lid where user_id=? `
    pool.query(sql,[uid],(err,result)=>{
        if(err) console.log(err)
        output.count = result.length
        output.pageCount = Math.ceil(output.count/output.pageSize)
        output.products=result.slice(output.pno*10,output.pno*10+10)
        res.send(JSON.stringify(output))
        res.end()
    })
})
//移除购物车中商品
router.get('/delItems',(req,res)=>{
    var lid = req.query.lid
    console.log(lid)
    var sql =`delete from shopcart where product_id=${lid}`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
       if(result.affectedRows>0){
            res.send('移除成功')
        }
        res.end()
    })
})

module.exports=router