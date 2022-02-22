
const express = require('express');

const app = express();

app.get('/',(req, res)=>{
    res.send('This is the Kgirl App!');
});

app.get('/user', (req, res) => {
    res.send('This is the User!')
})

app.put('/user', (req, res) => {
    res.send('Got a PUT request at /user')
})

app.post('/', (req, res) => {
    res.send('Got a POST request')
})

app.delete('/user', (req, res) => {
    res.send('Got a DELETE request at /user')
})

app.listen(3000, () =>{
    console.log('Server on port 3000');
});