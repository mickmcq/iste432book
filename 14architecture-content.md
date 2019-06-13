
<!--
[font=Myriad Web Pro 300px]
[text-color=#B0FFFF]
[shading-color=#111122]
[stage-color=#111122]
[#111122]
-- [text-color=orange]
architecture

 --
an unfortunate term
# I say this because architects
#  design buildings not software
# It is pretentious to use
#  the term architecture
#  with respect to software.

 --
should be "design"
but why fight it?
# Not only do people use
#  the pretentious term,
#  they even use architect
#  as a verb!

-->

# Architecture

<!--
 --
seven ways to think
about architecture
# This is according to
#  Taylor et al.
# Goals, scope, concerns,
#  models, type, automation
#  level, stakeholders.
# Let's look at each in turn.

-->

@Taylor2008 analyze architecture by dividing it into the following parts.

- Goals
- Scope 
- Concerns (Structural, Behavioral, Interaction, Non-Func\-tional)
- Models (Informal, Semi-formal, Formal)
- Type (Static, Dynamic, Scenario-based)
- Automation Level (Manual, Partially Automated, Automated)
- Stakeholders

<!--
-- [text-color=pink]
1.


Goals
# Taylor et al. ask you to remember
#  the four Cs of goals

 --
goal
Completeness

 --
goal
Consistency
# Meaning that elements
#  do not contradict
#  each other

 --
goal
Compatibility

 --
goal
Correctness

 --
goals need to be measurable

-->

## Goals
Success of any project is measured using goals and finding ways to determine how and to what extent they have been met. @Taylor2008 posit the following goals as the four Cs.

- Completeness
- Consistency (elements do not contradict each other)
- Compatibility
- Correctness

How may each of these be measured? What do they mean?

<!--
-- [text-color=pink]
2.


Scope
# What is it?

 --
whatever is important

 --
whatever is hard to change

 --
decisions and their rationale

 --
what is fundamental to
understanding software
in its environment
# That's scope

-->

## Scope
Wikipedia offers a good survey on scope definitions, roughly including
(among others)

- whatever is important
- whatever is hard to change
- whatever decisions are made and their rationale
- whatever is fundamental to understanding the software\linebreak structure in its environment

<!--
-- [text-color=pink]
3.


Concerns
# There are four kinds of concerns:
#  non-functional,
#  interaction,
#  behavioral, and
#  structural

 --
non-functional concern:
efficiency

 --
non-functional concern:
complexity

 --
non-functional concern:
scalability

 --
non-functional concern:
adaptability

 --
non-functional concern:
dependability

 --
interaction concern:
connections within system

 --
interaction concern:
connections to external
elements

 --
interaction concern:
coordination of elements

 --
interaction concern:
mediation of conflicts

 --
behavioral concern:
flow of control

 --
behavioral concern:
flow of data

 --
behavioral concern:
functionality

 --
behavioral concern:
processing

 --
structural concern:
inheritance

 --
structural concern:
part-whole relationships

 --
structural concern:
adherence to paradigms

 --
structural concern:
adherence to design patterns

-->

## Concerns

Non-functional concerns include efficiency, complexity, scalability, adaptability, and dependability.

Interaction concerns include interconnection within the system, communication with external elements, coordination of elements, and mediation of conflicts.

Behavioral concerns are functionality or processing concerns. This can include the flow of control as well as the flow of data.

Structural concerns occur at a possibly more abstract level, incorporating the other concerns. Structural concerns may include inheritance, part-whole relationships, and adherence to paradigms or design patterns.

<!--
-- [text-color=pink]
4.


Models

 --
models
simplify reality

 --
models
ignore unimportant aspects

 --
models
can be highly formal

 --
formal models
are very expensive

-- [text-color=pink]
5.


Type

 --
like data typing
can be static or dynamic

 --
or type can be scenario-based

-- [text-color=pink]
6.


Automation

 --
ranges from fully manual
to fully automated

-- [text-color=pink]
7.


Stakeholders

 --
stakeholder:
architects

 --
stakeholder:
developers

 --
stakeholder:
managers

 --
stakeholder:
customers

 --
stakeholder:
vendors

-->

## Stakeholders
The easiest and first way to analyze architecture is to think about the stakeholders in architecture. These may include the following groups.

- Architects
- Developers
- Managers
- Customers
- Vendors

<!--
-- [text-color=orange]
ATAM

 --
architecture
tradeoff
analysis
method

 --
sophisticated approach
to software architecture

 --
heavily regulated by SEI

 --
one artifact of ATAM
is the utility tree

-- [fiUtilityTree.jpg]
# The items in blue (*X*,*Y*) are added
#   after the tree is developed according to
#   a complex, heavily documented process.
#   They stand for different things in
#   scenarios but in this one they are *X*:
#   business priority, importance to the
#   business outcome, and *Y*: technical
#   priority, the technical difficulty or
#   risk involved in doing them.

 --
used to identify
business priorities,
technical priorities

-->

## From Architecture selection

The figure shows the utility tree from ATAM, the Architecture Tradeoff Analysis Method, developed by the Software Engineering Institute at Carnegie Mellon for the United States Department of Defense. The items in blue (*X*,*Y*) are added after the tree is developed according to a complex, heavily documented process. They stand for different things in scenarios but in this one they are *X*: business priority, importance to the business outcome, and *Y*: technical priority, the technical difficulty or risk involved in doing them.

\begin{center}
\includegraphics[width=10cm]{fiUtilityTree.png}
\end{center}

## Paradigms in Software Architecture

<!--
-- [text-color=orange]
paradigms

 --
typically not found
in pure state
usually in hybrids

 --
object-oriented

 --
component-based

 --
agent-oriented

 --
service-oriented

-->

@Amirat2014 distinguish four paradigms in software architecture: object-oriented, component-based, agent-oriented, and service-oriented. Elements of these four paradigms are typically combined in hybrid approaches in the field rather than as pure expressions of the four paradigms. The following paragraphs summarize their descriptions.

<!--
-- [text-color=pink]
object-oriented

 --
best known paradigm

-->

The object-oriented paradigm established the principles of object encapsulation, inheritance, messages, typing, and polymorphism. The object-oriented paradigm was the first software engineering paradigm with widespread acceptance. It forms a reference model for all later paradigms.

<!--
-- [text-color=pink]
component-based

 --
simple components
in pipelines

 --
independently developed
components

 --
well-understood simple
components

 --
reliable, visible
components

-->

The component-based paradigm arose as a response to the lack of reuse in object-oriented practice. This approach stresses the use of simple components connected together in pipelines to perform large tasks. The independently developed, well-under\-stood simple components are exposed and their reliability is enhanced by their ubiquity.

<!--
-- [text-color=pink]
agent-oriented

 --
components cooperate

 --
components coordinate

 --
components negotiate

 --
autonomous components

 --
interact at a high level

 --
rules and goals are
explicitly defined

 --
agent encapsulates code,
state, invocation initiative

-->

The agent-oriented paradigm is distinguished by software components able to cooperate, coordinate, and negotiate with each other. Autonomy and high-level interactions mark this paradigm as distinct from the others. An agent encapsulates code, state, and invocation initiative. An agent obeys explicitly defined rules in the service of explicitly defined goals.

<!--
-- [text-color=pink]
service-oriented

 --
typical in web commerce

 --
volatile, heterogeneous
environments

 --
goal is productivity and
responsiveness of a
service supplier

 --
exposes APIs to services

 --
services are coarse-grained
compared to components

 --
services
operate on varied data

 --
services
encapsulate dissimilar
functions

 --
services
can offer different interfaces

 --
services
have APIs allowing customer
to understand what they do,
what it costs

 --
services signal their
non-functional properties

 --
services
are discoverable

 --
services
are single instances,
singleton design patterns

 --
END
-->

The service-oriented paradigm emerges from the need to withstand volatile, heterogeneous environments. This paradigm emphasizes productivity and responsiveness of a service supplier by exposing APIs to services, with exactly one instance of a service available. A service has the following characteristics. A service is coarse-grained in comparison with component-based software, operating on more varied data and encapsulating conglomerated (possibly dissimilar) functions. A service has the flexibility to offer different interfaces and to offer interfaces in common with other services. A service is described by an API enabling a customer to understand what it does and how and at what price and with what non-functional properties. A service is discoverable. A service is a single instance, corresponding to the singleton design pattern.
