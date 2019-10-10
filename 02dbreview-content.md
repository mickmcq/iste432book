
# RDBMS Review
The following review material comes from a generic database course, the intro course in which students learned to produce these three artifacts: entity relationship diagrams, functional dependencies, and relational notation.

This course assumes you can do the things learned in an introductory course on databases as well as a course on connecting to databases and working with them in an application programming language. The following subsections review some introductory course material. If you can not easily and quickly follow this material on your own, you may not be ready to begin this course and may require further work on your own to get up to speed in this course.

## Diagrams
Creating and viewing diagrams are central activities for any information technology professional.
To develop a database system, or any system large enough to justify effort, we must communicate with team members and possibly with suppliers and customers about the details of the system.
Diagrams solve a communication problem that arises from the wide chasm between natural languages and programming languages. Diagrams represent a middle ground between sentences spoken in a natural language and statements written in a programming language.
Conversation is too general and ambiguous to specify details of an information system. In any given conversation about a particular information system, the professionals involved likely speak different programming languages or dialects. Even your own programs are difficult to read a long time after you've written them.

There are vastly many diagramming tools for describing information systems in general. For example, UML (Unified Modeling Language) specifies at least the following kinds of diagrams:
class diagram,
object diagram,
package diagram,
component diagram,
use case diagram,
sequence diagram,
statechart diagram,
activity diagram,
and
profile diagram. This list comes from a diagramming software package called StarUML, and is not even a complete list of the diagrams supported by that package.

The diagrams we will work with in this course are entity relationship diagrams, the most venerable and widely used diagrams employed by database professionals. The entity relationship diagram may also be the most widely used kind of diagram employed by any information technology professionals.

Software packages for drawing diagrams have short lifespans. Diagram syntax, on the other hand, endures. Peter Chen popularized the first syntax for entity relationship diagrams in 1976 and there are today really only three basic variants on that syntax. It has been hugely popular since its introduction, almost three times as long as the dreadful Visio drawing software program that has been popularly used to produce it during the decade since Microsoft purchased Visio. There is little sense in growing overly attached to particular diagramming software packages. While you are likely to use ERDs throughout your careeer, the software packages you use will come and go. The companies that produce software packages live and die and sell out and close off their formats to prevent sharing of diagrams among rival software packages. It is tempting to list experience with different software packages on your resume, but it is more important for your career to be able to read and write the symbols on an entity relationship diagram using pencil and paper than to manipulate the menus of some software package that will soon be updated to be incompatible with itself.

## Normalization
You should have taken at least two database courses before this course. In your first database course, you should have learned to normalize data and some concepts related to normalization. These are reviewed as follows, with an example from an introductory database course.

## Normalization Definitions
Using library.rit.edu,

- visit `find a database`,
- then `electronic books`,
- then `books24x7`,
- then search for `teorey, toby`

where the following should appear among the listed books.
Toby Teorey et al., *Database modeling and design: logical design*, Fifth Edition, Morgan Kaufmann, 2011.
Following are definitions for normalization given in Chapter 6 of this book.

- A *domain* is the set of all possible values for a
  particular type of attribute, but may be used for more
  than one attribute, e.g., a person's name is a domain
  that may be used for employee name or customer name.
- A *superkey* is a set of one or more attributes that,
  when taken collectively, allows us to identify
  uniquely an entity or relation.
- A *candidate key* is any superkey that can not be
  reduced to another superkey
- A *primary key* is chosen arbitrarily from available
  candidate keys as the identifier for a tuple in the
  relation, also known as a row in the table.

## Candidate and Primary Key Identification
- Any unique tuple (also known as a row) is a superkey.
- Suppose you have a list of people assigned to office
  numbers, 101--109.
- Some of the people have identical names but only
  person is assigned to each office.  Furthermore, each
  office has exactly one phone with one phone number.
- The Office relation has any combination of these
  attributes that includes phone number or office number
  or both as a superkey.
- There are only two candidate keys, though: office
  number alone and phone number alone. Any other
  superkey may be reduced to one of these and still
  uniquely identify a row, satisfying the superkey
  property.
- Either candidate key may be chosen as the primary key.

## Functional Dependencies
- In any relation $R$, a set of attributes $B$ is
  functionally dependent on another set of attributes $A$
  if, at each instant of time, each $A$ value is
  associated with only one $B$ value. Such a functional
  dependence is written \fd{$A$}{$B$} and may be
  read $A$ determines $B$. The left hand side is called the determinant.
- Example: Given the above Office relation,
  $A$ is Room 101 and $B$ is Winston. There is
  only one occupant per room so knowing the room number
  determines the occupant.
- A functional dependency is considered trivial if the LHS is
  a superset of the RHS. If so, it
  has the form \fd{$A,B$}{$B$}. In other words, if
  $A$ does not determine $B$ we could still say that $A$
  and $B$ together determine $B$ but it would be trivial
  to say so.

## Relational Notation
The convention we'll observe for writing out relations is as follows.

\relation{relationName( \pk{primaryKey}, \fk{foreignKey}, field1, field2,\\
$\ldots$ )}

Some books follow the convention that the name of the relation is in all caps. We will not observe that convention here. We will follow the convention of underlining the primary key and italicizing foreign keys. If you are writing in plain text without the ability to underline or italicize, please obey the following convention.

\relation{relationName( \_primaryKey\_, *foreignKey*, field1,\\ field2, $\ldots$ )}

## 1NF: First normal form
A relation is in first normal form, 1NF, if and only if all columns contain only atomic values---that is, each column can have only one value for each row in the table.

Whether an item is atomic is a matter determined by people.

SQL has no concept of non-atomic items. Oracle has an extension to SQL that explicitly defines some items as non-atomic. Hence, any relation specified in SQL is in 1NF unless that relation was specified using an extension to SQL.

For an introductory exercise, it would be sufficient to say

\relation{Item(\pk{ItemID},
ItemName,
Description,
Returnable,\\
Perishable,
ShelfQty,
Notes,
Colors,
RetailPrice,\\
Cost,
Supplier,
Name,
Street,
City,
State,
Zipcode)}

\noindent
to describe the relation in 1NF corresponding to the ER diagram in Figure \ref{fiSampleERdiagram}. This conflicts with my personal folklorish definition of 1NF as taught in many DB textbooks.

\begin{figure}[htbp]
\begin{center}
  \begin{tikzpicture}[xscale=1.7,show background rectangle]
  \tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
    %                          Entities
    \node[entity*] (e00) at (2,2) {
      \entitytitle{ITEM}
    };
    %                        Attributes
    \node[chenattr]      (a00) at (2.0,4)    {supplier};
    \node[chentinyattr]  (a01) at (0.0,5.0)  {name};
    \node[chentinyattr]  (a02) at (1.0,5.0)  {street};
    \node[chentinyattr]  (a03) at (2.0,5.0)  {city};
    \node[chentinyattr]  (a04) at (3.0,5.0)  {state};
    \node[chentinyattr]  (a05) at (4.0,5.0)  {zip};
 
    \node[chenattr]      (a06) at (0.0,4)    {ItemName};
    \node[chenattr]      (a07) at (0.0,3)    {\ul{itemid}};
    \node[chenattr]      (a08) at (0.0,2)    {description};
    \node[chenattr]      (a09) at (0.0,1)    {returnable};
    \node[chenattr]      (a10) at (0.0,0)    {perishable};

    \node[chenattr]      (a11) at (2,0)    {shelf\_qty};
    \node[chenderivattr] (a12) at (4,0)    {profit};

    \node[chenattr]      (a13) at (4.0,4)    {cost};
    \node[chenmultiattr] (a14) at (4.0,3)    {colors};
    \node[chenattr]      (a15) at (4.0,2)    {retail\_price};
    \node[chenattr]      (a16) at (4.0,1)    {notes};

    %                        Relationships
    \draw[relat] (a00) -- (a01);
    \draw[relat] (a00) -- (a02);
    \draw[relat] (a00) -- (a03);
    \draw[relat] (a00) -- (a04);
    \draw[relat] (a00) -- (a05);
    \draw[relat] (e00) -- (a00);
    \draw[relat] (e00) -- (a06);
    \draw[relat] (e00) -- (a07);
    \draw[relat] (e00) -- (a08);
    \draw[relat] (e00) -- (a09);
    \draw[relat] (e00) -- (a10);
    \draw[relat] (e00) -- (a11);
    \draw[relat] (e00) -- (a12);
    \draw[relat] (e00) -- (a13);
    \draw[relat] (e00) -- (a14);
    \draw[relat] (e00) -- (a15);
    \draw[relat] (e00) -- (a16);
  \end{tikzpicture}
