const express = require('express');
const router =  express.Router();

const conn = require ('../views/database');

router.get('/add', (req, res)=>{
    res.render('links/add.hbs')
})

module.exports = router;