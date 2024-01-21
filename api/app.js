const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');
const helmet = require('helmet');

//Routes login/registro
const usuarioRoute = require('./Routes/Usuarios/routes/usuario.route');

//Routes médicos
const medicosRoute = require('./Routes/Medicos/routes/medicos.route');


app.use(morgan('dev'));

app.use(helmet());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*'); 
    res.header(
        'Access-Control-Allow-Headers',
        'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    );

    if (req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
        return res.status(200).json({});
    }
    next();
});

//public images
app.use('/assets', express.static('./assets'));

// routes TP01
app.use('/ortoclinica/usuarios', usuarioRoute);

// routes TP04
app.use('/ortoclinica/medicos', medicosRoute);

app.use((req, res, next) => {
    const error = new Error('Not found...');
    error.status = 404;
    next(error);
});

app.use((error, req, res) => {
    res.status(error.status || 500);
    res.json({
        error: {
            message: error.message
        }
    });
});

module.exports = app;