\end{center}
\caption{Sample ER diagram}\label{fiSampleERdiagram}
\end{figure}

Many database textbooks teach that 1NF eliminates repeating groups, based on the notion that a repeating group is non-atomic. The Teorey textbook mentioned above hearkens back to the original definition of non-atomic and moves the *eliminate repeating groups* into a more appropriate place in 2NF. Going forward in this class, I would like you to ignore other textbooks on this point.

It would also be correct to specify the same table without any reference to the primary key as being in 1NF. In other words,

\relation{Item(ItemID,
ItemName,
Description,
Returnable,\\
Perishable,
ShelfQty,
Notes,
Colors,
RetailPrice,\\
Cost,
Supplier,
Name,
Street,
City,
State,
Zipcode)}

\noindent
is a valid 1NF relation, assuming that each row is unique. This is because, whether or not we have defined a primary key, a primary key must exist by the definition of candidate key given above.

## 2NF: Second normal form
A relation is in second normal form, 2NF, if and only if it is 1NF and every nonkey attribute is fully dependent on the primary key. An attribute is fully dependent on the primary key if it is is on the right side of a functional dependency for which the left side is either the primary key or something that can be derived from the primary key using the transitivity of functional dependencies.

In many if not most applications, functional dependencies are implied in the ER diagram but not certain. For example, Apple obtains displays for its iPhones from several different suppliers. To uniquely identify a display item might require a concatenation of the item identifier and the supplier identifier. Alternatively, each item might have a separate identifier that incorporates the information about which supplier provided the item.
Suppose we know the functional dependencies

\fd{Supplier}{Name, Street, City, State, Zip}

\noindent
and suppose further that we know that

\fd{Zipcode}{City, State}

Then the following ITEM relation is in 2NF

\relation{Item(\pk{ItemID},
ItemName,
Description,
Returnable,\\
Perishable,
ShelfQty,
Notes,
Colors,
RetailPrice,\\
Cost,
Supplier)}

Notice that the information that is dependent on
Supplier is no longer present. To create the required
tables, I would also specify

\relation{Supplier(\pk{Supplier},
Name,
Street,
Zipcode)}

\noindent
as a separate relation. But what happened to City and State? The above table would not be in 2NF if I included them because City and State ordinarily depend only on Zip. Since I noted that explicitly above, I'm going to skip the 1NF version of a Supplier table go right to a combination of Supplier and Zip as follows

\relation{Zipcode(\pk{Zipcode},
City,
State)}

You may object to using the same word to identify an entity and an attribute. Although we usually add ID to attributes named for entities, I don't think SQL requires it. Also, SQL offers us a way to qualify ambiguous identifiers.

What about Colors? Is the following functional dependency legitimate?

\fd{Item}{Colors}

No. Knowing the Item does not determine the Colors, given that Colors has been described as multi-valued in the ER diagram. Therefore, it should be eliminated from the ITEM relation and a new relation should be specified as

\relation{Itemcolors(\pk{Item},\pk{Colors})}

\noindent
where each row uniquely identifies a combination of Item and Colors. There is only one superkey, one candidate key, and one primary key possible.

## Third normal form
A relation is in third normal form, 3NF, if and only if it is in 2NF and every nonkey attribute is nontransitively dependent on the primary key.

## Boyce-Codd normal form
A relation is in Boyce-Codd normal form, BCNF, if and only if every determinant (LHS of a functional dependency) is a candidate key.

## Fourth normal form
@Date2004, page 385, gives the following definition of fourth normal form: Relvar $R$ is in 4NF if and only if, whenever there exist subsets $A$ and $B$ of the attributes of $R$ such that the nontrivial MVD $A \twoheadrightarrow B$ is satisified, then all attributes of $R$ are also functionally dependent on $A$.

To understand this definition, it is necessary to review Date's definition of multi-valued dependence, MVD, which is as follows. Let $R$ be a relvar and let $A$, $B$, and $C$ be subsets of the attributes of $R$. Then we say that $B$ is multidependent on $A$---in symbols $A \twoheadrightarrow B$ (read $A$ multi-determines $B$ or simply $A$ double arrow $B$)---if and only if, in every legal value of $R$, the set of $B$ values matching a given $AC$ value pair depends only on the $A$ value and is independent of the $C$ value.

## Normalization review
The following paragraphs review normalization as discussed above.

## Define the normalization process and terms
- Anomalies
    - Insertion
    - Modification
    - Deletion
- Functional Dependency
- Determinant
- Candidate versus Primary Key
- Composite Keys

## Normalization Process
- First Normal Form (1NF)
    - Review characteristics of a relation
- Second Normal Form (2NF)
    - Partial Dependency
- Third Normal Form (3NF)
    - Transitive Dependency
- Boyce-Codd Normal Form (BCNF)
- Steps to Fix a Normal Form Violation
    - Referential Integrity
- Relationship Between Normalization and Modeling

## The parts database
I will refer to the *parts database* to mean several different databases that appear in different editions of books by C.J. Date. Various authors have reused and modified the database and called versions of it by different similar-sounding names. The only distinction in these notes is between the *initial* database and the *full* database. I will introduce separate files of SQL statements to create the two versions. Either version must be dropped before loading the other. The *full* database contains one additional relation and that relation affects the other relations in the database.

## Two versions of the database
We'll use the *initial* version for a while, then switch to the full version. Be prepared to slightly redefine some properties of the *initial* version when we switch to the *full* version.

## Entities in the initial database
We are a productive enterprise. We operate in several cities. In each
city we have exactly one warehouse with one receiving dock.
A list on a clipboard at each receiving dock reveals that we know the
following information that needs to be stored in a database of
information about the quantity of parts we have received.
The list is in a simple row and column format where the column headings follow. Every row is completely filled in. Every row represents a quantity of parts of a specific weight and color received at our warehouse in the named city from the supplier in the named city. In other words, the word city occurs twice in the row, once to refer to the city where our warehouse is located and once to refer to the location where the supplier of the quantity listed in that row is located. If we collect all the clipboards and make an enterprise-wide clipboard, it will resemble the following table.

\begin{center}
\tt\footnotesize
\begin{tabular}{lrlllrlr} \toprule
  sname  & rating & city  & color & pname & weight & city  & qty
  \\               \midrule
  Jones  & 10     & Seoul & red   & nut   & 17     & Seoul & 100    \\
  Smith  & 20     & Paris & blue  & nut   & 17     & Paris & 200    \\
  Adams  & 30     & Tokyo & blue  & bolt  & 19     & Tokyo & 300    \\
  $\cdots$ & $\cdots$ & $\cdots$ & $\cdots$ & $\cdots$ & $\cdots$ & $\cdots$ & $\cdots$ \\
\bottomrule
\end{tabular}
\end{center}

- `sname` is the single-word name of a supplier (not necessarily unique)
- `rating` is a two-digit number, our preferential rating of the
  supplier
- `cit`y is the single-word city where a supplier is based (a supplier
  has only one base) and can
  deliver parts to us
- `pnam`e is the single-word name of a part supplied to us by a
  supplier
- `colo`r is the single-word color of a supplied part, where parts with
  the same name may be supplied in different colors
- `weight` is the weight in grams of a part, where parts with the same
  name may be supplied in different weights
- `city` appears in a second column on the clipboard with respect to
  parts and is the city where we took delivery of a part (so far
  always the same city as in the first column) and stored it in our
  one warehouse in that city
- `qty` is the quantity of the particular part received

Note that there is no additional information. There is not a timestamp or any way to link these rows to an inventory system nor a purchasing system nor an order entry system. We have only this very simple database, we are not in a position to think about such things. These are simply quantities received and we can inquire of these lists how many parts we have received.

## Symbols to represent these concepts
The above list gives the column heading names on the clipboard at the receiving dock. Use these to determine the entities we need to store in the initial database and to create a draft entity relationship diagram. Begin by listing the symbols that might appear on an entity relationship diagram. Then revisit the list above to make choices about entities and attributes.

