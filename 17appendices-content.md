
# Project Milestones
Project milestone grades are shared by all members of a group. Peer evaluations may result in different scores based on the instructor's judgment. All project milestones except the first milestone involve a *development book*. You must continue building this development book throughout the semester, documenting your work. There is not a different development book for each milestone, rather the development book is revised and improved with each milestone.

Please do not turn in any Microsoft Office files in this course. If you work in Microsoft Office tools, please convert your files to pdf before turning them in. Please use markdown, latex, or pdf or link to google docs for reporting purposes.

## Milestone 1. Requirements

Identify requirements for a data\-base application. These requirements should include the following two essential requirements that are at the heart of this course.

- dynamic interaction with a publicly available data source, such as Google Maps, the IMDB, a sports scoreboard, a securities market, a public questions forum like Stack Overflow, a code repository such as Github, or any such source with relatively heavy traffic
- an intrinsic need for multi-user CRUD operations requiring you to take steps to maintain data integrity

Beyond these essential requirements are the requirements of a genuine customer. Ideally, you should find a customer for a database application and work to identify and meet their requirements. You will learn more and potentially earn a higher score if you are able to work with a genuine customer than if you have to invent a customer and create a database application from your own imagination.

Identify the customer requirements in a short paper divided into sections including summary, goals, stakeholders, scope, input, processing, and output. You may find the headings list for goals and stakeholders in the architecture section of these lecture notes. Note that projects vary in their emphases. It is up to you to state explicitly that certain goals or stakeholders will be ignored and to give a plausible reason.

The paper may be in markdown format or a google doc. If in markdown, it may be placed on a github repository that will be the home of the project for the remainder of the term or in the milestone 1 dropbox. If you use a google doc or github repository, you must submit a plain text file to the dropbox identifying where the actual work is to be found. If you use a markdown format and want to include pictures, please use the markdown format for a picture, e.g.,

```markdown
![caption of picture](picture.jpg)
```

where you want the picture to appear in the document. If you submit the markdown to the dropbox, you must then also submit the picture(s) there. If you use github, you must follow their rules for pictures.

## Milestone 2. Design and Design Patterns

This is the second milestone for the project which should occupy you for the rest of the semester. You should develop a project supporting integration of the course topics. That means that the project should

0. face potential issues with data input
1. face potential issues of data integrity
2. be amenable to the specification and use of design patterns
3. use a layered architecture
4. provide exception handling in a layered manner
5. include testing
6. require some authentication and authorization work
7. include user help of some kind
8. be packaged for some degree of portability
9. be refactored to some extent near the end of the semester
10. be designed with cognizance of potential regulatory issues

All milestones will include a revision of the development book presented in this milestone. Later milestones will include code. Please do not use any zip files except to bundle code. Please present this document in pdf, markdown, html, or a format agreed upon by the instructor (not proprietary, not ms office). Pictures should be presented in the pdf or in separate files readable by the instructor (not proprietary, not visio or bmp).

For this milestone, begin the development book with headings including

1. Team Members and Roles
2. Background
3. Project Description
4. Project Requirements (the voice of the client)
5. Business Rules (subject matter constraints like "you must buy something before you can sell it" or app-related constraints like "you must log in before you can have a transaction")
6. Technologies Used
7. Design Patterns
8. Timeline (mainly milestone due dates)

The timeline should be organized around the future milestones.

As you revise this document you will need to provide a way to see how it has changed. For instance, if you change the technologies used, the Technologies Used section should still list the original technologies planned to be used in a subsection where you describe why you switched.

Add a section to your development book called Design Patterns. In that section, identify the design patterns relevant to your project. You may change these in future. This represents your current view of design patterns in your project. If and when you change, move the previous material to a subsection.

Improve the other parts of your development book based on in-class discussions, your own reflections, and any examples posted.

Following are some issues students faced in completing this milestone in previous iterations of this course.

### Mediator is problematic for layers
In the layered architecture you should probably use for a typical database app, each layer sends to only one other layer and receives from only one other layer. There should not be a separate infrastructure for communicating between all layers because they don't all communicate. The database sends data to the data layer. The data layer sends data to the business layer. The business layer sends data to the application layer. The application layer sends data to the presentation layer.

You may merge the business layer and application layer into one depending on the application. The minimum number of layers should be three, though. The data layer should be the only layer with sql. The presentation layer should be the only layer that communicates with the end user.

