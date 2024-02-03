const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser')
const app = express();

const db = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'dit-clubs'
});
db.connect((err)=> {
    if(err){
        throw err;
    }
    console.log('Mysql connected...');
});

app.listen(3000);
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.set('view engine', 'pug');
app.set('views', './src/views');

app.get('/createUser', (req, res) => {
    let user = {id: 1, username: 'shad', email:'a@b.c', password: '123shad'}
    let sql = 'INSERT INTO user SET ?';
    db.query(sql, user,(err, result)=> {
        if(err) throw err;
        console.log(result);
        res.send("user table created")
    })
});

app.post('/authUser', (req, res)=> {
    const { email, password } = req.body;

    // Check if the user exists in the database
    const query = 'SELECT * FROM users_adms WHERE email = ? AND password = ?';
    db.query(query, [email, password], (error, results) => {
      if (error) {
        console.error('Error querying MySQL:', error);
        return res.status(500).send('Internal Server Error');
      }
      if (results.length > 0) {

        res.redirect('/events');

      } else {
        res.send('wrong credential! use correct credentials');
      }
    });
});
app.get('/', (req,res)=> {
    res.render('login.pug');
});

app.get('/register', (req,res)=> {
    res.render('register.pug');
});

app.post('/regUser', (req, res) => {
    const { username, email, password, password2 } = req.body;
    let user = {username: username, email:email, password: password}
    if(password == password2){
        let sql = 'INSERT INTO users_adms SET ? ';
        db.query(sql,user ,(err, result)=> {
            if(err) throw err;
            console.log(result);
            res.redirect('/')
        })
    }else{
        res.send('validation failed: paswword mismathc')
    }
    
});

app.get('/clubs', ((req, res)=>{
    db.query('SELECT * FROM clubs', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('clubs.pug', { clubs: rows });    
    });  
}));

app.get('/members', ((req, res)=>{
    db.query('SELECT * FROM members', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('members.pug', { members : rows });    
    });  
}));

app.get('/attendance', ((req, res)=>{
    db.query('SELECT * FROM attendance', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('attendance.pug', { attendances : rows });    
    });  
}));

app.get('/events', ((req, res)=>{
    db.query('SELECT * FROM events', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('events.pug', { events : rows });    
    });  
}));

app.post('/addmember', (req, res) => {
    const { member_name, member_email, member_reg, member_course, date_joined } = req.body;
  
    const sql = 'INSERT INTO members SET ?';
    const values = {member_name, member_email, member_reg, member_course, date_joined};
  
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error inserting data into the database:', err);
        return res.status(500).send('Internal Server Error');
      }
      console.log('Data added to the database!');
      res.redirect('/members');
    });
  });

  app.get('/memberForm', ((req, res)=>{
        res.render('memberForm.pug');    
 
}));