Recalling the symbols we need should flow from thinking about what we want to represent. The main purpose of a database is to record information about objects and events in the real world. These objects and events are usually called entities in the database community. The objects usually exist in the real world independently of the database. The events usually occur in the real world and involve relationships between objects. The events of interest usually leave some trace independent of the database. The objects and events can usually be construed as bundles of other objects or events or characteristics, all of which are defined by people using the database. The usual way to record this information is to say that entities (objects and events) have attributes, characteristics that differentiate the entities in dimensions of interest to database users.

The above indicates that diagrams need symbols for entities, attributes, and relationships. We have also seen that we need additional symbols to distinguish between cardinalities of relationships. For entities, we have used a rectangle. For attributes, we have used symbols from the notation of Peter Chen (the inventor of entity relationship diagrams) three kinds of ovals, a solid oval, a dashed oval indicating a derived or calculated attribute, and a double-bordered oval indicating a multi-valued attribute. For relationships, we have used lines connecting two or more rectangles. Peter Chen's system uses a diamond on the line connecting rectangles but we have been using an informal hybrid of some elements of Chen's approach and some elements of another approach called crowsfoot notation, named for the line endings. We've also used some elements of a notation called IDEF1.

We have also used lines to connect attributes to entities but we have used that to think about entities and attributes. We will abandon that practice in favor of listing attributes in rectangles when develop a more refined view of entities and their relationships and can draw a more robust entity relationship diagram. The diagram will be robust in the sense that we will share it with others and it will reflect a working database and may be useful for a long time. For the moment, the list of symbols includes

- rectangle: entity
- oval
    - solid: attribute
    - dashed: derived attribute
    - double-bordered: multi-valued attribute
    - oval with branching ovals: composite attribute
- line: relationship between entities (the lines that connect composite
  attributes are problematic)
- line annotations
    - verb: relationship, where above is read left to right and below is read right to left
      if the line is horizontal and bottom to top on left and top to bottom on right if the line is vertical
    - numbers: minimum / maximum cardinality more specific than is
      portrayed by line endings
- line-ending
    - crowsfoot: many (we won't actually use this in completed diagrams)
    - crowsfoot 0: zero or more
    - crowsfoot 1: one or more
    - 1 1: one and only one
    - 1 0: zero or one

\begin{center}
\begin{tikzpicture}[show background rectangle]
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
    %                        Attributes
    \node[chenattr]      (a00) at (0.0,2)      {attr};
    \node[chenmultiattr] (a01) at (0.0,0.5)  {multival};
    \node[chenderivattr] (a02) at (4.0,2)    {derived};
    \node[chenattr]      (a03) at (4.0,0.9)  {composite};
    \node[chentinyattr]  (a04) at (2.2,-0.1) {part1};
    \node[chentinyattr]  (a05) at (3.85,-0.1){part2};
    \node[chentinyattr]  (a06) at (5.5,-0.1) {part3};
    %                        Relationships
    \draw[relat] (a03) -- (a04);
    \draw[relat] (a03) -- (a05);
    \draw[relat] (a03) -- (a06);
  \end{tikzpicture}
\end{center}

While we have used the ovals shown above, we will not construct diagrams for hw and exams using this notation. Instead, we will see these in examples and use a different notation when we develop them. On the other hand, we will use verbs on the relationships as in the following example. The word provides is read left to right on the horizontal line and from bottom to top on the vertical line. The other label is read the opposite way and may be optional depending on the relationship.

\begin{center}
\begin{tikzpicture}
\draw[relat]
      (0,0) --
      node[relattext,above=0.5pt] {provides}
      node[relattext,below=0.5pt] {is provided by}
      (3,0);
\draw[relat]
      (5,-1.5) --
      node[relattext,above=0.5pt] {provides}
      node[relattext,below=0.5pt] {is provided by}
      (5,1.5);
\end{tikzpicture}
\end{center}

We'll use the following crowsfoot notation. From left to right the symbols read zero or one, one and one only, many (we won't draw this but we'll see it in unfinished diagrams), zero or more, one or more. 


\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Invisibles
  \node (i00) at (0,1) {};
  \node (i01) at (1.2,1) {};
  \node (i02) at (2.2,1) {};
  \node (i03) at (3.0,1) {};
  \node (i04) at (4.3,1) {};
  \node (i05) at (5.3,1) {};
  %                          crowsfeet
    \draw[
      draw=dbnotation,
      thick,
      arrows={-crowsfoot01}
    ] (i00) -- (i01);
    \draw[
      draw=dbnotation,
      thick,
      arrows={-crowsfoot11}
    ] (i01) -- (i02);
    \draw[
      draw=dbnotation,
      thick,
      arrows={-crowsfoot+}
    ] (i02) -- (i03);
    \draw[
      draw=dbnotation,
      thick,
      arrows={-crowsfoot0+}
    ] (i03) -- (i04);
    \draw[
      draw=dbnotation,
      thick,
      arrows={-crowsfoot1+}
    ] (i04) -- (i05);
    \end{tikzpicture}
\end{center}

There may be ambiguity between *zero or one* and *zero or more* so use the most restrictive applicable notation. If you know that *zero or one* is correct, do not use *zero or more*, even though it is strictly true. If you are given enough information to know that the entity occurs zero or one time, it will be graded as an error to say that it occurs zero or more times.

## Distinguishing entities and attributes
Try to distinguish between an entity and an attribute. An entity is an object, process, or event of interest to the enterprise. Think of the items in the list from the viewpoint of the enterprise.

A productive enterprise buys, sells, grows, mines, trades, transforms, makes, and consumes entities. A productive enterprise employs entities, partners with entities, buys from entities, sells to entities, competes with entities, and pays taxes to entities. 

By productive enterprise I refer to what is often called the private sector. The public sector is analogous but includes other activities. An organization in the public sector may regulate entities, draft entities, educate entities, defend entities, provide public entities, and more.

Another kind of entity is an event. Events are often described by verbs or gerunds, as well as nouns. Can we say we are selling? Can we say we are buying? These are events that leave traces, such as receipts and invoices.

A third kind of entity is a process. Processes are more difficult to represent in databases than events or objects. Much of the history of information technology has seen tension between process and data as two very different domains of work, where processes are the province of programs and data is the stuff of databases. Approaches to information technology have often been characterized as either process-driven or data-driven as if these two approaches lack compatibility with each other.

One explanation for the tension between process and data and the submergence of process below object and event in entity relationship diagrams may be found in the study of history.
One of the most famous historians of the twentieth century was Fernand Braudel. Braudel altered the way historians studied history, in part, by dividing history in a way similar to the preceding classification of objects, events, and processes. First, Braudel described certain features as persistent, as present for a very long time, like objects. Second, he described certain features as processes, mostly economic, played out in medium time scales. Third, he considered events as having a brief and easily defined time of occurrence. He claimed that it was much easier to study the events and the persistent objects and that it was much harder to study processes occurring at an intermediate time scale. Braudel claimed that the study of history suffered from the difficulty of including medium time scale processes and influenced historians to reexamine their work to find opportunities to consider the relevance of these processes.

The preceding paragraph is a gross simplification and the author of these paragraphs is not a historian. Yet even a casual reading of Braudel presents a striking parallel for a database professional trying to piece together a picture of the relationships between entities, where the briefest events and most persistent objects are easier to identify than are medium-term processes.

## Attributes
An attribute is a relevant characteristic of an entity. Since we're interested in the viewpoint of the enterprise we mean relevant from the viewpoint of the enterprise. For each item in the inventory list, Ask yourself if you can say that it is a property of another item in the list or an item whose existence is implied by the list.

Consider color. Is color a property of some other item in the list? Is it a property of an item whose existence is implied by the list? Do we sell to color? Is color a property of a screw? Ask similar questions of weight, pname, city, and so on. While we may conceptualize many words as nouns and therefore entities, many are used as adjectives. These may well be properties or characteristics.

As we look through the above list, it should stand out that we record information about suppliers and parts. We buy from suppliers. Suppliers sell to us. We acquire parts. We use parts. These are the most obvious entities from which we may begin to construct an entity relationship diagram. From now on, when we construct an entity relationship diagram, we'll use a convention found in some entity relationship diagramming software, such as MySQL Workbench, where entities and attributes are depicted in rectangles with rounded corners. A horizontal line across the rectangle separates the entity names from the attribute names.

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity*] (e00) at (0,2) {
    \entitytitle{s}
  };
  \node[entity*] (e01) at (5.0,2) {
    \entitytitle{p}
  };
  %                          Relationships
  \draw[
     draw=dbnotation,
     thick,
     arrows={crowsfoot1+-crowsfoot1+}
  ] (e00) -- (e01);
  \end{tikzpicture}
