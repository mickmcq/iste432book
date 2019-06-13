
# Single-User and Multi-User Databases

Issues to consider when expanding from single to multi-user databases include
security, interface, contention, and partitioning.

## Single User 
- One connection at any given moment in time
    - When DB needs maintenance
- Structural changes
- Change in global settings
- Restoring the db
- Typically Store bought systems – COTS
    - MS Outlook, Quicken, QuickenBooks
- Or in an app --- sqlite

## Workgroup systems
- Allow a few users at a time 
    - Locking system is not complex
    - Small businesses
    - Proprietary data formats
- Examples:
    - FileMakerPro
    - MS Access
- One-tier
- Now offer connectivity to web services

## Multi-User System Issues
- Data Integrity
- Transaction Isolation
- Locks
- Dirty Data
- Security

## Transaction, according to @Wang2008
*A transaction is a transformation from one state to another.*

*A transaction is a group of operations executed to perform some specific functions by accessing and or updating a database.*

## Transaction
- A single indivisible piece of work that affects some data 
- COMMIT vs. ROLLBACK
    - Make all changes, or make NO changes
    - These commands complete the transaction
- Example (a retail store as the db):
    - Shopping in a store.
        - You try on clothes (data), then leave w/o buying (rollback)
        - You try on clothes (data), then purchase (commit)
        - Transaction is over when you leave the store

## Transaction example
An example in an actual database could be the transfer of funds from one account to another. This transfer can be thought of as two actions, withdrawing funds from one account and depositing funds into the other account. It is unacceptable for either of the actions to fail unless both actions fail. Both actions together should be seen as a single transaction and we should roll back the state of the database to the condition before either action occurs if either or both actions fail. Only if both actions succeed should the enveloping transaction succeed and the database be committed to the two updates.

## ACID
Transactions must be ACID compliant (atomic, consistent, isolated, durable). A transaction must not be divided. A transaction must not introduce inconsistencies into a database. A transaction must be isolated from any clients not involved in the transaction. A transaction must be durable even if the system loses power a moment after commitment.

## What ACID guarantees
Transactions adhering to the ACID properties are guaranteed to be failure atomic
and serializable. This means that each transaction is guaranteed to execute in its entirety or not at all and that the outcome of operations performed within a transaction
is the same as if these operations would be performed in a sequence (a series of executions, one after the other). @Wang2008

## VCRP
VCRP (Visibility; Consistency; Recovery; Permanence) represent ACID
properties in a more general way. Visibility represents the ability of an executing
transaction to see the results of other transactions. Consistency refers to the correctness of the state of the database after a transaction is committed. Recovery means
the ability to recover the database to the previous correct state when failures occur.
Permanence is the ability of a successfully committed transaction to change the state
of the database without the loss of the results when encountering failures.
The VCRP properties can be used to evaluate transaction models. @Wang2008

## Flat Transactions
When we apply VCRP to evaluate traditional transactions, which are also known as
flat transactions as they have no internal structures, we get the strict ACID properties
that are essential for these relatively simple transactions. The transaction processing
(TP) system is responsible for ensuring the ACID properties. @Wang2008

## Transaction Processing
A TP system generally
consists of

- a TP Monitor, which is an application to manage transactions and control access
to a Database Management System.
- one or more Database Management Systems (DBMS).\linebreak However, for flat transactions only one DBMS can be part of the TP system.
- a set of application programs containing transactions.

again, according to @Wang2008

