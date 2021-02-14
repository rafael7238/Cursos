const express = require("express")
const app = express()

 
app.get('/', (req, res,next) => {
    console.log("Fun 1")
    res.send("Meu backEnd")
    next()
 })

app.get('/', (req, res) => {
    console.log("Func 2")
 })

 app.get('/blablabla', (req, res) => {
    console.log("Fun 1")
    res.send("Meu Blablabla")
 })


 app.get('/blablablaComValor/:valor', (req, res) => {
    
    res.send(req.query)
 })

app.listen(300, () => {
    console.log("Meu backEnd executando..")
})