\end{center}

I claim that there is a many-to-many relationship between these entities. To see why, imagine a table consisting of these two entities and nothing else.
\begin{center}
\tt\small
\begin{tabular}{rl}  \toprule
  supplier & part \\ \midrule
  Smith    & nut  \\
  Smith    & bolt \\
  Smith    & cog  \\
  Jones    & nut  \\
  Jones    & bolt \\
  Adams    & bolt \\
  Adams    & cog  \\ \bottomrule
\end{tabular}
\end{center}
Now examine each column. May a supplier appear more than once? Yes. May a part appear more than once? Yes. It may help to revisit the orca pool question. Recall that we must place the following orcas into pools: Shamu, Whamu, Blamu, and Kramu. We have pools A, B, and C. Since there are more orcas than pools, at least two orcas will have to share a pool. One way we could distribute them would be the following arrangement.

\begin{center}
\tt\small
\begin{tabular}{rr} \toprule
  orca  & pool \\   \midrule
  Shamu  & A   \\
  Whamu  & B   \\
  Blamu  & C   \\
  Kramu  & A   \\
\bottomrule
\end{tabular}
\end{center}

How often may an orca appear? Once and only once. Due to requirements of cetacean biology, it can not survive long out of a pool. We must put each orca into a pool and there is no way to distribute one orca among many pools and still have it available to do tricks for our patrons and crush any lunatics who insist on swimming with the whales after closing time.
According to the following diagram, many orcas may inhabit a pool. A pool contains potentially many orcas.

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity*] (e00) at (0,2) {
    \entitytitle{orca}
  };
  \node[entity*] (e01) at (5.0,2) {
    \entitytitle{pool}
  };
  %                          Relationships
  \draw[
     draw=dbnotation,
     thick,
     arrows={crowsfoot0+-crowsfoot11}
  ] (e00) --
      node[relattext,above=0.5pt] {inhabit}
      node[relattext,below=0.5pt] {contains}
  (e01);
  \end{tikzpicture}
\end{center}

The above relationship does not lead to database anomalies. In general, many to many relationships in entity relationship diagrams require work, while one to many relationships are easy to transform into databases without insertion, deletion, and update anomalies. So our many to many picture of suppliers and parts will need work to make a diagram that will be easily transformed into a database.

The first step I would like to take is to add the attributes from our clipboard that clearly belong to supplier and part. We can ask of each column on the clipboard whether it is something a supplier has or something a part has. Certainly a supplier has a name, given by \attr{sname}. A supplier, according to the description, has a \attr{rating}, a numeral expressing a preferential rating. A supplier has a \attr{city}. A part clearly has a name, given by \attr{pname}, as well as a \attr{weight} and \attr{color}.

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity] (e00) at (0,2) {
    \entitytitle{s}
    \attributes
    \attrib{sname}
    \attrib{rating}
    \attrib{city}
  };
  \node[entity] (e01) at (5.0,2) {
    \entitytitle{p}
    \attributes
    \attrib{pname}
    \attrib{color}
    \attrib{weight}
  };
    %                        Relationships
    \draw[
      draw=dbnotation,
      thick,
      arrows={crowsfoot1+-crowsfoot1+}
    ] (e00) --
        node[relattext,above=0.5pt] {supply}
        node[relattext,below=0.5pt] {are supplied by}
      (e01);
  \end{tikzpicture}
\end{center}

The above uses the notation we'll continue to employ for all entity relationship diagrams we produce. While you will still see the Chen style diagrams with ovals, you will not produce them as solutions to problems. This style of diagram has no symbology for derived or multivalued attributes. Generally, there is no need for them in solutions to problems but, should the need arise, you can simply write the strings \attr{derived} or \attr{multivalued} in parentheses after the attribute name.

Now think about the remaining columns, the second occurrence of \attr{city} and \attr{qty}. Where do these belong? Does a part have a city? Does a part have a quantity? The second occurrence of \attr{city} is the location of the warehouse where we have received the quantity of parts listed as \attr{qty}. Both of these are really attributes of an event, the event where we have received a quantity of parts, the event that is recorded by each row of each clipboard. This is certainly an event of interest to the enterprise because it is the one thing being recorded. The number of rows filled in on the clipboards is the number of times this event has occurred. The event itself, an entity called \textbf{\texttt{q}} in the following diagram, really only needs a link to each of the other entities and its own information, \attr{city} and \attr{qty}. The eight columns of the clipboard can be filled in as follows. 

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity] (e00) at (0,2) {
    \entitytitle{s}
    \attributes
    \attrib{sname}
    \attrib{rating}
    \attrib{city}
  };
  \node[entity] (e01) at (5.0,2) {
    \entitytitle{p}
    \attributes
    \attrib{pname}
    \attrib{color}
    \attrib{weight}
  };
  \node[entity] (e02) at (2.5,0) {
    \entitytitle{q}
    \attributes
    \attrib{qty}
    \attrib{city}
  };
    %                        Relationships
    \draw[
      draw=dbnotation,
      thick,
      arrows={crowsfoot1+-crowsfoot1+}
    ] (e00) -- (e01);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e00) |- (e02);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e01) |- (e02);
  \end{tikzpicture}
\end{center}

Two main issues remain. First, we must ensure that we have the right symbols on the relationship lines. Second, we need to say explicitly how we link these entities.

The first issue requires serious thought.
There will always be exactly one supplier associated with every quantity received, just as there is exactly one supplier listed on every row on the clipboard. The definition of quantity received that we have obtained from examining the clipboard is that it comes from one supplier. From this definition we know that the supplier information will not be empty, either, so we must regard the supplier information as referring to one and only one. Each supplier may appear many times on the clipboard, so the quantity received side of the relationship can occur many times. I have chosen to portray this side of the relationship as zero or more because we may have a new supplier from whom we have not yet received any quantities of any parts. Similarly, we may have old suppliers no longer operating but will likely maintain a record of them. It is rare to delete entities from business databases. The parts are in the same position as the suppliers. We may know in advance that we will need parts not yet received and we will likely maintain a record of parts no longer being used.

The second issue is the link between the event and the two objects. There is no guarantee that any of the attributes or combinations of attributes of supplier and quantity received are unique. The combination of name, color, and weight is unique for every part. Nevertheless, we will assign a unique id number for each of these three entities and add that to each of the attribute lists. This is usual practice in database management where it is rarely a good idea to use naturally occurring information as an identifier. Strings that appear to be unique at the start of a database project often lose their uniqueness over time as business practice changes. It is almost never a mistake to add an artificial identifier as we do here.

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity] (e00) at (0,2) {
    \entitytitle{s}
    \attributes
    \attrib{\ul{sid}}
    \attrib{sname}
    \attrib{rating}
    \attrib{city}
  };
  \node[entity] (e01) at (5.0,2) {
    \entitytitle{p}
    \attributes
    \attrib{\ul{pid}}
    \attrib{pname}
    \attrib{color}
    \attrib{weight}
  };
  \node[entity] (e02) at (2.5,0) {
    \entitytitle{q}
    \attributes
    \attrib{\ul{qid}}
    \attrib{\textsl{sid}}
    \attrib{\textsl{pid}}
    \attrib{qty}
    \attrib{city}
  };
    %                        Relationships
    \draw[
      draw=dbnotation,
      thick,
      arrows={crowsfoot1+-crowsfoot1+}
    ] (e00) -- (e01);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e00) |- (e02);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e01) |- (e02);
  \end{tikzpicture}
\end{center}
The preceding diagram shows both the problem and the solution. The next diagram shows only the solution. Which is better? Which do you prefer to find when you first discover a database and wish to understand it well enough to work with it?

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  %                          Entities
  \node[entity] (e00) at (0,2) {
    \entitytitle{s}
    \attributes
    \attrib{\ul{sid}}
    \attrib{sname}
    \attrib{rating}
    \attrib{city}
  };
  \node[entity] (e01) at (5.0,2) {
    \entitytitle{p}
    \attributes
    \attrib{\ul{pid}}
    \attrib{pname}
    \attrib{color}
    \attrib{weight}
  };
  \node[entity] (e02) at (2.5,0) {
    \entitytitle{q}
    \attributes
    \attrib{\ul{qid}}
    \attrib{\textsl{sid}}
    \attrib{\textsl{pid}}
    \attrib{qty}
    \attrib{city}
  };
    %                        Relationships
    %\draw[
    %  draw=dbnotation,
    %  thick,
    %  arrows={crowsfoot1+-crowsfoot1+}
    %] (e00) -- (e01);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e00) |- (e02);
    \draw[
      rounded corners,
      draw=dbnotation,
      thick,
      arrows={crowsfoot11-crowsfoot0+}
    ] (e01) |- (e02);
  \end{tikzpicture}
