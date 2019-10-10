
# Authentication and Authorization

## Outline
- introduction
    - data qualities
    - data protection categories
    - data states
    - decoupling people from data
- authentication
    - authentication techniques: passwords, tokens,
      biometrics, multifactor
    - issues
    - os-level authentication
    - authentication management
- authorization
    - authorization methods
    - access control lists

## Three qualities of data to protect
These three qualities can be easily remembered by the acronym CIA.

- confidentiality of data
- integrity of data
- availability of data

## Three ways to protect data
- human factors
- policy and practices
- technology

## Three states where data is vulnerable
- transmission
- storage
- processing

## McCumber cube
- The foregoing three lists of three each are collectively known as
  the McCumber Cube.
- The McCumber Cube was an early systematic way to organize thinking
  about security.
- If you thought exhaustively about each of the nine areas and the
  $3^3=27$ combinations of them, it was believed that you had a chance
  of thinking comprehensively about security---leaving no stone
  unturned.
- Security professionals regard the McCumber Cube as passé today (see for example the McCumber Cube comedy video on Youtube), 
  but most contemporary security frameworks strike me as still using
  mainly these ideas and adding a few tiny refinements.

## Simplest approach to security
- Users are put into groups
- Groups are assigned permissions (CRUD) for tables,
  views, forms, reports
- Users are assigned special permissions which differ
  from their group

## Reasons to uncouple people from data
- Direct links between people and data may leave data orphaned due to
  staff turnover and gaps in hiring
- Human resources choices should not be manipulated by data\-base specialists
    - Enterprises frequently rewrite responsibilities for individuals even
  maintaining the same job, forcing a data\-base specialist to
  dabble in human resources issues while trying to figure out which
  privileges to grant
- Managers ask for an individual to be given the same privileges as
  another individual known to use the same data, but without realizing
  that the other individual also accessed other data

## Work, Resources, Privileges, Roles, Membership

### In brief

- A common way to plan access is to use these five concepts
- Resources are data resources: tables, views required for work
- Work tasks can be defined and compartmentalized into the resources
  required
- Roles for staff are specified as assigned to pieces of work
- Roles are accorded privileges according to assigned work
- Individuals are granted membership in roles pertinent to their
  assignments

### In more detail

A common way to plan access is to use these five concepts. Each of them may change over time so we can improve the use of resources by defining each one of these and linking in a way that allows a single link to change.

Work consists of tasks that can be defined and linked to the resources required to do that work. These tasks may change over time and the resources required to do given tasks may change over time. If an organization is advanced in a system like Capability Maturity Metrics, it is defining work in ways that may be used to improve management and reporting.

Resources are data resources: tables, or views onto tables that are required for work. The resources may change in different ways. As an example, I worked on a project for working with a database of document images. The documents had been pouring into the system for many years and new technologies had emerged for identifying sensitive data in the documents, leading to a desire to restructure the database, which was used by thousands of clients. By uncoupling the views from the database structure it was possible to update the database to take advantage of entities that had not been contemplated in an earlier epoch. Then the question to answer was which new views would apply to different people using the database. The answer, in part, was to define the work or use existing definitions of work to organize the views and their availability. The key problem was that, with thousands of users, the user organizations could not possibly have the same maturity level. Some could offer definitions of work but some could not.

Roles are accorded privileges according to assigned work. Job descriptions are rewritten frequently in almost every workplace I have ever encountered. Rewriting job descriptions is sometimes a way to reward loyalty or accomplishment where promotion is not possible. Rewriting job descriptions may be required to handle new responsibilities assigned to an organization. It may even be done punitively. Roles are often (very often) left unfilled for weeks or months due to do employee turnover or promotion. Details of job responsibilities are often lost. There is a whole field of research into *organizational memory* that tries to cope with problems related to turnover. Roles and their definition is one way to do so.

Roles for staff are specified instead of staff being simply assigned to pieces of work. It is the role that dictates the work an individual must accomplish.
Individuals may be granted membership in multiple roles, serially or in parallel.

## Authentication Techniques
- Passwords
- Tokens
- Biometrics
- Each technique has problems
- Multifactor

## Passwords
- Major goal of security professionals is to eliminate
  passwords ... Why?
- Social Engineering of Passwords
- Advances in Cryptography
- Increasing Multi-tenanted Cloud Installations

Password practice draws constant complaints but has evolved little through history. The main evolutionary development has been to allow users to choose their own passwords, something that was not possible for early generations of computer users.

Study after study has demonstrated the insecurity of passwords as they are practiced. Books by experts like Kevin Mitnick demonstrate the ease with which social engineering can be used to extract or bypass passwords.

## Fifty-six bit secret study
A study presented at Usenix 2014 by Bonneau and Schechter demonstrated a superior password regime where participants chose a password but then were taught to supplement it with a 56-bit secret over the course of one to two weeks.
Some relevant aspects of the study follow.

