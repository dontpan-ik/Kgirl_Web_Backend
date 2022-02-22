//using just the HTTP module
/*const http = require('http');

const server = http.createServer((req, res) =>{
    res.status = 200;
    res.setHeader('content-type', 'text/plain');
    res.end('Hello World');
});

server.listen(3000, ()=>{
    console.log('Server on Port 3000');
})*/

const express = require('express');

const app = express();

app.get('/',(req, res)=>{
    res.send('This is the Kgirl App!');
});

app.listen(3000, () =>{
    console.log('Server on port 3000');
});