\end{center}

## Examples from an Introductory Course
You should be able to answer the following questions as a prerequisite (not the only prerequisite) for the present course. If you can not complete these on your own, you may not be ready for this course and may not be able to pass this course without further work on your own prior to attempting this course. The following exercise problem statements are copyrighted by Elissa Weeden and used here with permission.

## Going from functional dependencies to relational notation
Please normalize the following relation through BCNF and write the answer using relational notation.

\relation{LOT( \pk{propertyID}, countyName, lotID, area, price, taxRate )}

Assume the following functional dependencies.

1. \fd{propertyID}{countyName, lotID, area, price,\\ taxRate}
2. \fd{countyName, lotID}{propertyID, area, price,\\ taxRate}
3. \fd{countyName}{taxRate}
4. \fd{area}{price}

## Q/A About Functional Dependencies
Given the relation

\relation{MUSIC( \pk{Title},
Artist,
NumGrpMembers,
Year,
Producer,\\
ProducerURL,
Category,
CategorySales,
\pk{Media},
MediaPrice
)}

\noindent and the following business rules

1. Each album is uniquely identified by its title. For the remaining rules, the Title attribute of MUSIC refers to the album name.
2. An artist may be a single person or a group, the count of which is recorded in NumGrpMembers.
3. Each album is released in exactly one year.
4. Each album is produced by exactly one producer (a music company).
5. Each producer has exactly one URL.
6. Each album has exactly one artist.
7. Each album has exactly one music category.
8. Each category is associated with one sales value, CategorySales, which is the year-to-date sales in that category.
9. All sales occur at a price dependent only on media type, e.g., 8 track cartridges all cost 5.99 USD, all audio cassettes cost 6.99 USD, 78s cost 7.99, LPs cost 8.99, cylinders cost 9.99, and so on.

List all functional dependencies for the MUSIC relation, using only the given business rules. Specify whether any dependency causes any 2NF or 3NF violations.

### Answer
Step 1 is to examine each business rule in turn and write the functional dependency it describes.

a. \fd{Artist}{NumGrpMembers} (rule 2)
b. \fd{Title}{Year, Producer, Artist, Category} (rules 3, 4, 6, 7)
c. \fd{Producer}{ProducerURL} (rule 5)
d. \fd{Category}{CategorySales} (rule 8)
e. \fd{Media}{MediaPrice} (rule 9)

\medskip\hrule\medskip

Step 2 is to use the above functional dependencies to identify candidate keys for the \attr{MUSIC} relation.
Why not begin with a superkey composed of the LHS of each functional dependency? This provides a composite key of \attr{\pk{Artist}, \pk{Title}, \pk{Producer}, \pk{Category}, \pk{Media}}. Next, examine this superkey to see what can be removed from it. Since three of the attributes depend on \attr{Title}, they may be removed, leaving an irreducible superkey (candidate key) of \attr{\pk{Title}, \pk{Media}}. Next, if this is to be used as the primary key, identify the functional dependencies above that would lead to a partial dependency---a nonkey attribute dependent on part of the primary key or a transitive dependency---a nonkey attribute dependent on another nonkey attribute that is in turn dependent on the primary key.
The partial dependencies are 2NF violations and the transitive dependencies are 3NF violations.

\medskip\hrule\medskip

Given a primary key of \attr{\pk{Title}, \pk{Media}}:

a. \fd{Artist}{NumGrpMembers}
   leads to a transitive dependency where
   \attr{NumGrpMembers}
   is dependent on an attribute other than the primary key
b. \fd{Title}{Year, Producer, Artist, Category}
   leads to partial dependencies where
   \attr{Year},
   \attr{Producer},
   \attr{Artist},
   and
   \attr{Category}
   are dependent on
   \attr{Title}
   which is part of the primary key
c. \fd{Producer}{ProducerURL}
   leads to a transitive dependency where
   \attr{ProducerURL}
   is dependent on an attribute other than the primary key
d. \fd{Category}{CategorySales}
   leads to a transitive dependency where
   \attr{CategorySales}
   is dependent on an attribute other than the primary key
e. \fd{Media}{MediaPrice}
   leads to a partial dependency where
   \attr{MediaPrice}
   is dependent on
   \attr{Media}
   which is part of the primary key

## Q/A about Normalization, 1
For the following relation and functional dependencies, determine the highest normal form that describes it. If that is not BCNF, then normalize it and any needed additional relations, through BCNF.

\relation{Q1(\pk{a},\pk{b},c,d)}

\fd{a,b}{c,d}

\fd{c}{d}

### Answer
Relation \attr{Q1} has the primary key \attr{\pk{a},\pk{b}}. The first functional dependency tells us that this primary key determines the other two attributes, so the relation is at least in 2NF.
The second functional dependency tells us that the attribute \attr{d} depends on a nonkey attribute so the relation can not be in 3NF.

Normalizing the relation requires removing the transitively dependent attribute to another relation, leaving a foreign key in the existing relation. Therefore we need to specify a new relation and a referential integrity constraint.

\relation{Q1( \pk{a},\pk{b},\fk{c} )}

\integrityconstraint{Q1(c) must exist in Q1C(c)}

\relation{Q1C( \pk{c},d )}

## Q/A about Normalization, 2
For the following relation and functional dependencies, determine the highest normal form that describes it. If that is not BCNF, then normalize it and any needed additional relations, through BCNF.

\relation{Q2(\pk{a},\pk{b},c,d)}

\fd{a,b}{c,d}

\fd{a}{c}

\fd{b}{d}


### Answer
Relation \attr{Q2} has the primary key \attr{\pk{a},\pk{b}}. The first functional dependency tells us that this primary key determines the other two attributes, so the relation could be in 2NF if the remaining functional dependencies don't introduce any problems. Unfortunately, they do. The second functional dependency says that \attr{c} depends on part of the primary key, so the relation \attr{Q2} is not in 2NF. The third functional dependency the information that a second attribute, \attr{d}, depends on part of the primary key. Either of these dependencies alone is enough to limit \attr{Q2} to being in 1NF. To normalize this relation, these attributes must be removed to new tables and referential integrity constraints must be added because the components of the primary key of \attr{Q2} are now also foreign keys of the new relations.

\medskip\hrule\medskip

\relation{Q2( \pkfk{a},\pkfk{b} )}

\integrityconstraint{Q2(a) must exist in Q2A(a)}

\integrityconstraint{Q2(b) must exist in Q2B(b)}

\relation{Q2A( \pk{a},c )}

\relation{Q2B( \pk{b},d )}

## Q/A about Normalization, 3
For the ER diagram in Figure \ref{fiRepeatSampleERdiagram} and the following functional dependencies, determine the highest normal form that describes it. If that is not BCNF, then normalize it and any needed additional relations, through BCNF.

\fd{itemid}{ItemName, name, street, city, state,\linebreak zip, cost, color1, color2, notes, shelf\_qty,\linebreak perishable, returnable, description}

\fd{name}{street, city, state, zip}