## Two phase commit
A blog post by Daniel Abadi at
[http://dbmsmusings.blogspot.com/2019/01/its-time-to-move-on-from-two-phase.html](http://dbmsmusings.blogspot.com/2019/01/its-time-to-move-on-from-two-phase.html)
describes two phase commit before delving into its limitations. The following slides are quotations from that blog post.

## Two phase commit diagram
\begin{center}
  \includegraphics[]{fiTwoPhaseCommit.jpg}
\end{center}

## Two phase commit background
The work entailed by a transaction has already been divided across all of the shards/partitions that store data accessed by that transaction. We will refer to the effort performed at each shard as being performed by the “worker” for that shard. Each worker is able to start working on its responsibilities for a given transaction independently of each other. The 2PC protocol begins at the end of transaction processing, when the transaction is ready to “commit”. It is initiated by a single, coordinator machine (which may be one of the workers involved in that transaction).

## Two phase commit phase 1 of 2
A coordinator asks each worker whether they have successfully completed their responsibilities for that transaction and are ready to commit. Each worker responds ‘yes’ or ‘no’.

## Two phase commit phase 2 of 2
The coordinator counts all the responses. If every worker responded ‘yes’, then the transaction will commit. Otherwise, it will abort. The coordinator sends a message to each worker with the final commit decision and receives an acknowledgement back.

## Two phase commit and atomicity
This mechanism ensures the atomicity property of transactions: either the entire transaction will be reflected in the final state of the system, or none of it. If even just a single worker cannot commit, then the entire transaction will be aborted. In other words: each worker has “veto-power” for a transaction.

## Two phase commit and durability
It also ensures transaction durability. Each worker ensures that all of the writes of a transaction have been durably written to storage prior to responding ‘yes’ in phase 1. This gives the coordinator freedom to make a final decision about a transaction without concern for the fact that a worker may fail after voting ‘yes’. [In this post, we are being purposefully vague when using the term “durable writes” --- this term can either refer to writing to local non-volatile storage or, alternatively, replicating the writes to enough locations for it to be considered “durable”.]

## Two phase commit & additional writes
In addition to dura\-bly writing the writes that are directly required by the transaction, the protocol itself requires additional writes that must be made durable before it can proceed. For example, a worker has veto power until the point it votes ‘yes’ in phase 1. After that point, it cannot change its vote. But what if it crashes right after voting ‘yes’? When it recovers it might not know that it voted ‘yes’, and still think it has veto power and go ahead and abort the transaction. To prevent this, it must write its vote durably before sending the ‘yes’ vote back to the coordinator. [In addition to this example, in standard 2PC, there are two other writes that are made durable prior to sending messages that are part of the protocol.]

## Users with domain expertise
Many database applications are used by specialists of different kinds. Some of these specialists have a degree of domain expertise that enables them to modify database applications, especially menus in database applications, without the intervention of the application developers. The following subsections describe this situation, a technique for handling it, and some issues concerning the limitations of handling it.

## Background

Students specializing in database are expected to practice something that is locally called data-driven programming in projects. Examples of what is meant locally by data-driven programming are the Acute Otitis Media application and the Companion Radio application that are used as examples and platforms in some database courses.

Unfortunately, data-driven programming is a term used differently elsewhere. We need to look at different definitions of data-driven programming, not only to clarify what is meant locally but also to understand criticism of data-driven programming as it applies or does not apply to the local definition.

## How IST uses the term data-driven programming

To see how the term is used locally, it helps to look at the example applications that use it, the Acute Otitis Media application and the Companion Radio application. From these examples, we can deduce the utility and some limits to data-driven programming.

## The Acute Otitis Media application
This application is used by physicians in a clinic treating and conducting research on children with ear infections. The sense in which this is called data-driven is that there are new bacteria and drugs becoming available all the time. These bacteria and drugs must be selectable on menus available to physicians. Rather than update the application, the physicians want to be able to enter *application information*, such as the names of bacteria and drugs, that will populate the menus in the application.

## The Companion Radio application
This application provides automated disc jockey facilities to a radio station that must play music tracks and report copyright information to regulators. This application includes menus of categories of music and rules about playing music that the client would like to be able modify without programmer intervention. Like the Acute Otitis Media application, this application contains a facility to enter *application information* that determines the content of menus in the application.

## Why database applications support customer modification
The preceding examples suggest why customers should be able to modify applications.
For example, the applications are more immediately responsive to changes in the customer's environment. Any bottleneck represented by contact with the application developer is removed.

It also suggests some practices. For example, there are different classes of users. Some are only permitted to perform CRUD actions on business data. Some are permitted to perform CRUD actions on applications data governing the control of the application.

## Customer modification may lead to an inner-platform effect
The term inner-platform effect refers to the temptation to create a platform within the platform being used by the developer. It has only very rarely occurred in the history of computing that it was a good idea to create a new platform for a project. Generally, a platform created within another platform is underdeveloped.

## Sources of the inner-platform effect
The temptation to create an inner platform is strong. It can be especially strong in database programming where the developer uses two primary tools arising from different paradigms, say, an object-oriented programming language and a relational database tool.
It is almost inevitable that a developer feels more strongly about one of these paradigms than the other and thinks more readily in one of these paradigms than the other. One question that is unsettled in my mind is whether the developer then reinvents the tool with which they are more familiar, perhaps to augment the less familiar tool, or reinvents the less familiar tool because they have less facility with it.

## To be continued ...
For now, I would like to join you in googling the term data-driven programming and explore the different meanings we encounter for the term.

[Data-driven-programming](http://en.wikipedia.org/wiki/Data-driven_programming)
defines it

[Data-driven programs](http://c2.com/cgi/wiki?DataDrivenPrograms)

[Little Language](http://c2.com/cgi/wiki?LittleLanguage)
discusses Jon Bentley's *Programming Pearls*\linebreak books.

[TAOUP Chapter 9](http://www.catb.org/esr/writings/taoup/html/ch09s01.html)
Eric Raymond describes his development of `fetchmail` in data-driven terms.

[Stack Overflow discussion](http://stackoverflow.com/questions/1065584/what-is-data-driven-programming)
contains the most of the text in the lecture notes I inherited on this topic.

## To be further continued ...
[Can a system be data-driven?](http://programmers.stackexchange.com/questions/231637/can-a-system-be-100-data-driven)

Is such a 100% Data Driven Application possible?

*This is where I just started. With my answer I'm trying to agree with the original post that: It is possible, but you're correct, it will just shift the problem one level higher for no \[obvious\] benefit.*

[Wikipedia on inner platform effect](http://en.wikipedia.org/wiki/Inner-platform_effect)

[Inner platform effect](http://thedailywtf.com/articles/The_Inner-Platform_Effect)

## To be further further continued ...
[Dynamic tables](http://www.thedailywtf.com/articles/dynamic-tables)

[Table-driven programming](http://www.paragoncorporation.com/ArticleDetail.aspx?ArticleID=31)
This article provides an example similar to an assignment in our *Application Development Practices* course and provides a database solution (called table-driven programming in the article) to the *refactoring* exercise from the *Application Development Practices* course.
