'use strict';
var express = require('express');
var app = express();
var path = require('path');
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/prasannadb";
var port = process.env.PORT || 1337;
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
app.set('view engine','ejs');
var message;
app.use(express.static('public'));


// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'app')));

app.get('/', function (req, res) {
    res.render('index.ejs',{mess:message})
});

//Save – Insert 

app.post('/save', function (req, res) {
    console.log("Inside Save" + req.body.user);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var myobj = { name: req.body.user, lname: req.body.ad, date:req.body.date };
        var dbo=db.db("prasannadb");
        dbo.collection("student").insertOne(myobj, function (err, res) {
            if (err) throw err;
            console.log("1 document inserted");
            db.close();
        });
    });
    res.send('File Inserted');
});

app.listen(1337, function () {
    console.log('Example app listening on port 1337!')
})

//Search

app.post('/search', function (req, res) {
    console.log("Inside Search" + req.body.user);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
       // var query = { address: "Coimbatore" };
        var query = { name : req.body.user }; // Get the user name from Form
        var dbo=db.db("prasannadb");
        dbo.collection("student").find(query).toArray(function (err, result) {
        	var message1=result[0].name+" not found";
            if (err) {
            	res.render('index.ejs',{mess:message1});
            }
            console.log(result);
            var message=result[0].name+" found!";
            //res.send('Hello world in search' + result[0].name);
            db.close();
            res.render('index.ejs',{mess:message});
        });
    });
   
});

//Update

app.post('/update', function (req, res) {
    console.log("Inside update" + req.body.user);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var query = { name: req.body.user };
        var newvalues = { name: req.body.f1name, lname: req.body.l1name, date: req.body.e1date };
        var dbo=db.db("prasannadb");
        dbo.collection("student").updateOne(query,{$set: newvalues}, function (err, res) {
            if (err) throw err;
            console.log("1 document updated");
            db.close();
        });
    });
   res.send('File Updated');
});

//Delete

app.post('/delete', function (req, res) {
    console.log("Inside delete" + req.body.user);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var query = { name: req.body.user };
        var dbo=db.db("prasannadb");
        dbo.collection("student").deleteOne(query, function (err, obj) {
            if (err) throw err;
            console.log("1 document deleted");
            db.close();
        });
    });
   res.send('File Deleted');
});
