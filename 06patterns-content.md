
# Design Patterns

## Introduction
Design patterns can be difficult to understand and use without knowing something of their history and development. Therefore we first review the origin of design patterns in a separate discipline and then discuss their applicability to application development in general.

## Design Pattern Definitions
Notice that the following definitions don't agree with each other. The notion of design patterns means different things to different people. The first definition is the most precise. The last definition is vague.

- A general reusable solution to a commonly occurring
  problem within a given context
- A description (or template) for how to solve
  a problem, it can be used in many different situations
- Patterns are formalized best practices

## Design patterns in architecture
We review the origin of design patterns because it was here that software engineers first read about design patterns and realized that they could be applied to computer programming.

## Design patterns were first observed
Design patterns began as an architectural concept in @Alexander1977.
    Alexander examined architecture from the standpoint of
      its value to a community of people in daily life.
    Alexander's ideas were largely ignored or rejected
      by architects but soon gained a cult following
      among computer scientists.
    Eventually his books became so popular outside
      architecture that they began to influence architecture.

## A Pattern Language
A pattern language is a structured way to describe good design
  practices within a field of expertise.\linebreak
    Christopher Alexander discusses it in a [Youtube video](https://youtu.be/98LdFA-_zfA).
The term was coined by Christopher Alexander and popularized by his book *A Pattern Language*.
    This book was followed by another book intended to
  explain the first book.
    Alexander has continued to try to explain the
      concept to this day.

## Components of a Pattern Language
- The Syntax: a description of where the solution fits into the larger design
- The Grammar: describes how the solution solves the problem
    - “Balconies and porches which are less than 6 feet deep are hardly ever used.”

## An example of a pattern is a place to wait
- Problem: The process of waiting has inherent conflicts
  in it
- Solution: In places where people end up waiting (for
  a bus, for an appointment, for a plane), create
  a situation which makes the waiting positive

## An example of a pattern is a useful cooking layout
- Problem: Cooking is uncomfortable if the kitchen
  counter is too short and also if it is too long
- Solution: To strike the balance between the kitchen
  which is too small, and the kitchen which is  too
  spread out, place the stove, sink, and food storage
  and counter in such a way that:
    1. No two of the four are more than 10 feet apart.
    2. The total length of the counter---excluding sink,
       stove, and refrigerator---is at least 12 feet.
    3. No one section of the counter is less than 4 feet
       long.

## Design patterns spread to software engineering
We review how design patterns spread to software engineering both to help us think about why we might use them and to help to differentiate between the writings on design patterns that you will encounter and have to somehow integrate into your own work.

## Computer scientists popularized design patterns
The Gang of Four (commonly abbreviated GoF) were among
  computer scientists seeking a basis to make
  code less arcane, more scientific and, above
  all, reusable.
One aspect of Alexander's description was so general
  that it seemed applicable to any field in which design 
  plays a role.
This key aspect was the notion of a *quality that
  could not be named* but that could be understood
  through experience---the quality shared by successful
  designs.
Specific, non-obvious combinations of
  characteristics support the quality.

## Gang of Four book
*Design Patterns*, @Gamma1994, exploded on the software
  scene and propelled Alexander to greater fame at the
  same time as solidifying OO 's place in mainstream
  software development.
The GoF argue that great writers use patterns, e.g., all
  of Shakespeare's plays were based on earlier, less
  successful plays or stories.
The GoF refers to *tragically flawed hero* or
  *boy-meets-girl, boy-loses-girl* as patterns with
  infinite variety.
The GoF book serves two purposes, to tell what patterns
  are and to catalog 23 well-known patterns.

## Gang of Four pattern definition
A design pattern is a description of communicating objects and classes customized to solve a general design problem in a particular context. (from the introduction to *Design Patterns*, 1994)

### A pattern has four things
1. Pattern name
2. Problem
3. Solution
4. Consequences

## A pattern name is a tool
The pattern name must be good enough to become part of
  the design vocabulary.
The pattern name must be useful in conversation, documentation, and
  thinking.
The GoF spent a lot of its time on the names of the 23
  patterns in their catalog.

## A problem may be of several kinds
- Basic design problems such as algorithm design
- Commonly occurring classes or object structures known
  to be problematic
- Lists of conditions that, when occurring together,
  create a generic problem

## A solution is a description of objects and classes
- Not a solution in a packaged sense
- Solution is abstract, not implementation-specific
- Description of elements of solution (objects and
  classes)
    - Relationships between elements
    - Responsibilities of elements
    - Collaborations between elements

## A consequence is a result or trade-off
- Application of a pattern may resolve conflicts of
  varied kinds, most often space and time
- Evaluate the design decision with awareness of the
  consequences
- Consequences may have implementation issues, unlike
  the solution
    - if tempted to talk implementation, do
  it under this banner instead of under the solution
  banner
    - keep the solution a description, not an
  evaluation of itself

## Review MVC

![MVC-Process](fiMVCregisFrey.png)

Examine diagram "MVC-Process" by RegisFrey - Own work. Licensed under Public Domain via Wikimedia Commons - [MVC-Process](http://commons.wikimedia.org/wiki/File:MVC-Process.svg#mediaviewer/File:MVC-Process.svg)

- MVC - Model View Controller
- Model - Business layer type object expressed in terms of problem
  domain
- Controller - manipulates the model and therefore the business rules that exist in the model
- View - Representation to user, updated by model, causes user to manipulate controls

## The model, view, controller triad of classes
- MVC, publicly introduced by @Krasner1988, can help you
  define the design pattern concept. Prior to the publication of the concept, it had been in active use in Smalltalk for perhaps twelve years.
- Three kinds of objects
    - Model $\Rightarrow$ application object
    - View $\Rightarrow$ presentation object
    - Controller $\Rightarrow$ reaction to user input object
- MVC establishes a subscribe / notify protocol between views and
  models
- When model data changes, model notifies views depending on it
- When model data changes, relevant views have opportunity to update
  themselves

## MVC and the observer pattern
- GoF provides the following example
    - model is that y contains a=50, b=30, c=20
    - view1 is a table where row y contains cols a, b, and c
    - view2 is a barchart with bars for a, b, and c
    - view3 is a piechart with slices for a, b, and c
- More general idea is that model can update without knowing any
  details of views, pattern is called observer
- Observer: define a one-to-many dependency between objects so that
  when one object changes state, all its dependents are notified and
  updated automatically
    - alternatively subject / observer ; publisher / subscriber

## Is there an observer pattern in the fire alarm example?
- We discussed a student's experience with a design pattern course
- Student worked in fire alarm industry
- Design pattern presented in course seemed to contradict or omit
  practical knowledge
- Looking at the following diagram, think about whether the observer
  pattern is present and, if so, what it tells you about where to put
  the notifications and subscriptions

## Fire alarm system sketch
based on conversation with an industry participant

\begin{center}
\includegraphics[width=3.0in]{fiFireAlarmPatterns.jpg}
\end{center}

## Where patterns have gone
- GoF were interviewed in 2009 about the relevance of their 1994 book
  in 
[15 years later](http://www.informit.com/articles/article.aspx?p=1404056)
    - They deemphasize reusability as a task for *average* developers,
  instead positing reusability as a task for frameworks and toolkits and
  understood rather than implemented by *average* developers
    - They emphasize patterns as targets for refactoring
    - They found it easy to adapt to iOS SDK because of familiar patterns
    - They prefer code smells to anti-patterns because some problems
      must be lived with
    - They claim relevance to Python, Ruby, Smalltalk, but not to
      functional languages

## Notes from GoF refactoring in 2005

Interpreter and Flyweight should be moved into a separate category that we referred to as "Other/Compound" since they really are different beasts than the other patterns. Factory Method would be generalized to Factory.

The categories are: Core, Creational, Peripheral and Other. The intent here is to emphasize the important patterns and to separate them from the less frequently used ones.

The new members are: Null Object, Type Object, Dependency Injection, and Extension Object/Interface---see "Extension Object" in @Martin1997

## More notes from GoF refactoring in 2005

- These were the categories:
    - Core: Composite, Strategy, State, Command, Iterator, Proxy, Template Method, Facade
    - Creational: Factory, Prototype, Builder, Dependency Injection
    - Peripheral: Abstract Factory, Visitor, Decorator, Mediator, Type Object, Null Object, Extension Object
    - Other: Flyweight, Interpreter

## Pattern Language and UI
- Learning tool
- Creates a shared language
- Gallery of design solutions
- Typical pattern formula:
    - Name
    - Problem Summary
    - Usage – context of use
    - Solution
    - Why – rationale
    - Examples of implementation

## UI Patterns
[PatternTap](https://zurb.com/word/design-patterns) provides what it calls examples of UI patterns. It may make sense to question whether these are design patterns in the way that Alexander and the GoF define patterns, or simply a loose, convenient, vague use of the term.

## References