\begin{figure}[htbp]
\begin{center}
  \begin{tikzpicture}[xscale=1.7,show background rectangle]
  \tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
    %                          Entities
    \node[entity*] (e00) at (2,2) {
      \entitytitle{ITEM}
    };
    %                        Attributes
    \node[chenattr]      (a00) at (2.0,4)    {supplier};
    \node[chentinyattr]  (a01) at (0.0,5.0)  {name};
    \node[chentinyattr]  (a02) at (1.0,5.0)  {street};
    \node[chentinyattr]  (a03) at (2.0,5.0)  {city};
    \node[chentinyattr]  (a04) at (3.0,5.0)  {state};
    \node[chentinyattr]  (a05) at (4.0,5.0)  {zip};
 
    \node[chenattr]      (a06) at (0.0,4)    {ItemName};
    \node[chenattr]      (a07) at (0.0,3)    {\ul{itemid}};
    \node[chenattr]      (a08) at (0.0,2)    {description};
    \node[chenattr]      (a09) at (0.0,1)    {returnable};
    \node[chenattr]      (a10) at (0.0,0)    {perishable};

    \node[chenattr]      (a11) at (2,0)    {shelf\_qty};
    \node[chenderivattr] (a12) at (4,0)    {profit};

    \node[chenattr]      (a13) at (4.0,4)    {cost};
    \node[chenmultiattr] (a14) at (4.0,3)    {colors};
    \node[chenattr]      (a15) at (4.0,2)    {retail\_price};
    \node[chenattr]      (a16) at (4.0,1)    {notes};

    %                        Relationships
    \draw[relat] (a00) -- (a01);
    \draw[relat] (a00) -- (a02);
    \draw[relat] (a00) -- (a03);
    \draw[relat] (a00) -- (a04);
    \draw[relat] (a00) -- (a05);
    \draw[relat] (e00) -- (a00);
    \draw[relat] (e00) -- (a06);
    \draw[relat] (e00) -- (a07);
    \draw[relat] (e00) -- (a08);
    \draw[relat] (e00) -- (a09);
    \draw[relat] (e00) -- (a10);
    \draw[relat] (e00) -- (a11);
    \draw[relat] (e00) -- (a12);
    \draw[relat] (e00) -- (a13);
    \draw[relat] (e00) -- (a14);
    \draw[relat] (e00) -- (a15);
    \draw[relat] (e00) -- (a16);
  \end{tikzpicture}
\end{center}
\caption{Repeat of Previous Sample ER diagram}\label{fiRepeatSampleERdiagram}
\end{figure}

### Answer
The second functional dependency indicates that supplier is an entity for which we only need name in the item relation as a foreign key.
So we can certainly remove the items in the composite attribute from the item relation except name.
First draft:

\relation{item( \pk{itemid}, ItemName, name, cost, retail\_price,\\ color1, color2, notes, shelf\_qty, perishable,\\ returnable, description )}

\relation{supplier( \pk{name}, street, city, state, zip )}

\medskip\hrule\medskip

The presence of a multivalued attribute in the diagram, colors, indicates that we can remove the colors to a separate relation and omit them from the item relation. Then we need a relation that allows us to associate an item with a color. We can ignore the derived attribute in the diagram, \attr{profit}, since it can be calculated at runtime.
Second draft:

\relation{item( \pk{itemid}, ItemName, \fk{name}, cost, retail\_price, notes,\\ shelf\_qty, perishable, returnable, description )}

\relation{supplier( \pk{name}, street, city, state, zip )}

\relation{colors( \pk{color} )}

\relation{itemcolors( \pkfk{itemid}, \pkfk{color} )}

\medskip\hrule\medskip

Since we now have foreign keys appearing in two relations, we need referential integrity statements. Third draft:

\relation{item( \pk{itemid}, ItemName, \fk{name}, cost, retail\_price, notes,\\ shelf\_qty, perishable, returnable, description )}

\integrityconstraint{item(name) must exist in supplier(name)}

\relation{supplier( \pk{name}, street, city, state, zip )}

\relation{colors( \pk{color} )}

\relation{itemcolors( \pkfk{itemid}, \pkfk{color} )}

\integrityconstraint{itemcolors(itemid) must exist in item(itemid)}

\integrityconstraint{itemcolors(color) must exist in colors(color)}

This third draft constitutes a final answer because it is in third normal form and each determinant in a functional dependency is a candidate key.

## Q/A about Normalization, 4
For the following relation and functional dependencies, determine the highest normal form that describes it. If that is not BCNF, then normalize it and any needed additional relations, through BCNF.

\relation{sale( 
  \pk{InvoiceN},
  \pkfk{ItemN},
  CustID,
  CustName,
  CustAddress,\\
  ItemName,
  ItemPrice,
  ItemQtyPurch,
  SalespersonN,\\
  SalespersonName,
  subtotal,
  Tax,
  TotalDue
)}

\fd{InvoiceN,ItemN}{CustID,
  CustName,
  CustAddress,\\
  ItemName,
  ItemPrice,
  ItemQtyPurch,
  SalespersonN,\\
  SalespersonName,
  subtotal,
  Tax,
  TotalDue
}

\fd{ItemN}{ItemName,ItemPrice}

\fd{InvoiceN}{CustID,
  CustName,
  CustAddress,\\
  SalespersonN,
  SalespersonName,
  subtotal,
  Tax,
  TotalDue
}

\fd{CustID}{CustName,CustAddress}

\fd{SalespersonN}{SalespersonName}

### Answer
Five functional dependencies are described. The first functional dependency does not imply any change since it gives the primary key of SALE as the LHS and all attributes of SALE as the RHS.

The second functional dependency says that \attr{ItemName} and \linebreak
\attr{ItemPrice} depend on part of the primary key, so they must be removed to a separate relation and a referential integrity constraint added.
(Note that I replace each hash mark with an uppercase N. Hash marks are not legal in identifiers in many languages so I typically avoid them.)

\relation{sale( 
  \pk{InvoiceN},
  \pkfk{ItemN},
  CustID,
  CustName,
  CustAddress,\\
  ItemQtyPurch,
  SalespersonN,
  SalespersonName,
  subtotal,
  Tax,\\
  TotalDue
)}

\integrityconstraint{sale(ItemN) must exist in ItemN(ItemN)}

\relation{ItemN( \pk{ItemN}, ItemName, ItemPrice )}

\medskip\hrule\medskip

The third functional dependency tells us that eight attributes depend on part of the primary key, so they must be removed to a separate relation and a referential integrity constraint added.

\relation{sale( 
  \pkfk{InvoiceN},
  \pkfk{ItemN},
  ItemQtyPurch
)}

\integrityconstraint{sale(ItemN) must exist in ItemN(ItemN)}

\relation{ItemN( \pk{ItemN}, ItemName, ItemPrice )}

\integrityconstraint{sale(InvoiceN) must exist in InvoiceN(InvoiceN)}

\relation{InvoiceN( \pk{InvoiceN},
  CustID,
  CustName,
  CustAddress,\\
  SalespersonN,
  SalespersonName,
  subtotal,
  Tax,
  TotalDue
)}

\medskip\hrule\medskip

The fourth functional dependency tells us that \attr{CustName} and \attr{CustAddress} depend on an attribute of the new relation InvoiceN, so they must be removed to a separate relation and a referential integrity constraint added.

\relation{sale( 
  \pk{InvoiceN},
  \pkfk{ItemN},
  ItemQtyPurch
)}

\integrityconstraint{sale(ItemN) must exist in ItemN(ItemN)}

\relation{ItemN( \pk{ItemN}, ItemName, ItemPrice )}

\integrityconstraint{sale(InvoiceN) must exist in InvoiceN(InvoiceN)}

\relation{InvoiceN( \pk{InvoiceN},
  \fk{CustID},
  SalespersonN,\\
  SalespersonName,
  subtotal,
  Tax,
  TotalDue
)}

\integrityconstraint{InvoiceN(CustID) must exist in cust(CustID)}

\relation{cust( \pk{CustID},
  CustName,
  CustAddress
)}

\medskip\hrule\medskip

The fifth functional dependency tells us that \attr{SalespersonName} depends on an attribute of the relation \attr{InvoiceN}, so they must be removed to a separate relation and a referential integrity constraint added.

\relation{sale( 
  \pkfk{InvoiceN},
  \pkfk{ItemN},
  ItemQtyPurch
)}

\integrityconstraint{sale(ItemN) must exist in ItemN(ItemN)}

\relation{ItemN( \pk{ItemN}, ItemName, ItemPrice )}

\integrityconstraint{sale(InvoiceN) must exist in InvoiceN(InvoiceN)}

\relation{InvoiceN( \pk{InvoiceN},
  \fk{CustID},
  \fk{SalespersonN},
  subtotal,\\
  Tax,
  TotalDue
)}

\integrityconstraint{InvoiceN(CustID) must exist in cust(CustID)}

\relation{cust( \pk{CustID},
  CustName,
  CustAddress
)}

\integrityconstraint{InvoiceN(SalespersonN) must exist in\\ salesperson(SalespersonN)}

\relation{salesperson( \pk{SalespersonN},
  SalespersonName
)}

\medskip\hrule\medskip

We resolved all the partial and transitive dependencies to create the new set of five relations. To determine whether this new set is in BCNF, we reexamine the five functional dependencies to see whether every determinant (LHS) is a candidate key. As it turns out we have the same number of relations as functional dependencies and each of those relations has a primary key that corresponds to one of the functional dependencies. Therefore, the set of five relations above is a solution in BCNF.

