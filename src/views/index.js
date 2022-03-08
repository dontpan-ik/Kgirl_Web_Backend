
const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

// Initializations
const app = express();

// Setting
app.set('port',process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
// **** NOTE ****
// Express handleBars reference change check on this article: https://es.stackoverflow.com/questions/497722/typeerror-exphbs-is-not-a-function
app.engine('.hbs', exphbs.engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('../lib/handlebars')
}))

app.set('view engine', '.hbs');


// Middelewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// Global Variables
app.use((req, res, next) => {
    next();
});
// Routes
app.use(require('../routes'));
app.use(require('../routes/authentication'));
app.use('/links',require('../routes/links'));
app.use('/products',require('../routes/products'));
app.use('/supliers',require('../routes/supliers'));
app.use('/orders',require('../routes/orders'));
app.use('/clients',require('../routes/clients'));
// Public
app.use(express.static(path.join(__dirname,'public')));
//app.use(express.static)

// Starting the Server

app.listen(app.get('port'), () =>{
    console.log('Server on port ',app.get('port'));
});

/*
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
*/

/*app.listen(3000, () =>{
    console.log('Server on port 3000');
});*/