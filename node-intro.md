
# node.js intro
You need to familiarize yourself with Node.js if you're taking any database course from me: 432, 438, and 610 all use Node.js to connect to databases and to end users. This tutorial should help you learn to work with Node.js and several different database systems.

This tutorial assumes you have access to the virtual machine that can be downloaded from \url{http://serenity.ist.edu/~mjmics} and a copy of VMWare to host it. You can only access this URL from the RIT campus or the VPN. If you are off campus, you must use the VPN or the above URL will not be visible. In addition to downloading the virtual machine and hosting it on your own machine, you can also use it directly on the IST lab machines, where it is the only Ubuntu 18.04 VM available via VMWare.

The virtual machine is a modified version of the Ubuntu 18.04 virtual machine available from Canonical. It has been modified by installing the products used in this tutorial, including Node.js, MySQL, sqlite3, MongoDB, and Neo4J, as well as some utility files and configuration files. Wherever possible, passwords have been set to *student* to conform to the practice in IST labs.

# node.js: hello world
There are three different hello world programs to write here. The first one displays Hello World to the console, while the second displays it on a webpage. Third, rewrite the hello world application so that some part of it can be easily tested.

## Console version
To write Hello World to the console, first open a terminal window. Use an editor to type the following into a file called `hwc.js`.

```javascript
console.log("Hello, World!");
```

You may then run this program by typing the following at a terminal prompt.

```bash
node hwc.js
```

This program introduces an important object, the console, and a method for that object, log. You will use this throughout this tutorial to help you understand and debug your code. You will spend quite a bit of time using the terminal so you should familiarize yourself with it and with a full-featured editor.

## Web version
Node.js is frequently used to develop programs that will run on the web. Typically, the end user interacts with such programs using a web browser and never sees the console. Therefore it makes sense to write a hello world program that works on the web. This is quite a bit more complicated than writing output to the console, which is one reason the console is used for debugging.

In order to write hello world to a web page, you must rely on one of the features of Node.js that makes it popular. That is its ability to specify a web server, allowing you to write a very small amount of code to accomplish your task and allowing you to avoid writing to folders used by default web servers like Apache. You will tell Node.js to import some server code and run that. All you will have to do is specify a few details.

Before you write the required code, be aware that throughout this tutorial, you will write only to a server available on your local machine. You can move the software you will write to a public server but it may be best to learn a little about Node.js before you do so.

### Step 1, create a folder
The first thing to do is to create a folder in which to put your program. This is common practice in writing Node.js programs. The reason is that few Node.js programs operate in a vacuum. There are many common tasks that are already well served by software in the Node.js ecosystem. You can import most of the needed software into your Node.js program and write only the bare minimum (it may seem like a lot when you are first writing it!) to make your program perform popular tasks. It is customary to import Node.js software into a subfolder of your project folder although you may also import Node.js software globally into your system. There are reasons we will cover later for why you may prefer to import software locally into your current project. For now, let's just do it. The easiest way to do it is to create a directory. Call this directory firstserver and change to it. At the terminal prompt say

```bash
mkdir firstserver && cd firstserver
```

Notice that these commands are separated by a pair of ampersands. That causes the second command to be run only if the first command is successful. You can of course break this up into two separate commands by separating them with a semicolon instead or by pressing Enter between them.

### Step 2, initialize the project
You should be in the `firstserver` folder and can verify this by saying

```bash
pwd
```
\noindent at the terminal prompt. This is the root folder of your project and it is here that you will create a `package.json` file which is customarily found at the root of any Node.js project. You can write the file in a text editor or copy it from another project but in this case, use Node's package management system to create it. At a terminal prompt, say

```bash
npm init
```

The Node.js package management system is called NPM. It is installed with Node and offers a great deal of functionality. Think of it as your link to the Node.js ecosystem, among other things. When you type `npm init`, you will be asked a lot of questions and the default answer will be typed in parentheses. If you press Enter in response to any question, `npm` will behave as if you had typed in the default answer. For such a simple project as a hello world program, you can probably guess that the answers don't matter much. Feel free to accept all the defaults or not. The simplest thing to do is to keep pressing Enter until the terminal prompt reappears.

After you have finished answering the questions, `npm` will display a picture of the `package.json` file it intends to write and ask you if this is okay. Again, you are free to accept the default or alter it if the mood strikes you. Once `npm` has completed writing the file, you can view it in a text editor and you should find that it looks no different from what you expect.

### Step 3, create the server
You may have noticed that `npm` supplied the name of a file as an entry point into your project. Now write the following code into that file, by default called `index.js`.

```javascript
var http = require("http");
http.createServer(function (req,res) {
  res.writeHead(200, {"Content-Type":"text/plain"});
  res.write("Hello, World!");
  res.end();
}).listen(8081);
```

### Step 4, verify that it works
The above file introduces a number of concepts but first, verify that it works. Type

```bash
node index.js
```
\noindent at the terminal prompt. You should see no result except that no new prompt will appear. The terminal will appear to hang. Now open Firefox, browse to `http://localhost:8081` and you should see the words *Hello, World!* appear in the browser window.

You have actually accomplished quite a bit though it may not appear so. In your first line of code, you instantiated a variable that is an object of type `http`. That object has methods available to it, such as `createServer()` and `listen()`. The `createServer()` method takes an unnamed function as its parameter and that function in turn takes a request (req) and a response (res) as its parameters.

There are some remarkable concepts at play in this simple example and you will gradually learn more of them. For now it is enough to know that your program can communicate in one direction on the web. You can write whatever text you wish to a webpage. In practice you would not. Instead you would use various packages of code to construct the webpage and define its appearance. What you see here is just a basic connection and you will have to make a number of basic connections to work with a database system.

## A test-driven hello world
You verified your simple program by running it and observing the result. In the workplace, this is not a practical method for evaluating your work. You will work on large programs in teams and it will often be necessary to run tests on software after a few changes have been made to verify that it still works. There are many approaches to testing and your hello world program is too small for some of them but you can modify it to illustrate the concept of a unit test.

### Step 1, modularize
First, create a new file called `hellow.js` and put the following code into it. This is a module and can be tested to see if it does what is advertised.

```javascript
'use strict';
var hellow = function () {
  return 'Hello, World!';
};
module.exports = hellow;
```

This creates a function that returns a string and we can plug this into our main program by modifying `index.js` as follows. Notice that now `res.write()` accepts as a parameter a function that returns a string instead of a hardcoded string. You have created a module that writes the string in a separate file.

```javascript
var http = require("http");
var hellow = require("./hellow");
http.createServer(function (req,res) {
  res.writeHead(200, {"Content-Type":"text/plain"});
  res.write(hellow());
  res.end();
}).listen(8081);
```

### Step 2, create the test
Now create the test specification in a file called `testSpec.js`. You can run this test by importing a test framework into your project. That test framework is called `jasmine-node` and is one of the half-dozen most popular test frameworks available in the Node.js ecosystem.

```javascript
'use strict';
var hellow = require('./hellow.js');
describe('hellow',function () {
  it('should return Hello, World!', function () {
    expect(hellow()).toEqual('Hello, World!');
  });
});
```

### Step 3, import the test framework
To import the `jasmine-node` framework, say

```bash
npm install jasmine-node --save
```
\noindent at a terminal prompt. This will not only import `jasmine-node` but also the many other packages upon which it depends. Using the `--save`{.sh} option will cause the `package.json` file to be updated to include `jasmine-node` as one of the dependencies of this project. View `package.json` in a text editor to verify that `jasmine-node` is now listed, along with its current version number. It is often necessary to specify version numbers of dependencies because packages are often updated and compatibility issues may arise when some packages are updated. You may sometimes be better off to use an old version of a package than a new and possibly different version.

### Step 4, run the test
You can run the test in one of two ways. You can say

```bash
./node_modules/jasmine-node/bin/jasmine-node \\
  testSpec.js
```
\noindent or you can say

```bash
./node_modules/.bin/jasmine-node testSpec.js
```

Either way, you should see output like this:

```
hellow - 5 ms
    should return Hello, World! - 5 ms

Finished in 0.008 seconds
1 test, 1 assertion, 0 failures, 0 skipped
```
\noindent You can also make the test fail by changing a variable name or deleting a file or in many other ways. You should play around with this test in order to get an idea of how the output should look given different errors.

# a simple mysql application
Next, create a simple mysql application. This application is from a website I have unfortunately forgotten so I can not give a proper attribution unless someone else figures out where it comes from. Please let me know.

This application resides in seven files plus the many files that will be added to `node_modules`. The seven files will all reside in the same folder and will be connected to each other with one exception. The file `createDB.js` will not be connected to the other files. It will be run independently every time you need to recreate the database. The other files, except `package.json`, will be called from `index.js` or a file called by `index.js`, which will be the entry point for the application.

## Prepare the folder
First create a folder called `secondserver` and change to that folder, for instance by saying the following at a terminal prompt.

```bash
mkdir secondserver; cd secondserver
```

Once in that directory, create the `package.json` file by saying

```bash
npm init
```
\noindent
and following the prompts. Accept the defaults so that the entry point is `index.js` and answer the other questions as you wish. The fastest thing to do is to press Enter after every prompt.

## Run the MySql server
Before you create the database, the MySQL server needs to be running. Start it by saying

```bash
sudo /etc/init.d/mysql start
```
\noindent at a terminal prompt. You will have to give the sudo password, which is *student*. Now you can run MySQL as a client as you have done in previous classes, or interact with MySQL from a program. To turn off the server, you will afterward use the same command as above but with the word `stop` replacing the word `start`.

## Write the db creation script
Now type the following script into a file called `createDB.js`.

```javascript
'use strict';

var mysql = require('mysql');

var conn = mysql.createConnection({
  host:     'localhost',
  user:     'root',
  password: 'student'
});

conn.query('drop database if exists secsrv',
  function (err) {
  if (err) {
    console.log('Could not drop db secsrv.');
  }
});

conn.query('create database secsrv',function (err) {
  if (err) {
    console.log('Could not create db secsrv.');
  }
});

conn.query('use secsrv',function (err) {
  if (err) {
    console.log('Could not switch to db secsrv.');
  }
});

conn.query('create table bla '   +
  '(id int(11) auto_increment, ' +
  ' txt varchar(255), '          +
  ' primary key(id))',
  function (err) {
    if (err) {
      console.log('Could not create table bla.');
    }
  }
);

conn.query("insert into bla (txt) values ('foo')");
conn.query("insert into bla (txt) values ('bar')");
conn.query("insert into bla (txt) values ('bas')");
conn.query("insert into bla (txt) values ('qux')");

conn.end();
```

Notice that the above script drops the database if it exists, then creates the database, then inserts some data into it. It needs not only MySQL but a MySQL driver for Node.js to run so, before we run it, we'll have to install that driver.

## Install the mysql driver
At a terminal prompt, say

```bash
npm install mysql --save
```
\noindent This will install the node mysql driver and save the fact that the project depends on it in the `package.json` file.

In the `node_modules` folder you will see, in addition to a folder for the driver, folders for various other packages upon which it depends.

## Run the db creation script

You need to run the script at least once. Then, after you play around with the following scripts, you may want to run it again to start fresh. Say

```bash
node createDB.js
```

\noindent at a terminal prompt. You can verify the success of the script by opening mysql in a separate window. Say

```bash
mysql -uroot -p
```
\noindent
at a terminal prompt and give the password *student* at the prompt. Once you have the MySQL REPL running, say

```sql
use secsrv
select * from bla;
```
\noindent and you should see foo, bar, bas, qux, listed as content and integers 1 to 4 as id. You may quit MySQL after this or leave the REPL open to test later interactions.

## Create the entry point
The main entry point for the application does very little except to use the `http` module to instantiate a web server and call another file to give the details of that server. It also specifies the port at which the server will listen for requests as 8081. This means that you can point a browser on the virtual machine at localhost:8081 to make requests of the server. The contents of the `index.js` file are:

```javascript
'use strict';

var http           = require('http'),
    acceptReq      = require('./acceptReq');

// Start web server on port 8081; requests go to
// function acceptReq
http.createServer(acceptReq).listen(8081);
```

## Create the main logic
This file contains the main logic for the web server in a function called `acceptReq()`. It accepts two kinds of requests, requests to add an item to the database, and requests to limit the displayed contents to a subset of the database. The contents of `acceptReq.js` are:

```javascript
var url            = require('url'),
    querystring    = require('querystring'),
    insertIntoDB   = require('./insertIntoDB'),
    retrieveFromDB = require('./retrieveFromDB'),
    pageContent    = require('./pageContent');
// Accept http requests
function acceptReq(req,res) {
  var pathname = url.parse(req.url).pathname;

  // Request to add to database
  // (POST request to /add)
  if (pathname == '/add') {
    var reqBody = '';
    var postParams;
    req.on('data',function (data) {
      reqBody += data;
    });
    req.on('end',function () {
      postParams = querystring.parse(reqBody);
      // Content to add is in POST parameter "content"
      insertIntoDB(postParams.content,function () {
        // Redirect back to / when finished adding
        res.writeHead(302, {'Location': '/'});
        res.end();
      });
    });
  // Request to read from database
  // (GET request to /)
  } else {
    // Text for limiting is in GET parameter q
    var l
      = querystring.parse(url.parse(req.url).query).q;
    retrieveFromDB(l,function (contents) {
      res.writeHead(200, {'Content-Type':
        'text/html'});
      // Instead of templating engine: replace
      // DBCONTENT
      // in page HTML with content from database
      res.write(
        pageContent.replace('DBCONTENT',contents));
      res.end();
    });
  }
}
module.exports = acceptReq;
```

## Create the select logic
This file contains a function called `retrieveFromDB()` that connects to the database and retrieves either everything in table `bla` or a subset limited by the user employing the SQL LIKE clause.

The contents of `retrieveFromDB.js` are:

```javascript
var mysql = require('mysql');
// Retrieve from db, limiting to subset if requested
function retrieveFromDB(limit, callback) {
  var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'student',
    database: 'secsrv'
  });
  var query;
  var resultAsString = '';
  if (limit) {
    limit = '%' + limit + '%';
    query = conn.query('select id, txt from bla '+
      'where txt like ?',limit);
  } else {
    query = conn.query('select id, txt from bla');
  }

  query.on('error',function (err) {
    console.log('A database error occurred:');
    console.log(err);
  });

  // Build string result by result to later
  // replace into html of webpage
  query.on('result',function (result) {
    resultAsString += 'id: '     + result.id;
    resultAsString += ', text: ' + result.txt;
    resultAsString += '\n';
  });

  query.on('end',function (result) {
    conn.end();
    callback(resultAsString);
  });
}
module.exports = retrieveFromDB;
```

## Create the insert logic
Next, create the file `insertIntoDB.js`, containing the function `insertIntoDB()`, for inserting user-supplied records to the `bla` table.

```javascript
var mysql = require('mysql');
// Function called by code that handles the /add route
// and inserts the supplied string as a new txt
// entry
function insertIntoDB(txt,callback) {
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'student',
    database: 'secsrv'
  });

  connection.query('insert into bla (txt) '+
    'values (?)', txt,
    function (err) {
      if (err) {
        console.log('Could not insert text "'+txt+
          '" into database.');
      }
      callback();
    });
}
module.exports = insertIntoDB;
```

## Add the html content
Normally you would use a view engine to render html for the user. Here we just have some raw html to insert as a string variable. Put this into a file called `pageContent.js`.

```javascript
  // Page html as one big string with placeholder
  // "DBCONTENT" for data from the database
  var pageContent =
    '<html>'+
    '<head>'+
    '<meta http-equiv="Content-Type" '+
    'content="text/html; charset=UTF-8" />'+
    '</head>'+
    '<body>'+
    '<form action="/add" method="post">'+
    '<input type="text" name="content">'+
    '<input type="submit" value="Add Text" />'+
    '</form>'+
    '<form action="/" method="get">'+
    '<input type="text" name="q">'+
    '<input type="submit" value="Limit Text" />'+
    '</form>'+
    '<div>'+
    '<strong>Text in bla table:</strong>'+
    '<pre>'+
    'DBCONTENT'+
    '</pre>'+
    '</div>'+
    '</body>'+
    '</html>';
module.exports = pageContent;
```

## Run the server
Say `node index.js` at a terminal prompt and the server should start. You won't see any indication of it because you have not written any messages to the console to notify you that the server is running. The only indication that it is working will be to take the next step.

## Open a client
Open a web browser and point it to \url{http://localhost:8081} and you should see a couple of boxes with the words Add Text and Limit Text beside them. Beneath the boxes should be the words *Text in bla table:*.

# how node fits in with databases
One important difference between operating a database interactively and connecting to it from a program is time. The database may be on a different machine from the program, in a different city or country. The time it takes for the database to respond to requests may already be slow interactively depending on the query but it may be compounded by network delays or program logic.

If you are interacting with the database at the console, you may be predisposed to wait for it to return an answer to a query or you may leave it running while opening up another window to do something else. That is really all you can do unless you can somehow make the database work in the background and allow you to make additional queries before it returns the answer to your first query.

## Node callbacks
Writing programs to connect to the database allows us the flexibility to leave the database running while the program does something else. Some languages have special facilities for making this easier. One of the most basic is the notion of the *callback*.

The basic idea of the callback is to start some process, call it *A*, running and then start other processes *B* and *C* running instead of waiting for *A* to finish. Suppose some process *D* depends on *A* finishing before *D* can start. We need a way to let *B* and *C* start right away, but only let *D* start when *A* is finished. In this scenario, we can refer to *D* as a *callback* and set up a way for it to start only when *A* finishes.

You can accomplish the above scenario in JavaScript, the language of the Node system, by using the fact that JavaScript supports *first-class functions*. For a language to support first-class functions means that functions can be treated as any other variable.

You can pass a function to another function as a parameter in JavaScript and let that passed function run when the called function is finished. The function that gets passed in is usually referred to as a *callback* even though there is no reserved word *callback* in JavaScript.

Therefore in JavaScript it helps to write your code in a manner that illustrates dependencies between functions. In Java you might write statements one after the other, expecting them to execute one after the other. In JavaScript, that is not necessarily the case. Statements don't necessarily execute one after the other unless you take special care to write them that way.

## Callback examples
Let's look at two examples of callbacks from a document called *Art of Node*. I'd like you to read *Art of Node* for more detail on what I'm describing briefly in fact. You can find it at \url{https://github.com/maxogden/art-of-node} and you should also check out a companion piece called *Callback Hell* at \url{http://callbackhell.com/} originally by the same author, although *Art of Node* now has been forked on Github by several contributors.

Anyway, here is the first example. You should run this code. You'll have to create a file called `nr.txt` in the same folder and put a number in it. For example, you could say the following at a terminal prompt.

```bash
echo '1' >nr.txt
```

Then put the following code in a file called `firstnr.js` and run it by saying `node firstnr.js` at a terminal prompt.

```javascript
var fs = require('fs'); // require is a special function
                        //provided by node
var myNumber; // we don't know what the number is
              // yet since it is stored in a file

function addOne() {
  fs.readFile('nr.txt', function readDone(err, fc) {
    myNumber = parseInt(fc);
    myNumber++;
  });
}

addOne();

console.log(myNumber); // prints undefined -- this line
                       // is run before readFile is done
```

What you should find puzzling about this is that it logs the word `undefined` even though you have already called `addOne()`. Imagine that this is a database read and you try to use the value before it is returned. This is a simple analogy to that problem.

Here is a corrected version, using a callback. Put this in a file called `secondnr.js` and run it by saying `node secondnr.js` at a terminal prompt.

```javascript
var fs = require('fs');
var myNumber;

function addOne(callback) {
  fs.readFile('nr.txt', function readDone(err, fc) {
    myNumber = parseInt(fc);
    myNumber++;
    callback();
  });
}

function logMyNumber() {
  console.log(myNumber);
}

addOne(logMyNumber);
```

Now the statement logging to the console is trapped in a function that is not executed until the end of the function `addOne()`. The function `logMyNumber()` is passed as a parameter to function `addOne()`.

## Callback hell
The expression *callback hell* arises from the fact that many processes can wind up in a dependency chain leading to lots of ugly-looking nesting. One reason for this is that functions don't need to be named in JavaScript. They can be anonymous functions. So you can have a pattern like this:

```javascript
      POST: function (req,res) {
	req.onJson(function (err,newKeyword) {
	  if (err) {
	    console.log(err);
	    res.status.internalServerError(err);
	  } else {
	    dbSession.query('INSERT INTO keyword (value, categoryID) VALUES (?,?);', [newKeyword.value,newKeyword.categoryID],function (err,result) {
	      if (err) {
		console.log(err);
		res.status.internalServerError(err);
	      } else {
		res.object({'status':'ok','id':dbSession.getLastInsertId}).send();
	      }
	    });
	  }
	});
      }
    }
  );
```

\noindent
The above is just a fragment. There are three anonymous functions shown here plus some others above for which I've just shown the trailing parens and braces. One of the anonymous functions is actually invisible because it runs off the right side of the page on the line that begins with `dbSession`. It is not important for you to see the rest of the code but simply to identify it as a common readability problem. Readability problems cause debugging problems so I encourage you to name functions in most cases and avoid deeply nested parentheses and curly braces. It is not that they are inherently wrong but that students who practice this kind of coding often struggle with debugging.

## Promises
The standard solution to callback hell is to use a language feature called *promises* and only use callbacks when you can afford to keep the code small. If you must have a long dependency chain, promises provide a better solution. One catch is that they are only introduced in ES6 so there are vastly many browsers that do not support them. One way to cope with that problem is to use a library such as `Bluebird` to support promises on platforms that are not ES6 ready. You can check for ES6 compatibility at many sites, such as
[https://kangax.github.io/compat-table/es6/](https://kangax.github.io/compat-table/es6/).

There is a tutorial you should do at
[http://stackabuse.com/a-sqlite-tutorial-with-node-js](http://stackabuse.com/a-sqlite-tutorial-with-node-js) introducing promises with `sqlite3`. There is (at the time of this writing) a small error in the code, though, so be sure to add

```javascript
module.exports = ProjectRepository
```

\noindent
to the end of the `project_repository.js` file and a similar line to the end of the `task_repository.js` file. A corrected copy of the code is on myCourses as `node-sqlite-tutorial.tar`.