## Q/A about Normalization, 5
For the following relation and functional dependencies, determine the highest normal form that describes it. If that is not BCNF, then normalize it and any needed additional relations, through BCNF.

\relation{A( 
  \pkfk{1},
  \pk{2},
  \pk{3},
  \pk{4},
  5,
  6,
  7,
  8,
  9,
  10
)}

\fd{1,2,3,4}{5,6,7,8,9,10}

\fd{1}{5,6}

\fd{5}{1,6}

\fd{2,3}{7,8}

\fd{7}{8}

\fd{4}{9,10}

\fd{9}{10}

\fd{10}{9}

### Answer
Eight functional dependencies are listed. The problem can be solved like the previous problem, examining the eight functional dependencies in order. As in the previous question, the first functional dependency does not imply any change since it includes the primary key of A as the determinant set and the remaining attributes as the dependent set.

The second functional dependency introduces a partial dependency, requiring \attr{5} and \attr{6} to be removed to a separate relation and a referential integrity constraint to be written. Bear in mind that six always fears seven because seven eight nine.

\relation{A( 
  \pkfk{1},
  \pk{2},
  \pk{3},
  \pk{4},
  7,
  8,
  9,
  10
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  5,
  6
)}

\medskip\hrule\medskip

The third functional dependency indicates that two attributes depend on a nonkey attribute. The situation is complicated by the fact that one of the members of the dependent set is in the first two determinant sets. There is a mutual dependence between \attr{1} and \attr{5}. I have previously described this situation as trivial and one that may be dismissed. Looking it up in my C.J. Date textbook, I see that I should add that mutually dependent attributes may not appear on the same side of a functional dependency. While in this case they never do, it makes sense to check. Another textbook points out that mutual dependence may infer the existence of an undiscovered determinant. In either case, this dependency can be rewritten as a trivial dependency \fd{5}{1} and a transitive dependency \fd{5}{6}. The latter requires that \attr{6} be removed from relation \attr{B} and a new referential integrity constraint added.

\medskip\hrule\medskip

\relation{A( 
  \pkfk{1},
  \pk{2},
  \pk{3},
  \pk{4},
  7,
  8,
  9,
  10
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  \fk{5}
)}

\integrityconstraint{B(5) must exist in C(5)}

\relation{C( 
  \pk{5},
  6
)}

The fourth functional dependency requires that we remove \attr{7} and \attr{8} from relation \attr{A} and add new referential integrity constraints.

\relation{A( 
  \pkfk{1},
  \pkfk{2},
  \pkfk{3},
  \pk{4},
  9,
  10
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  \fk{5}
)}

\integrityconstraint{B(5) must exist in C(5)}

\relation{C( 
  \pk{5},
  6
)}

\integrityconstraint{A(2) must exist in D(2)}

\integrityconstraint{A(3) must exist in D(3)}

\relation{D( 
  \pk{2},
  \pk{3},
  7,
  8
)}

\medskip\hrule\medskip

The fifth functional dependency requires that we remove \attr{8} from relation \attr{D} and add a new referential integrity constraint.

\relation{A( 
  \pkfk{1},
  \pkfk{2},
  \pkfk{3},
  \pk{4},
  9,
  10
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  \fk{5}
)}

\integrityconstraint{B(5) must exist in C(5)}

\relation{C( 
  \pk{5},
  6
)}

\integrityconstraint{A(2) must exist in D(2)}

\integrityconstraint{A(3) must exist in D(3)}

\relation{D( 
  \pk{2},
  \pk{3},
  \fk{7}
)}

\relation{E( 
  \pk{7},
  8
)}

\medskip\hrule\medskip

The sixth functional dependency requires that we remove \attr{9} and \attr{10} from relation \attr{A} and add new referential integrity constraints.

\relation{A( 
  \pkfk{1},
  \pkfk{2},
  \pkfk{3},
  \pkfk{4}
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  \fk{5}
)}

\integrityconstraint{B(5) must exist in C(5)}

\relation{C( 
  \pk{5},
  6
)}

\integrityconstraint{A(2) must exist in D(2)}

\integrityconstraint{A(3) must exist in D(3)}

\relation{D( 
  \pk{2},
  \pk{3},
  \fk{7}
)}

\integrityconstraint{D(7) must exist in E(7)}

\relation{E( 
  \pk{7},
  8
)}

\integrityconstraint{A(4) must exist in F(4)}

\relation{F( 
  \pkfk{4},
  9,
  10
)}

\medskip\hrule\medskip

The seventh and eighth functional dependencies constitute a mutual dependence on the RHS of a previous functional dependency. They require that we remove \attr{9} or \attr{10} from relation \attr{F} and add new referential integrity constraints. Note that it is irrelevant which we remove as long as they do not wind up appearing on the same side of a functional dependency.

\medskip\hrule\medskip

\relation{A( 
  \pkfk{1},
  \pkfk{2},
  \pkfk{3},
  \pkfk{4}
)}

\integrityconstraint{A(1) must exist in B(1)}

\relation{B( 
  \pk{1},
  \fk{5}
)}

\integrityconstraint{B(5) must exist in C(5)}

\relation{C( 
  \pk{5},
  6
)}

\integrityconstraint{A(2) must exist in D(2)}

\integrityconstraint{A(3) must exist in D(3)}

\relation{D( 
  \pk{2},
  \pk{3},
  \fk{7}
)}

\integrityconstraint{D(7) must exist in E(7)}

\relation{E( 
  \pk{7},
  8
)}

\integrityconstraint{A(4) must exist in F(4)}

\relation{F( 
  \pk{4},
  \fk{9}
)}

\integrityconstraint{F(9) must exist in G(9)}

\relation{G( 
  \pk{9},
  10
)}

Since all determinants except those in mutually dependent relations are now candidate keys, the above set is in BCNF.

## Draw an Entity Relationship Diagram
Please draw an entity relationship diagram corresponding to the following situation. Please be sure to identify any strong and weak entities, any recursive relationships, any binary relationships, any ternary relationships, any supertype entities, and any subtype entities. Please use crowsfoot notation for cardinality. Please use the convention of round-edged rectangles for entities, with entity names above a horizontal line in the rectangle and attribute names below the line.

To denote specialization, please use a line between the general entity and an ellipse, with the annotation "partial specialization" or "total specialization" on the line and the word "overlap" or "disjoint" in the ellipse. (Please do not use other notation such as a double line. You will lose points for introducing other notation.) Then use a line between the ellipse and each specialized entity to connect them. The expression "total specialization" means that there are no instances of the general entity. The expression "partial specialization" means that general and specialized entities may exist. The expression "disjoint" means that there is no overlap in the definitions of the specialized entities: no instance could satisfy more than one of the specialized definitions. The expression "overlap" means the reverse of this case, that a specialized entity is not restricted to exactly one of the specialized entity types. To identify weak entities, please write the word weak in parentheses after the entity name. Bear in mind that a weak entity is one that can not be identified by its attributes alone. It must use a foreign key in conjunction with its attribute(s) to form a primary key.

## Situation for Diagram
The Doctor Crippen Memorial Hospital (DCMH) comprises several departments. Data stored about each department includes department number and name.

In addition to department, DCMH maintains data about people in the hospital and relationships between them. Each person related to the hospital has a unique personID and a record of firstname and lastname.

A person may or may not be further classified as either a staff, a patient, or even as both.  Data stored on a patient includes date of birth. For each staff member one job title is stored.

Each department is assigned at least one staff member. A department can have more than one staff member assigned to it.  Each staff member must be assigned to a minimum of one department. Any given staff member may be assigned to more than one department.

A staff member may be a manager and, if so, will manage at least one other staff member, but could manage many different staff members. A staff member doesn’t have to have a manager, but if they do, they will have at most one manager. That manager must also be a staff member.

Each staff member must be classified as exactly one of three types: a support staff member, a nurse or a doctor. A staff member has no more than one of those three classifications. Each support staff member has a wage stored. Each nurse has a certification stored. Each doctor has a DEA number stored.

A doctor does not have to mentor another doctor. A doctor can mentor at most one mentee, which is another doctor. A doctor does not have to have a mentor. If a doctor has a mentor, that mentee will have at most one mentor.

