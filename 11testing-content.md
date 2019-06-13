
# Testing

## Testing software

A potentially catastrophic misunderstanding between
generalist managers and software developers often arises
during the testing of software. Developers frequently
complain that managers do not understand the tradeoffs
involved in software testing and that managers expect
testing to be inexpensive and to identify all problems
that will arise in future. Managers, for their part, are
often shocked to find that software has any defects at
all and believe that developers should fix them for free.

## Combinatorial explosion

This misunderstanding arises primarily from the problem
that software is complicated and that testing all
possible combinations of conditions in which software
may find itself would take an infinite amount of time, a
period even longer than it takes to get into an
exclusive nightclub. Therefore, managers and developers
have to work together to identify a small sample of
likely conditions with significant consequences to test.

The following is from the book *Perfect Software* by
Gerald Weinberg. Weinberg has written books on computing
that can help general managers understand the issues
well enough to work with specialists without having to
become specialists themselves. This excerpt is from
Chapter 3 *Why Not Just Test Everything?*

## Notes from the trenches

Gerald Weinberg wrote a book on software testing.
The book collects extensive field experience.
The following is an excerpt from that book.

\noindent BEGIN EXCERPT

*Testing may convincingly demonstrate the presence of
bugs, but can never demonstrate their absence.*

\hfill --- Edsger W. Dijkstra (1974)

$\cdots$

This is a special case of what philosopher John Locke called
*argument from ignorance*, often phrased as *absence of
evidence is not evidence of absence*. Note that this phrase is often abused.
Logicians cringe at its use because there are many cases where absence of evidence is actually evidence of absence. Dijkstra is describing a particular case that meets certain criteria, i.e., that the actual inputs to a program can not be exhaustively tested and that the behavior of a program can not be known with certainty by subjecting it to a fraction of such inputs. Note that the word *inputs* here is even subject to ambiguity. Is a power surge to the hardware running the program an input?

## Summary of Chapter 3 of Weinberg

There are an essentially infinite number of tests that can be performed on a particular product candidate. Rather than asking for "all" tests to be performed, managers and testers must strive to understand the risks added to the testing process by sampling.

## Common Mistakes explored in Chapter 3
Seven common costly mistakes about software testing are explored in depth in the book and summarized briefly here.

## 1. Don't demand the impossible

Don't demand the impossible in the hope of getting best effort.
Demanding "test everything": When you demand the impossible, you have no idea what you'll get—except that it won't be anything impossible.

## 2. Learn to sample or how to work with an expert

Not understanding sampling: Very few managers \(very few people, in fact\) understand sampling very well. Either educate yourself or hire an expert to audit your sampling. In either case, always be ready for the possibility of a sampling error.

## 3. Evaluate info

Spending too much for information that's not worth it: Do you have a basement or garage full of expensive gadgets that you never really wanted? Do you realize what else you could have done with the money spent \(or the space occupied\)? If so, you understand this error. Be careful what you ask for.

## 4. Satisfy the spirit, not the letter, of external requirements

Testing for the sake of appearance: Some customers and certifying agencies demand "testing." You can go through the motions if you feel you must, but at least don't deceive yourself about the quality of the information you receive.

## 5. Know when you're wearing blinders

Not using all sources of information: Information gathered from test results is, by its very nature, limited, but there are other kinds of information sitting around if you're alert enough to see it.

## 6. Develop realistic expectations of machines

Thinking that machines can perform exhaustive testing, even if people can't: It's not just the human brain that's limited; testing tools are limited, too. Don't buy any product that claims it can "perform all tests." Even if it could, you couldn't possibly look at all the results.

## 7. Don't expect cost reduction to be proportional to outcome reduction

Increasing risk by constraining resources: When testing resources are cut, the easiest way to respond is by limiting sample size—running fewer tests. But with a reduced sample size, sampling errors become more likely. A diverse sample might find more problems than a large sample. Likewise, diversifying your test team might find more problems than enlarging your test team.

## Dijkstra on testing

Note: E.W. Dijkstra (1930--2002) was a computing pioneer,
quoted above in
“Programming as a discipline of mathematical nature”,
*Am. Math. Monthly*, __81__ (1974), No. 6, pp.  608--12.