### Diagrams alone are not sufficient
Diagrams, and especially generic diagrams, don't describe the use of design patterns in your project. One project just showed a generic diagram of an adapter design pattern. In this case, it also does not tell how the adapter pattern actually works! The diagram shows a controller and client both pointing to an adapter. If the adapter is *gluing* two incompatible classes together, should there not be an arrow pointing out of the adapter to one of the two classes. Moreover, it does not tell anyone how you see design patterns actually working in your project. It is probably in your head but it needs to be on the paper.

### Do more than mention a design pattern by name
One project just said that MVC would be used because it was needed but did not say how or why. MVC can be used in pretty much any user-facing application so some description is needed.

### MVC needs to be better explained
One group described how MVC would be used but it did not seem realistic. For example, in this case it was said that the model would be *the data in the database*. The view would be *what the user sees* and the controller would be *the backend functionality*. These descriptions are too generic. Think about what may be possible.

### Always be coding
One issue students face is that they don't have enough code too late in the development of the project. By including sample code for the design patterns, you get a head start on coding.

## Milestone 3. Layering

Please add a section to your development book called Layering. Within
that section, please add at least three subsections, each one describing
a layer of your layered architecture. You may rely on the layering
concepts from the prerequisite course, Database Connectivity and Access,
for this description. It should include as much specificity as possible.
For example, it would be helpful to include the names of the classes you
plan to write in each layer, as well as brief descriptions of the classes.
You should include code demonstrating each of the layers. From this point on in the development book, you should always be coding and always be showing sample code.

Some concerns that crop up in the development of a development book can be grouped together under the heading of *vagueness*.
Bullet points are problematic if they have a subject and no
predicate. I need sentences with a subject and predicate in
order to have a fighting chance if I am a compiler or
interpreter or other computery kind of a thing. Computers
are notoriously small-minded and can't do much with
ambiguity.
So, if I see "photo URL data" I'm not sure what that means
from a design standpoint.

Design is working with constraints. Design is solving
problems that arise because of the tension between
constraints. Design is making tradeoffs, non of which are
utterly perfect. So we need to know the details so we know
what we lose and what we gain by each choice. Whenever we
commit to some choice, we've narrowed our options.