Each patient of DCMH is assigned precisely one doctor.  A doctor does not have to be assigned to any patients, but can be assigned to many different patients. 


## Solution to above exercise
The Doctor Crippen Memorial Hospital (DCMH) comprises several departments. Data stored about each department includes department number and name.

*entity: dept, attributes: number and name*

In addition to department, DCMH maintains data about people in the hospital and relationships between them. Each person related to the hospital has a unique personID and a record of firstname and lastname.

*entity: person, attributes personID, firstname, lastname*

A person may or may not be further classified as either a staff, a patient, or even as both.  Data stored on a patient includes date of birth. For each staff member one job title is stored.

*"A person may or may not be" means a partial specialization.*

*"further classified" means specialization.*

*"even as both" means overlap.*

*weak entity: patient, attributes: personID, date of birth*

*weak entity: staff, attributes: personID, job title*

Each department is assigned at least one staff member. A department can have more than one staff member assigned to it.  Each staff member must be assigned to a minimum of one department. Any given staff member may be assigned to more than one department.

*"assigned at least one" means one or many.*

*"can have more than one" means one or many.*

*"minimum of one department" means one or many.*

*"assigned to more than one department" means one or many.*

*Taken together, these two relationships mean that there may be many instances of staff connected to a department and many instances of department connected to staff. This may be expressed as a many to many relationship. One of the main purposes for using the tool known as an ER diagram is to identify such relationships and eliminate them. Therefore, the ER diagram will show this relationship, cross it out, and replace it with an associating entity with which each of these entities will have a one to many relationship.*

A staff member may be a manager and, if so, will manage at least one other staff member, but could manage many different staff members. A staff member doesn’t have to have a manager, but if they do, they will have at most one manager. That manager must also be a staff member.

*"manager must also be a staff member" implies a recursive relationship.*

*"manage at least one other staff member, but could manage many" means a one or many crow's foot.*

*"doesn't have to have a manager, but if they do will have at most one" means a zero or one crow's foot.*

*We don't really need an entity for manager, at least not yet, because we have been given no further information to store about them. All we really know is that a relationship exists.*

Each staff member must be classified as exactly one of three types: a support staff member, a nurse or a doctor. A staff member has no more than one of those three classifications. Each support staff member has a wage stored. Each nurse has a certification stored. Each doctor has a DEA number stored.

*"must be classified as exactly one" implies both total and disjoint specialization.*

*"no more than one of those three" means disjoint.*

*weak entity: support, attributes: personID, wage*

*weak entity: nurse, attributes: personID, certification*

*weak entity: doctor, attributes: personID, DEA*

A doctor does not have to mentor another doctor. A doctor can mentor at most one mentee, which is another doctor. A doctor does not have to have a mentor. If a doctor has a mentor, that mentee will have at most one mentor.

*"which is another doctor" implies a recursive relationship*

*"does not have to" implies a zero on a crow's foot.*

*"at most one " implies a one on a crow's foot.*

Each patient of DCMH is assigned precisely one doctor.  A doctor does not have to be assigned to any patients, but can be assigned to many different patients. 

*"assigned precisely one" means an exactly-one crow's foot.*

*"does not have to ... many different" means a zero or many crow's foot.*

\begin{figure}[htbp]
\centering
\includegraphics[height=13cm]{fiHW05Soln.jpg}
\caption{Example Solution}
\end{figure}

Refer to the diagram in the figure called Example Solution to review the following points.

- A partial / total specialization may be thought of vertically or as
  the parent / child relation where the top is the parent and the bottom are children.
- A partial specialization means that the entity can be a parent or
  child, while total means that only the child occurs in nature and the parent simply defines the child.
- Overlap / disjoint relations may be thought of horizontally or as
  siblings, side-by-side who
  can be distinguished (disjoint) or who may not be distinguishable (overlap).
- A tree relationship is not required by databases, just
  relational databases, hierarchical databases, and object-oriented databases. A network database (CODASYL is the main example in practice) does not require the parent child relationship. In other words, the relationships don't strictly descend. They may ascend in a network database. We will not discuss network databases in this class and they are a rarity in any class.
- A unary relationship aka a recursive relationship involves
  only one entity.
- A binary relationship involves two entities and is by
  far the most common that we portray with er diagrams.
- Any unary relationship could be a specialization but we
  have not and will not portray any unary relationships as specializations. We are representing them as instances and they therefore have cardinality and we could say have a many to many unary relationship which we would have to break up using a new associating entity. Here, we don't need to break them up because they are not many to many. We have two kinds. The first is (0 or 1) to (1 or many). That is the manager unary relationship. The other is exactly one to exactly one, the mentor relationship.
- A ternary relationship (or more in this case,
  quarternary) involves three (or four in this case) entities and in our class always, in a specialization relationship.
- Why don't ternary relationships have cardinality?
  It is because they are specialization relationships and are not instances (components) themselves.
- There is no concept of cardinality in a specialization
  relationship and we happen to use ternary and quarternary relationships to portray specialization.

\begin{center}
  \begin{tikzpicture}[xscale=1.7,show background rectangle]
  \tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
    %                          Entities
    \node[entity*] (e00) at (2,4) {
      \entitytitle{Parent}
    };
    \node[entity*] (e01) at (0,0) {
      \entitytitle{Child1}
    };
    \node[entity*] (e02) at (4,0) {
      \entitytitle{Child2}
    };
    %                        Attributes
    \node[chenattr]      (a00) at (2,2)    {disjoint};

    %                        Relationships
    \draw[relat] (e00) --
      node[relattext,above=0.5pt] {total}
    (a00);
    \draw[relat] (a00) -- (e01);
    \draw[relat] (a00) -- (e02);
  \end{tikzpicture}
\end{center}

The picture above shows the notation we'll use for specialization relations, also called IS-A relations. The top line can be labeled either total or partial and the ellipse can be labeled either overlap or disjoint.

## Additional RDBMS Topics

As we move on to discuss other representational forms, it may be helpful to bear in mind that traditional relational database tools have adapted to the environment by adding functionality that contradicts the spirit of RDBMS. For example, consider the following two tutorials as examples of using Postgres, a relational database tool, to do things not typically thought of as appropriate for RDBMS.

[http://www.monkeyandcrow.com/blog/hierarchies_with_postgres](http://www.monkeyandcrow.com/blog/hierarchies_with_postgres)
describes the use of *materialized path* encoding. This is a popular way to encode hierarchical information in a modified relational database tool. The basic idea requires the RDBMS to support arrays of the kind seen in application programming language. Postgres does this with the square bracket notation typical of application programming languages. The materialized path is an array containing all the ancestors of the current record in order. This contradicts the traditional relational database approach to hierarchies where each record would store the id of its parent and multiple queries would be required to obtain an entire hierarchy. This *materialized path* approach also makes use of other non-relational operators. The example in this tutorial, for instance, uses an array-length operator in Postgres to quickly determine the depth of the current record in the hierarchy.

[http://www.monkeyandcrow.com/blog/tagging_with_active_record_and_postgres](http://www.monkeyandcrow.com/blog/tagging_with_active_record_and_postgres)
describes the use of arrays in Postgres and is a prerequisite for the preceding post. The use case here is the storage of tags. For example, the blog post is about Postgres, Rails, and web application development. If the post is stored in a database, it needs tags for these three topics to be stored along with it. The traditional database approach would be to have a tag table and one row for each of these three tags, combined with an identifier for the blog post. The method described in this tutorial is to store any tags in an array associated with the post.

Superficially, both these tutorials depict approaches that look exactly like the use of repeating groups. Why would you ever drop decades of RDBMS wisdom in favor of using repeating groups for any purpose? Both in the tutorials and in the comments to them, various DBAs claim a worthwhile performance gain. There is no doubt that availability or response time are key criteria for web applications. Many of the considerations to be balanced in an enterprise database application don't matter little in a web application. We must keep this in mind as we study other knowledge representation techniques and the circumstances favoring their use.

\begin{sloppypar}
  Finally, here (Figure \ref{fiSQLjoins}) is a visual representation of SQL joins, from C. L. Moffatt, 2009, posted at \url{https://www.codeproject.com/Articles/33052/Visual-Representation-of-SQL-Joins}
\end{sloppypar}

\begin{figure}[htbp]
\centering
\includegraphics[height=8cm]{fiSQLjoins.jpg}
\caption{Venn diagrams of SQL joins}
  \label{fiSQLjoins}
\end{figure}

