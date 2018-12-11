const express = require("express")
const bodyParser = require('body-parser')
const cors = require('cors')

var app=express()
app.listen(3030)
app.use(cors({
  origin:['http://localhost:8080','http://127.0.0.1:8080'],
  credentials:true
}))
app.use(express.static("public"))
var products = require('./routes/products')
var users = require('./routes/user')
var cart = require('./routes/cart')

app.use(bodyParser.urlencoded({extended:false}))
app.use("/products",products)
app.use("/users",users)
app.use("/cart",cart)