\hfill END EXCERPT

  \begin{tikzpicture}[
      %We set the scale and define some styles
      scale=2.4,
      axis/.style={thin, ->, >=stealth'},
      important line/.style={very thick},
      every node/.style={color=black,}
    ]
    % Important coordinates are defined
    \coordinate (xint) at (0.1,0);
    \coordinate (end) at (3,1.25);
    \begin{scope}
       \draw[very thick] (xint) to[out=86,in=182] node [sloped,above] {} (end);
    \end{scope}
    \node     at (1.4, 0.80)   {\textit{diminishing returns}};
    % axis
    \draw[axis] (-0.2,0)  -- (3.3,0) node(xline)[right] {cost};
    \draw[axis] (0,-0.2) -- (0,1.7) node(yline)[above] {benefit};
  \end{tikzpicture}

\textit{Note: The cost reduction section above does not mention the issue of diminishing returns. The impact of any change in budget is far greater for values at the left side of a diminishing returns curve than at the right.}

## White-box testing

[White-box testing](http://en.wikipedia.org/wiki/White-box_testing)
refers to testing the internal structure of a program, examining it as if it were transparent. An example might be to search through source code for the arithmetic operation of division and to then identify what will happen if a zero denominator is supplied or under what circumstances a zero denominator might be supplied.

The above-mentioned article lists nearly a dozen criteria for testing, some of which are routinely tested by compilers. For example, many compilers will report whether any functions have been prototyped but never defined or defined but never called or whether any identifiers have been defined but never assigned values. Other criteria may be more or less satisfied by any given testing tool, such as whether every statement has been executed, whether every branch has been followed, whether every boolean expression has been tested both as true and as false.

White-box testing is an important historical term and can be helpful to think about in the course of planning tests. On the other hand, contemporary testing tools don't make a white-black or transparent-opaque distinction and typically offer combinations of the two ideas.

## Black-box testing
[Black-box testing](http://en.wikipedia.org/wiki/Black-box_testing) refers to testing the functionality of a program without any more access to the program than an end user would have. The program is regarded as opaque, or a black-box, whose inner workings are not known but which can be characterized completely by its inputs and outputs.

## Constraints on coding


[One Big Fluke](http://www.onebigfluke.com/2014/11/you-only-get-1000-lines-of-code-week.html) suggested adding constraints like: assume you can only write a certain number of lines of code to focus your effort on the most important work. In other words, if you really want to spend your time wisely, pick an easily defined metric like 1,000 lines of code to translate the vague "spend your time wisely" into a concrete plan.

A commenter on the blog responded:
"Adding constraints is one of the best ways to achieve good design but it requires something magical, good sense. If you don't have good sense then you won't know which constraints to add to make your work better. Chuck Moore uses simplicity, Alan Kay I think likes expressivity per line of code, Matz likes happiness, Gilad Bracha likes first-class values for all abstractions in a language, etc. The problem is that these people came to those conclusions after grappling with terribly designed computing systems and like all other lessons in life it doesn't really stick until you re-discover it on your own. The other problem is that companies like Facebook, Google, Amazon, eBay, etc. have so many programmers that it is impossible for all of them to do useful work so most of them are bound to do useless work."

## Validation testing

[Non-regression testing](http://en.wikipedia.org/wiki/Non-regression_testing) seeks to validate or verify whether a given unit of software development achieves an intended outcome. Validation testing should include machine-readable output or machine-readable results. These should be automatically comparable to ideal or reference results. For example, NIST promotes a configuration standard that supports writing output of security tests in an XML format that other software can use to automatically ascertain the security configuration of remote software (Mick heard this in a talk by Matthew Scholl, acting head of NIST Cybersecurity, on 19 Nov 2014).

## Acceptance testing

[Acceptance testing](http://en.wikipedia.org/wiki/Acceptance_testing) refers to the acceptance of a system by a client. This is one environment in which black-box testing may occur since an end user may not have access to system internal features.

[Microsoft Patterns and Practices](http://testingguidance.codeplex.com/) provides a thorough guide to acceptance testing. This guide divides the subject into various parts and subparts. The first part describes six ways of thinking about acceptance testing. The titles of the six ways are suggestive, so I'm quoting them here:
doneness model (measurement methods),
risk model (probability and consequences of problems),
de\-cision-making model (perhaps it would better named as the responsibility model),
concern resolution model (procedure established in advance of use),
system requirements model (identification of functional and non-functional reqs),
and
project context model (time and resource constraints).

The above guide provides a lengthy contrast between acceptance testing in an information technology department of an enterprise and a software product development enterprise. The division between functional acceptance testing and operational acceptance testing is addressed for about two-thirds of the total text.

## Unit testing

[Unit testing](http://en.wikipedia.org/wiki/Unit_testing) is described by Wikipedia as referring to the smallest possible unit of source code that can be tested. Unit tests are described as short code fragments exercised during development. Prescriptive advice in the above article is to ensure that unit tests are mutually independent. Further advice is to organize the tests so they help to document the development process. Finally, unit testing should be organized to support later refactoring and testing of refactored software. As a reminder, [refactoring](http://en.wikipedia.org/wiki/Code_refactoring) is the practice of altering source code without changing its external behavior.

## Functional testing

[Wikipedia on functional testing](http://en.wikipedia.org/wiki/Functional_testing) describes testing focused on the inputs and outputs of a system, without regard to the internal structure of the system. This is a more contemporary umbrella for black box testing focused on lists of intended inputs and expected outputs conforming to specifications or requirements documents.

## Regression testing

[Wikipedia](http://en.wikipedia.org/wiki/Regression_testing) defines regression testing as testing software after changes have been made, and uses the word regression synonymously with bug. The central concept is to ensure that new development on existing software does not introduce new faults.

[MSDN](http://msdn.microsoft.com/en-us/library/aa292167(v=vs.71).aspx) 
warns that the most difficult aspect of regression testing is deciding what test cases to include. The advice at the above URL is avoid wasting time choosing test cases and simply err on the side of caution in choosing test cases. Further advice is to be sure to test timing and boundary conditions and to be sure to include automated tests, building a library of reusable tests and carefully testing fixes when regression testing uncovers faults.

## Cost of writing test code

[Spolsky on 12 Steps to Better Code](http://www.joelonsoftware.com/articles/fog0000000043.html)
compares costs relentlessly, including a comparison of the costs of toilet paper to wasted disk space (guess which cost more). Unfortunately, some of the most prevalent advice amounts to justifying early testing or, worse, justifying testing. Once we say that, Duh, we agree it's important, we would like to move on to managing the process of writing test code so we spend enough and not too much. Quite a bit of available advice zooms in on the likelihood that *enough* will never be available.

[David of Basecamp](https://signalvnoise.com/posts/3159-testing-like-the-tsa) provides an alternative (and easily read, humorous view---even if you don't know who he is you can guess that he's influential) and quotes Kent Beck as saying
*I get paid for code that works, not for tests, so my philosophy is to test as little as possible to reach a given level of confidence (I suspect this level of confidence is high compared to industry standards, but that could just be hubris). If I don’t typically make a kind of mistake (like setting the wrong variables in a constructor), I don’t test for it.* This is useful advice for a student because it can help you build your own test approach, suited to your own growth and status.

## tcpdump

To provide colorized output from tcpdump, say, e.g.,
`tcpdump -l -i en2 | colorize`
where `colorize` is a perl script in /usr/local/bin. The
`-l` option to `tcpdump` allows line buffering, so that
the next process sees each line as it is emitted to
`stdout`. Usually not used for colorizing but for
monitoring while dumping to a file.

```
sudo tcpdump -i en0 -n "host 50.62.176.213"
```

## Observation

"You can observe a lot by watching," said Yogi Berra and observation can help you to decide how to best spend your limited testing dollars. I often think of the recent media attention given to
[Yuri Totrov](https://www.youtube.com/watch?v=DB2tN79Q9t4),
who caused many deaths of Americans during the Cold War and whose success in identifying American agents ended many careers of Americans wrongly suspected as moles. A recent book and *Vanity Fair* article point out that he developed a method of examining publicly available evidence to discover spies. Is a US government employee using phone booths during working hours? Is a US government employee sitting alone in cafes a lot? Visiting parks alone much? Avoiding the use of US government automobiles? Are there public announcements of new personnel who seem to serve different nonessential functions in various embassies all over the world? It supposedly took Totrov ten years to piece together a more-or-less foolproof spy identification system based entirely on observation. He was able to use that system for over a decade longer to kill and to cast career-ending suspicion on many innocents.

By the way, it was common for US spymasters to assume that the Soviets suffered from inferior intellect because the Soviets suffered from inferior technology. (Does this remind you of how technologists think about managers?) Therefore, they never once suspected that Totrov's system relied on thinking about publicly observed information. Thinking about what is observed may provide the ultimate test guidelines---if you are prepared to think.