[A google map overlay](http://www.improving-visualisation.org/vis/id=134)
called maptube exemplifies a choropleth map, a geo-artifact in which regions are colored according to numerical values of some characteristic. Designing effective choropleth maps is difficult. The color aspect, for instance, is the main work of Rebecca Brewer whose app ColorBrewer helps designers solve individual instances of the problem.

\begin{figure}
  \begin{center}
    \includegraphics[width=4in]{fiAlwaysBeCoding.jpg}
  \end{center}
\end{figure}

## Milestone 4. Exception Handling

Please add a section to your development book identifying exceptions and
categories of exceptions you expect to account for in your code.
You must include examples of actual exception-handling code in this milestone.

The most important thing to do in this milestone is to identify the
location of exception handling responsibility within classes. Where will
exceptions ceased to be passed on? No exceptions should ever be passed
to the user. Almost no exceptions should ever be passed to the
presentation layer. Most exceptions should be handled in an application,
business, or data layer. Identifying them should also identify the kind
of person who should respond to them. I have often encountered DBAs who
insisted that the responsibility lay with an "application owner" and
application developers who insisted that the same responsibility lay
with the DBA and "application owners" who insisted that they were paying
for somebody else to figure this out. If the development book spells out
enough detail to resolve such issues, the issues may never arise. The
tricky thing here is that there is probably not a cut-and-dried recipe
for "enough detail." It is application specific. You have to make
choices and articulate, within this section of your development book, the
responsibility for these choices. If your project is too trivial to have
any such issues, then you risk the possibility of a low grade on this
milestone just because you were too conservative in identifying a
worthwhile project.

The work is to plan how and where you handle exceptions in a layered architecture.

When an exception is thrown, it can be handled or passed up the layers. You have to make a decision for each "try / catch" whether you want to handle the exception here or elsewhere.

The above implies that you have a layered architecture. Do you?

Your development book has to specify some kind of a layered architecture.

So I am not asking for an exception handling section of the design but rather an expansion of the layered architecture description that shows us how and where exceptions are handled.

## Milestone 5. Performance and Refactoring
Add a section to your development book called Performance and Refactoring. Give examples of code there or coding practices there that you are doing to improve performance of your project. For projects where we identified refactoring opportunities, carry those out and all groups should include their current code with the document. The best case would be to put pointers in the document (e.g., filenames and line numbers or classnames and offsets) rather than code fragments in the document.

Improve your existing code and respond to *surprising* instructions from management. This milestone may be particularly stressful depending on how well you have completed the previous milestones. The *surprising* instructions will test the quality of your code thus far.

## Milestone 6. Testing

Please add a section to your development book identifying your testing framework. Please include specific code and diagrams as appropriate. Instrumented code and build files should be in separate files from the development book or simply included in the document as appendices and explained in a section in the main body. Whether you include them as appendices or separate files, they should be displayed with line numbers so you can make references to specific parts in the narrative in the testing section of the development book. It needs to be unambiguous as to which file or appendix you are referencing in your narrative.

Don't make implicit assumptions. Be specific even to the point of being tedious in your explanations. I am not looking for broad coverage so much as good coverage of whatever you do test. Also, even though I say I am not looking for broad coverage, the examples you do use should not be trivially different versions of each other.

The Wikipedia entry on [Unit Testing](https://en.wikipedia.org/wiki/Unit_testing) says the following about unit testing. Please be sure to include a unit test that conforms to this specification for your database layer.

*Because some classes may have references to other classes, testing a class can frequently spill over into testing another class. A common example of this is classes that depend on a database: in order to test the class, the tester often writes code that interacts with the database. This is a mistake, because a unit test should usually not go outside of its own class boundary, and especially should not cross such process/network boundaries because this can introduce unacceptable performance problems to the unit test-suite. Crossing such unit boundaries turns unit tests into integration tests, and when test cases fail, makes it less clear which component is causing the failure. See also [Fakes, mocks and integration tests](https://en.wikipedia.org/wiki/Test-driven_development#Fakes.2C_mocks_and_integration_tests).*

*Instead, the software developer should create an abstract interface around the database queries, and then implement that interface with their own mock object. By abstracting this necessary attachment from the code (temporarily reducing the net effective coupling), the independent unit can be more thoroughly tested than may have been previously achieved. This results in a higher-quality unit that is also more maintainable.*

Please create a mock object to mimic your database. It should exhibit the same interface as your database although it will respond in a canned manner. This is described in the Wikipedia entry for [Mock Object](https://en.wikipedia.org/wiki/Mock_object).

## Milestone 7. Deployment, Packaging

Please add a section to your development book detailing everything needed for packaging and deployment. This should include README files or whatever is provided so that a user with no access to you can simply install and run your app based on the info you provide here or which is pointed to from this location. For example, if your app can be cloned from github, you should point to the location and provide any instructions needed in addition to the relevant git commands. These instructions should include any required packages of any kind. As another example, if your app is hosted on a website, provide complete instructions for setting it up on someone else's website. There should be some kind of package that can be delivered to a client and used without the personal intervention of your team.

Finally, you should include a help specification, detailing what kinds of help would be provided in a full-blown installation of your app. There is probably not time to create a full-blown help system so provide a substantive example of help for your system by picking one aspect of your app as a target for help.


# Exams
Students will face three unequally weighted exams.

## Exam 1. Locking
Describe various locking schemes and the consequences of using them in specific situations.

## Exam 2. Access Control
Describe various methods for controlling user access and the consequences of using them in specific situations.

## Exam 3. Final Exam, Material after Access control
Answer questions about performance, refactoring, testing, help, architecture, and deployment.

# Exercises
Students will work on exercises in class. Some may be completed in groups while others need to be completed individually. The instructor needs to be able to observe progress on the exercises to support mastery of the skills involved so, while exercises may be finished outside class, major work on exercises needs to be completed in class in view of the instructor.

Please do not turn in any Microsoft Office files in this course. If you work in Microsoft Office tools, please convert your files to pdf before turning them in. Please use markdown, latex, or pdf or link to google docs for reporting purposes.

## Exercise 1. Review

Your first exercise will include an entity relationship diagram, a list of functional dependencies, and relational notation. All this will be based on the KGA documents and your own experience and imagination in guessing the future directions for the app, which is grossly underspecified. This will illustrate coping with specifications that can not possibly be final, in an environment where the development of the database can not be delayed nor synchronized with the app developer.

In addition to the above three artifacts, you will need to include some narrative to make your choices clear and persuasive. You need to think of questions someone might ask when examining your document of the form "Why did you include the *bla* column / table in this table / database?"

This exercise reviews what you have learned in prior courses and establishes a baseline. In it, you will look at a manager's description and, from that description, generate at least

1. ER diagram (s)

2. Functional Dependencies

3. Relational Notation

4. Clarifying and Persuading Narrative

5. Write the necessary sqlite3 statements to create the KGA database and populate it with at least three records per table. *Optional: create a test script in some language the instructor can run to verify the presence of the sample data in the tables and that links occur between tables that should be linked. E.g., if you have a project ID that links to two plant IDs, produce a test that will produce the names of the plants that appear. The test should include at least three joins.*

For an interesting intro to sqlite3, Mark Litwintschik has written a
[minimalist guide to sqlite3](http://tech.marksblogg.com/sqlite3-tutorial-and-guide.html).
Hacker News has a dicussion of that tutorial
[here](https://news.ycombinator.com/item?id=15605669).

### Exercise 1 Comments
Best Practices - use datatype and store datatype

- Tutorial website had topics and subtopics
- Quizzes to be offered had key terms ; indexed both the quiz and the
  topic the same way so they could be brought up together
- key terms may occur more than once (classification vs clustering
  problem)
- classic hierarchical vs flat clustering issue---should everything
  fit into one place in a hierarchy or should everything be tagged so that a tag may appear with more than one item (many solutions to this issue are hybrids)

four things to take into account: what the phone can do, what the user can do, what the user wants, and what the developer wants

What the phone can do includes: photos, sending photos, keep track of time and what day it is when somebody logs in and can monitor air pressure, notifications

What the user can do: share (era of social media), tap the screen, talk to the phone, and the most horrible of all---enter data on a teeny, tiny, little, bitty keyboard

What the user wants: plants to not die!!!! (minimize effort by user by notifications or whatever that is done strategically so the plant lives without extra fuss)

What the developer wants: a sequential linear model based on experts for growing plants

Tight deadline may prevent too much research. Algorithms are risky for the database designer.

## Exercise 2. Improvised ETL
*Following is the original CSV challenge as it ran on GitHub:*

You got your hands on some data that was leaked from a social network and you want to help the poor people.
Luckily you know a government service to automatically block a list of credit cards.
The service is a little old school though and you have to upload a CSV file in the exact format. The upload fails if the CSV file contains invalid data.
The CSV files should have two columns, Name and Credit Card. Also, it must be named after the following pattern:

```bash
YYYYMMDD.csv
```
The leaked data doesn't have credit card details for every user and you need to pick only the affected users.
The data was published here:
[Note: because of link rot, I've put the file in the Content > exercises section of myCourses. It appears as `data` because myCourses can't display the `.json` extension. --Mick]
You don't have much time to act.
What tools would you use to get the data, format it correctly and save it in the CSV file?

*The original assignment was: I want you to undertake the same challenge documenting exactly how you do it in a plain text file called challenge.txt (any kind of code and comments may be in the file as long as it is sufficient to meet the challenge.*

*Note: Since you have already done the challenge in ISTE-422, your assignment is to do the reverse with the `mockData.csv` file on myCourses. Convert the fname, lname, and gender from CSV to JSON and fix any problems that prevent you from doing so. Be sure to rename the file as YYYYMMDD.json.*

Following is some starter code that should get you going on this assignment. You should look up `readline` and `createInterface` to get a clear picture of what is going on here.

```javascript
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});
console.log('[');
rl.on('line', (line) => {
  line = line.replace(/, ([JS])r/," $1r");
  arr = line.split(/,/);
  console.log(`"fname": "${arr[0]}"`);
});
```

There are no NULL records to remove in this assignment (in contrast to the original 422 assignment) but there are problems with the `mockData.csv` file to solve if you want full credit.
You can most readily see these problems if you say

```bash
cut -f 5 -d , mockData.csv | sort | uniq -c
```

\noindent
at a terminal prompt. You should see output like the following.

```
      1  Female
    487 Female
    438 Male
      1 bblackpz@imgur.com
     26 female
      1 gender
      1 jnelsonoa@liveinternet.ru
      1 jstonenv@umn.edu
     45 male
```

What this tells you is that there are different spellings of male and female and that three people have commas in their names. You need to fix these problems as part of your solution.

In other words, you will receive data with `Female`, \Vtextvisiblespace `Female` (i.e., Female preceded by a space), `female`, `Male`, and `male`. Your JSON file should have only `Female` and `Male` for gender.

You will also have to solve the problem of extra commas in the names Jose Nelson, III, Judith Stone, Jr, and Billy Black, Jr. so that you list their genders instead of their email addresses. You'll get more credit for a more general solution than for a solution that only works for those three.

### A final suggestion
I recommend that you look at the writings of Peteris Krumins, a prolific blogger on *one-liners*, small solutions to common problems. You should also consider looking at sites like commandlinefu for similar advice on small solutions to common problems.

You should also look at blog posts like *The Absurdly Underestimated Dangers of CSV Injection* at
[http://georgemauer.net/2017/10/07/csv-injection.html](http://georgemauer.net/2017/10/07/csv-injection.html)
and the related [Hacker News conversation](https://news.ycombinator.com/item?id=15438894).

## Exercise 3. Stand Up An RDBMS
For this exercise, imagine you are in a new workplace that requires the use of PostgreSQL. You have a MySQL script called `standup.sql` available to load a database. *This MySQL script will not work in PostgreSQL as it is.* You must somehow get this database up and running in PostgreSQL without consulting any of your classmates. You may google for information on the public web but do not consult anyone who is working on or has completed this assignment, i.e., neither past nor present students of this course. You are free to use any method you identify but you must document how you do it.

If you use the current version of the virtual machine, PostgreSQL is already installed and you can use it with the client program `psql`.
You can connect to PostgreSQL by using `psql` without a password as long as you are logged in as `student`.
When you are logged in to `psql` you should remember the following commands.

`\h` help on sql

`\?` help on PostgreSQL backslash commands

`\q` quit

`\l` list databases

`\dt` describe tables in the current database

Please verify that PostgreSQL is running and the database is loaded by answering the following questions using SQL. Include documentation of your method for loading the database, your
SQL queries, and your results in a markdown file called `standup01.md`.

1. What is the most frequently mentioned first
   language?

2. What are the counts of all languages at all
   ranks? List them using language names and rank
   names (low medium high).

Note that you should not waste time trying to represent combinations that do not appear in the data. Think like the customer of the data.

3. For each language mentioned as having skill(value) HIGH, identify the most frequently named MEDIUM language. If you prefer, use more than one query but not more than two, i.e., feel free to create a table of languages in step 1.

For example, suppose nine people mentioned Java as HIGH. Among those people, suppose four mentioned C++ as medium, three mentioned Python as medium, and two mentioned Haskell as medium. Then the answer for Java would be C++. You must include an answer for each language mentioned as HIGH.

Please use fenced code blocks for your SQL. A fenced code block starts with a blank line, followed by a line containing nothing but three backticks in the first three columns, and immediately followed by the letters sql. Subsequent lines contain your sql code. After the last line of sql code, comes a line containing nothing but three backticks in the first three columns, followed by a blank line.  For example,

\begin{verbatim}

```sql
select * from bla;
```

\end{verbatim}

## Exercise 4. Demonstrate Password Hashing

I would have called this exercise "write a password hashing program" except that you should not do that. You should download and compile an existing program and demonstrate that you can use it. That may seem trivial but take a look at the following question on
[Stack Overflow](http://stackoverflow.com/questions/14529672/password-hashing-crackstation-net).

This person followed the excellent tutorial at
[hashing security](https://crackstation.net/hashing-security.html)
which includes code you can download for Java, C#, PHP, and RoR.

The problem the questioner faced was that he did not understand what was downloaded. It would have been better to read and understand first, then demonstrate. Of course, the answer on Stack Overflow shows which paragraph this questioner did not read but what if you fail to read a different paragraph? Stack Overflow may not be able to keep up with all the problems / issues, so please go through the tutorial with me first.

My only quibble is the use of the words "completely unpredictable" which has been shown to be untrue given sufficient computing power and irrelevant if you can get away with dangling the password owner from an 18th floor balcony (from a recent news item at
[officers-balcony](http://arstechnica.com/tech-policy/2015/04/drug-dealer-cops-leaned-me-over-18th-floor-balcony-to-get-my-password/)).

Turn in a small test program that exercises one of the password hashing programs supplied in a link from the above tutorial. The test program should let me enter a password and display the hashed version of the password. It should be accompanied by sufficient instructions for me to compile and run it and a copy of the password hashing program. The instructions, which may be comments in the source file, should also identify where you obtained the password hashing library. Your solution should be something you can retrieve and use in a practical situation, months from now, after you have forgotten the details.

## Exercise 5. Oral Presentation
Provide a brief (5 minute maximum) oral description of your project and answer impromptu questions about various aspects of the project. The questions may be directed at specific group members or it may be left to the group to select a spokesperson. In a live workplace situation, such a group would anticipate some obvious questions based on the details of the work they've done and would clearly be well prepared for some obvious questions which may or may not be asked. Such a group would also likely face surprising questions and would, in any workplace, be evaluated in part on how they handle surprising questions.

The questions may require you to walk through parts of your code, specifically with respect to the following requirements:

- layers: at least presentation, business, data
- logging: e.g., log4php, log4javascript
- caching: e.g., memcached
- authentication: restricted to presentation layer if poss, SSO if poss
- role-based authorization
- validation in the business layer
- clear delineation of business rules
- only data layer contains sql
- exception handling infrastructure
- test code
- refactored code
- deployment, packaging so that i can install it without help

# Software
The previous courses in the database sequence use MySQL. This course does not require any use of MySQL. MySQL is optional. The only required DBMS products are SQLite3 for the KGA assignment and PostgreSQL for the Stand Up assignment. A good source of information about MySQL and other DBMS products is [persona.com](persona.com). There was a
[comparison of MySQL to MariaDB](https://www.percona.com/blog/2017/11/02/mysql-vs-mariadb-reality-check/) and a lively discussion of that post at
[Hacker News](https://news.ycombinator.com/item?id=15613856).

## Improvised etl (extract / transfer / load)

### Vim

- split
- vsplit
- folding
- regex
- global
- syntax highlighting
- hex edit
- dbext
- vimdiff

### tmux / wemux

- split-window
- select-window
- list-buffers
- copy-mode
- paste-buffer
- swap-pane
- select-pane - list-buffers
- copy-mode
- paste-buffer- list-buffers
- copy-mode
- paste-buffer
- resize-pane
- detach

### shell utilities

- bash
- autoconf
- automake
- awk
- bg
- cat
- chgrp
- chmod
- chown
- column
- curl
- cut
- diff
- df
- du
- echo
- fg
- find
- file
- fmt
- grep
- head
- httrack
- jobs
- join
- jq
- less
- ln
- make
- man
- paste
- printf
- ps
- pwd
- readline
- recode
- rsync
- sed
- sort
- stat
- strings
- tail
- tar
- tcpdump
- time
- top
- uname
- uniq
- uptime
- wget
- which
- whoami
- xargs

### ldap utils (undecided)

- ldapadd
- ldapcompare
- ldapcomplete
- ldapexop
- ldapmodify
- ldapmodrdn
- ldappasswd
- ldapsearch
- ldapurl
- ldapwhoami

## Standing up a dbms

- PostgreSQL utilities

## Scripting routine dbms work

- Node.js

## Embedded databases

- sqlite3
- sqlite manager (for Firefox---undecided about this)

## NoSQL

- Strozzi NoSQL - Carlo Strozzi coined the term NoSQL many years ago to refer to a relational database operating without SQL. He periodically updates it so the current version is June 2014. I am undecided about it but, if I do use it, the installer has to know about a couple of pecularities concerning installation. I don't remember these but I used to use it so I should do a clean install before you try it.
- JSON support in JavaScript
- MongoDB

# Writing Well

You must write well to succeed, both in this class and in your chosen field. It is not sufficient to claim that "this is not an English class" because every class is an English class, just as every class is a Math class and if your skills in these basic areas lag behind those of your contemporaries, they will lose faith in you. Currently, I recommend two sources to improve your writing, @Garner2009 and @Fish2011. At the very least, choose one book to study to improve your writing during each semester. You'll be glad you did when your cover letter is passed up the chain and the cover letter of a competitor is discarded for poor writing.

# References

