
# Exception handling

Exception handling fits well with our layered application emphasis and database-oriented project focus.

"Exception handling in a layered architecture" is something you can make a section of your document and demonstrate in all your projects. I have vacillated over whether it should be a separate section in your design document. What do you think of the choice between having an exception handling section as opposed to including exception handling in the description of each layer? Is your thinking affected by locus of responsibility? A frequent mistake students make is to insist that their current project members will be responsible for all aspects of the application. Typically, applications with any value to other people will be passed on to the responsibility of others---others whose expertise may not be packaged as that of your team members. Assumptions you make about the future are often disproved by practice. If you say that anyone who takes over the application will know *x*, *y*, and *z*, I can promise you that there is at least an even money chance that at least one of the three will have to be farmed out. There is at least a one-in-three chance that one of the three forms of expertise will become obsolete during the life of the application.

If your project is really so simple that one person will always handle all aspects, it may not appropriate for this course and you may need to revise it or face the likelihood that a high grade for the course is not available for a team that accomplishes a trivial result well.

Consider your design document so far, both from the standpoint of what is supposed to be in them already (distinguishing domain and application), as well as the layering of them in general. Layered architecture should dictate exception handling at the data layer.

Exceptions should be passed up the layers and handled before the user sees them. An adversary may try to provoke exceptions in the hope of seeing underlying aspects of a system. We want to avoid that. We also want to handle things where they "should" be handled, even if our project is so small that one or two people can understand the whole thing.

A complete exception handling treatment needs several things.

- test data
- test tool / harness / suite / protocol
- above could be called test data + some specific way to use
  it
- Style guide for input
- Style guide for what you return
- Picture of the layers that gives details about
  responsibilities of each layer
- You have to make a choice about passing or handling at
  each layer and make it clear what that choice is
- The point of the foregoing is that most layers are the
  responsibility of different developers or, at best, the
  same developer in two different project phases, during the
  second of which the details of the first will be forgotten
  so it may as well have been a different developer
- In larger organizations, may have many developers per
  layer
- Hence, it makes sense in your project to behave as if it
  were larger and to specify a bunch of stuff that you don't
  strictly need to do to meet your in-class deadline

## Mistakes happen
Wikipedia reports the unfortunate fate of *Ariane 5*, an expensive satellite-launching rocket of the European Community. It only flew for 37 seconds before exploding, scattering 370 million USD to the wind. It turned out that, of seven critical variables, four were protected by exception handling. The rocket was brought down by an unhandled exception in the conversion of a 64 bit floating point number to a 16 bit int.

## Exceptions as flow control
Wikipedia reports on exception handling in programming languages, dividing languages into two groups, those using exception handling as flow control structures, and others. The use of exception handling as a flow control structure leads to hidden control-flow paths. Some sources quoted by Wikipedia claim that these lead to software defects in languages reliant on these structures, such as Java and Python. Further, Java libraries treat error reporting inconsistently, not always via exceptions, compounding the problem.

The try-catch-finally structure used in Java and elsewhere permits many corner cases. A corner case exists when multiple rare conditions may occur at once. This is enabled in try-catch-finally because the Java language definition of that construct is a four level nested if structure. That means that we need to be cognizant of any combination of the four constituent conditions.

Checked exceptions add an exception to a method signature, making it harder to ignore. Anders Hejlsberg stated in an interview that he avoided checked exceptions in the design of C# specifically because they are resented by Java programmers in enterprise-sized systems. Some developers merely decorate every method with `throws Exception`.

It is hard to write meaningful exception handling because it is hard to know what to expect. For example, how many ways may a given protocol be violated? One solution is to use automated exception handling but this is more prevalent in research than in practice. Although there are automated exception handling tools, they receive scant attention in the usual media outlets for software development.


## Exceptions in JavaScript

The following summarizes much of the discussion of `throw` and `try` / `catch` / `finally` in @Flanagan2011.

An exception is a signal of an error or exceptional condition.

The `throw` statement is the JavaScript mechanism for sending this signal.

The throw statement has the syntax `throw` *expression*; where *expression* may evaluate to any type of value. For example, a number may represent an error code or a string may be a readable error message.

A JavaScript interpreter may throw and, when it does so, it throws an object of the Error class.

Each Error class object has a `name` property specifying the error type and a `message` property holding a string.

A JavaScript interpreter stops normal program execution immediately when it encounters a `throw` statement and jumps to the nearest exception handler.

If there is no exception handler in the enclosing block of the `throw` statement, the interpreter checks the next highest enclosing block until a handler is found or the call stack is exhausted. In the latter case, the error is reported to the program user.

JavaScript's exception handling mechanism is the `try` / `catch` / `finally` statement.

The `try` clause defines the block of code whose exceptions are to be handled.

The `catch` and `finally` clauses optionally follow the `try` clause but at least one of them must appear.

All three of these clauses must begin and end with curly braces, even if they each only have a single statement.

The `catch` keyword is followed by an identifier in parentheses. For example, you might say `catch (err) {...}`. The identifer behaves like a function parameter but differs from ordinary JavaScript variables in a way. It takes on the value of the `throw` *expression*, such as an Error object. It has block scope within the `catch` block and is not visible outside the `catch` block. This differs from ordinary JavaScript variables in that they are visible throughout the function in which they are defined or globally if defined outside of any function.

The `finally` clause, if it exists, is guaranteed to be executed if any portion of the `try` block is executed. There are four possible cases.

(1) If the entire `try` block is executed, then the `finally` block is executed.

(2) If a `try` block is interrupted by `return`, `continue`, or `break`, the `finally` block is executed before the jump caused by one of those three statements.

(3) If an exception occurs in the `try` block and there is a `catch`, the `catch` is executed, followed by the `finally`.

(4) If an exception occurs in the `try` block and there is no local `catch`, the `finally` is executed and then the interpreter begins ascending through the call stack, looking for the nearest `catch`.

If a `finally` clause is interrupted by a jump of any kind, that jump replaces any jump previously planned. In other words, if the `finally` clause is entered preparatory to a jump, that jump is canceled by any jump occurring in the `finally` clause.
