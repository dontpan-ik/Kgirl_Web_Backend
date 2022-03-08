const express = require('express');
const router =  express.Router();

router.get('/',(req,res)=>{
    res.send('Hello World!');
})

router.get('/peliculas', (req, res)=>{
    res.send('Lista de peliculas');
})

module.exports = router;