### Background
The study took advantage of spaced repetition
to learn a 56-bit secret to be added to a user-selected password.
Spaced repetition is a learning approach that has been
successfully employed by many, including most medical students
over the past century.

\medskip\hrule\medskip

### Cost
The study presented a method for evaluating the cost of cracking a 56-bit secret using bitcoin mining and determined an average cost of 1m USD at January 2014 rates. The method itself was presented so that the number could be updated to account for economic fluctuations. The number supported segmentation of adversaries into categories of individuals, corporate entities, and nation-states. Clearly, the latter two categories would not be deterred by a million dollar price tag. So the authors can make a convincing claim that their password regime impedes determined individual adversaries.

\medskip\hrule\medskip

### Effort
The study examined the effort required by average users to 
practice the regime and found that it added about twelve minutes over the course of learning the 56-bit secret.
Each login during the learning period took an average of 6.9 seconds extra for learning the secret.
The secret consisted of 676 common words, combined and arranged in a manner chosen by the researchers to create a genuinely random 56-bit string. The use of the words is similar to the horse battery staple concept presented in a famous xkcd cartoon by Randall Munroe, but accomplished in a more precisely defined manner so that the adversary is definitely presented with 56 randomly ordered bits.

\medskip\hrule\medskip

### Validation
The study was conducted using a distraction task, a popular method to improve the generalizability of results. A distraction task is a task the experimental participant believes to be central to the experiment. It distracts the participant from the real task, in this case, learning the secret. This validation approach nullifies the criticism that the participants were trying really hard and would relax in real life. In fact, the participants were trying really hard to do something else and were unaware of the significance of learning the secret.

\medskip\hrule\medskip

