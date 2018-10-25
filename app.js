'use strict';
var express = require('express');
var app = express();
var path = require('path');
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/rohith";
var port = 3000;
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
app.set('view engine', 'ejs');
var message;
app.use(express.static('public'));
app.use(bodyParser.json());

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'app')));

app.get('/', function (req, res) {
    //res.sendfile('C:/Cloud/Eval6/index.html');
    res.render('one',{mess:message})
});

//Save – Insert 

app.post('/ins', function (req, res) {
    console.log("Inside Save " + req.body.fname);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var dbo=db.db("rohith");
        var myobj = { firstname: req.body.fname, lastname: req.body.lname, EnrollmentDate: req.body.edate };
        dbo.collection("Student").insertOne(myobj, function (err, res) {
            if (err) throw err;
            console.log("1 document inserted");
            db.close();
        });
    });
    //res.write("Inserted");
    // res.end('Hello world');
    var message="Entry inserted into Database";
    res.render('one.ejs',{mess:message});
    //res.sendFile('/' , {mess:message});
    //req.get('referer')
});



//Delete

app.post('/del', function (req, res) {
    console.log("Inside delete " + req.body.fname);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var dbo=db.db("rohith");
        var query = { firstname: req.body.fname, lastname: req.body.lname };
        dbo.collection("Student").deleteOne(query, function (err, obj) {
            if (err) throw err;
            console.log("1 document deleted");
            db.close();
        });
    });
    var message=req.body.fname+" deleted from Database"
    res.render('one.ejs',{mess:message})

});


app.listen(port, () => {
    console.log("Server listening on port " + port);
   });

   

//Serach

app.post('/search', function (req, res) {
    console.log("Inside Search " + req.body.user);
 
    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
       // var query = { address: "Coimbatore" };
        var query = { firstname : req.body.fname, lastname: req.body.lname, EnrollmentDate: req.body.edate }; // Get the user name from Form
        var dbo=db.db("rohith");
        dbo.collection("Student").find(query).toArray(function (err, result) {
            if (err) throw err;
            console.log(result);
            var message=result[0].firstname+" found in database";
            //res.send('Hello world in search ' + result[0].firstname);
            db.close();
            res.render('one.ejs',{mess:message});
        });
    });
    
});


//Update

app.post('/upd', function (req, response) {
    console.log("Inside update" + req.body.fname);

    MongoClient.connect(url, function (err, db) {
        if (err) throw err;
        var query = { firstname: req.body.fname, lastname: req.body.lname  };
        var newvalues = { firstname: req.body.f1name, lastname: req.body.l1name, EnrollmentDate: req.body.e1date };
        var dbo=db.db("rohith");
        dbo.collection("Student").updateOne(query, { $set:newvalues}, function (err, res) {
            if (err) throw err;
            console.log("1 document updated");
            var message="Entry updated in Database";
            db.close();
            response.render('one.ejs',{mess:message});
        });
    });

});