### Ethical Concerns
Any research where participants are deceived presents an ethical risk. In 1979 a document called the [Belmont Report](http://www.hhs.gov/ohrp/humansubjects/guidance/belmont.html) presented basic ethical principles that underly all subsequent US regulations of human subject research. The three principles are named (1) respect for persons, (2) beneficence, and (3) justice. While these three names sound very generic, they are defined in great detail in the report, in subsequent legislation, in many books on ethics, and in plenty of free online tutorials. The study publication explains how the researchers complied with these principles.


## Physical Tokens
- Token provides a separate item you must have to
  authenticate
- It is separate from any other authentication factor
- Physical token has physical problems
- Smart tokens (on phone tokens) eliminate a main reason
  for token use, yet are immensely popular with users

## Biometrics
- Long history of failure except in controlled settings
- Now available in all flagship smartphones

## Multifactor
- Something you are, something you know, something you
  have
- Regarded as badge of lower class by users unable to
  resist implementation

The most robust authentication includes something you
know (password), something you have (dongle), and
something you are (fingerprint). If these are all three
stored in one place, they do not constitute three factor
authentication. For example, a smartphone that records
your fingerprint, acts as a dongle, and stores all your
passwords may, if stolen, provide an adversary with
complete access. This depends in part on the quality of
the implementations. For example, Lenovo laptops bind
fingerprints to passwords so the user does not have to
type passwords.

## OS-Level Authentication
- Database authentication
- Username/Password

## Authentication Management
- Password Aging - require a change of password, can backfire
- Password Recovery / Reset - Email, multi-step process
- Limited Attempts - 3 times max, etc..
- Encryption Procedures - ZIP, AES 256bit, etc..

## Authorization Methods
- Role-Based - What are their credentials?
- User-Based - Username
- Database Level - have permissions in database - very tedious
- Impersonation - ASP.NET type method, faking who you are

## ACLs, Access Control List / permissions attached
- User - username
- IP - IP address
- Hardware - MAC Address

## Authentication and Authorization
- Authentication identifies you
- Authorization, well, authorizes you to do stuff
- Authentication may be performed by
    - Application
    - System
    - Trusted third party

## Authorization 
Authorization can be determined in different contexts

- Database
    - Use of GRANT statement
    - DBA may assign access at database level
    - Can be difficult to manage 
- Application
    - DBA may trust developer to manage
    - Application has one or more identities with
      varying (admin, user) database privileges
    - Developer (via business rules) may assign access at
      application level
    - SQL WHERE clause

## Application-Level Authorization
Varied means of accomplishing authorization

- Application-level
    - Username, password provided to application
    - All users interact with application in same way
    - This approach is frowned upon (effectively sharing
      a password)
- User-level
    - Username, password provided to user
    - More complex but more common

## User privileges
under application-level authorization

- Task-Based
- Very granular
- User is assigned (or not) permission to each and every task
    - May include read/write/create distinction
- Difficult to maintain
    - Can create features to make it easier


## Role-based authorization
under application-level authorization

- Username, password provided to user
- Each user is assigned a role which in turn has certain privileges associated with it
- Typical roles:
    - Admin
    - Editor
    - General User
    - Public

## Code considerations
under application-level authorization

- Must ask the question:
*Is the user authorized to perform this task?*

- Who is the user?
- What are their rights?
- Can they do this task?
- What if they can’t?
- How did they get this far? (implies state)
- Why did they get this far? (implies state)

## Business Rules
- Who has access
- What can they access
- When does their access expire
- Where can they be when they access

## Checking Authorization
Either following method may be encapsulated in a security object.

- Method 1
    - Determine user
    - Query database for user access rights
    - Check rights against requested action
    - Problematic in a RESTful application
- Method 2
    - Issue user token upon login
    - Check token for user access rights
    - Check rights against requested action
    - Token becomes part of every transaction

## REST
Above, the expression *RESTful application* refers to an application designed with a cognizance of the way TCP/IP (hereafter the Internet) operates.
Representational state transfer or REST is one of the core concepts of the Internet and a key reason for its success. It means that a node in the network does not maintain state information---state information must be transferred in every transaction. This makes the Internet vastly more robust than corporate computer systems but creates a dilemma in authorization.

## Authentication Tokens
- What is a token?
- Hash ([illustrated guide to
  hashes](http://www.unixwiz.net/techtips/iguide-crypto-hashes.html))
    - A one-way function, meaning that it is easy to
      compute on input but hard to invert ([one-way function](http://en.wikipedia.org/wiki/One-way_function))
    - Potentially secure
    - May use salt, random data used as an additional input
    ([salt](http://en.wikipedia.org/wiki/Salt_(cryptography)))
- Encryption
    - Two-way Access
    - Embedded info
    - Less secure, but more useful?

## Token example
Steve's method to generate a token includes a userid, an
ip address, and a timestamp. Steve performs a one-way function on these inputs. The userid starts as four digits, left padded for userids less than a thousand.
The ip address starts as four octets, each one 0 to 127 (although many of the possible numbers are reserved, so this is a much smaller set than implied by $128^2$).
Step 1 is to convert each of these integers to a different base in some random way.
Step 2 is to salt each number.
Step 3 is to somehow rearrange the characters.
Step 4 is to do a cyclical redundancy check (CRC) and add the remainder to the result as a position-dependent [checksum](http://en.wikipedia.org/wiki/Checksum).

The [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm) is a checksum approach used by credit-card companies. More sophisticated algorithms mentioned in the above article (Verhoeff, Damm) can identify more transcription errors than can the Luhn algorithm.

## Credential Storage
Credentials for a user may be stored in the database.
Credentials may be stored in a secured table.
Credentials may be encrypted.

## Credential storage in the client
Storing credentials in the client depends on the circumstances.
Does the client connect to server?
Is the client a standalone application?

## SOA Considerations
Where in a layered architecture are authentication & authorization determined?
Is one token passed through or are multiple tokens used?
What about multiple business layers? Any medium
or large organization has many business layers, many data layers, and very many databases. Above the business layers are very many presentation layers.  The path of tokens may be long and complicated.

## PCI DSS Compliance
The Payment Card Industry Data Security Standard (PCI DSS) specifies how entities who accept credit cards must protect their systems. This is worthwhile guidance to know about, in part because it is such a common requirement but also because the standard is very technical and developers must often be closely involved in its implementation.

Let's look at just one of the requirements of the PCI DSS, requirement number six. This requirement specifies that you must *develop and maintain secure systems and applications*. There are seven specific requirements within requirement six. These are as follows.

6.1 Establish a process to identify security vulnerabilities, by using reputable outside sources for security vulnerability information, and assign a risk ranking (for example, as 'high,' 'medium,' or 'low') to newly discovered security vulnerabilities.

6.2 Ensure that all system components and software are protected from known vulnerabilities by installing applicable vendor-supplied security patches. Install critical security patches within one month of release.

6.3 Develop internal and external software applications (including web-based administrative access to applications) securely, as follows:

- In accordance with PCI DSS (for example, secure authentication and logging)
- Based on industry standards and best practices
- Incorporating information security throughout the software-development lifecycle

6.4 Examine policies and procedures to verify that the following are defined.

- Development/test environments are separate from production environments with access control in place to enforce separation.
- A separation of duties between personnel that are assigned to the development/test environments and those persons assigned to the production environment.
- Production data (live PANs) is not used for testing or development.
- Test data and accounts are removed before a production system becomes active.
- Change control procedures that are related to implementing security patches and software modifications are documented.

6.5 Address common coding vulnerabilities in software devel\-opment processes as follows.

- Train developers in secure coding techniques, including how to avoid common coding vulnerabilities, and understanding how sensitive data is handled in memory.

6.6 For public-facing web applications, address new threats and vulnerabilities on an ongoing basis and ensure these applications are protected against known attacks by either of the following methods.

- Reviewing public-facing web applications via manual or automated application vulnerability security assessment\linebreak tools or methods, at least annually and after any changes.
- Installing an automated technical solution that detects and prevents web-based attacks (for example, a web-application firewall) in front of public-facing web applications, to continually check all traffic.

6.7 Ensure that security policies and operational procedures for developing and maintaining secure systems and applications are documented, in use, and known to all affected parties.

