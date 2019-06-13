
# Data Input

## Background on dirty data

Start by thinking about dirty data at a low level and taking a utilitarian view of it. We'll do that first under the heading dirty data. Next, think about the design of the business layer and how it can act as, among other things, a way to keep dirty data out of the data layer and therefore out of the database.

## Define dirty data
Dirty data is inaccurate, incomplete or erroneous data, especially in a computer system or database. 

In reference to databases, this is data that contain errors. Unclean data can contain such mistakes as
(1) spelling or punctuation errors,
    (2) incorrect data associated with a field,
    (3) incomplete or outdated data,
    (4) or even data that has been duplicated in the database.

## Reasons for dirty data
Dirty reads, described in the section on single- and multi-user databases as the result of
  commit or rollback problems, occur either due to policy
  tradeoffs or incomplete error handling.

Maintenance programmers fear to alter someone else's actions, even if those actions appear to be wrong. This is the flip side of the rule that *it is easier to write than to read*. There are two outcomes from that rule. One extreme is to completely rewrite and destroy poorly understood business logic. The fear issue leads to the other extreme: complete preservation of mystifying code.

Piecemeal development of systems over long time periods is the norm throughout many industries. Each developer has only time to look at a small piece of a system and uses the fashionable practices of that year.

Inadequate documentation occurs because it is not easy to evaluate the contribution of documentation. Hence, it is not rewarded. Only in systems where the value of documentation is specified in detail, such as by a regulatory agency, will sufficient documentation exist.

Staff turnover leads to organizational memory loss. Incentives often exist to prohibit knowledge transfer, especially where knowledge is to be transferred from a more highly paid person to one receiving lesser pay.

There will always be dirty data until there is more than enough time and money. Do not expect to ever have sufficient time or money to solve the problem, simply learn to do what is possible, especially at the point closest to the source.

## How dirty data gets into the database

*You may as well ask how data gets in: You let it in!*

\begin{center}
\includegraphics[height=3.2cm]{fiExploitsOfaMom.png}
\end{center}
[Exploits of a Mom](http://xkcd.com/327/) is the source for this cartoon. Its hover text is *Her daughter is named Help I'm trapped in a driver's
license factory*.

\begin{center}
\includegraphics[width=10cm]{fiFixingaTicket.jpg}
\end{center}
Thanks to the eagle-eyed students who showed me how to beat the traffic camera. The above method should work until the DOT programmers start reading XKCD.

## Character encoding is a source of dirty data
[Unicode](http://www.joelonsoftware.com/articles/Unicode.html)
hosts Joel On Software's post, *The absolute minimum every
  software developer absolutely, positively must know
  about Unicode and character sets*.

## Another kind of dirty data
Previously I said that data contains errors. That may be a matter of perspective.
Data being transferred between systems
may be defined differently in each system.
Data is often transferred from ad-hoc workgroup systems to more formal systems.
An ad-hoc workgroup system needs a less specific definition than does a more formal enterprise system.
Workgroup systems in general need fewer definitions than do enterprise systems.

## Utilities exist to help with low-level tasks
The `file` utility checks files using filesystem tests, magic number tests and language tests. This is a very crude method that primarily reveals non-adversarial issues. The reason is that `file` does not assume any adversarial conduct. It simply does three things. First, it checks the output of a `stat` system call to see if the file in question is empty or has been created as a special file, a socket, symbolic link, FIFO, or whatever is locally defined. Second, it examines magic numbers stored near the beginning of the file as standard signals placed by cooperating systems. Third, it checks for ranges and sequences of bytes typical to known file encodings, such as ASCII, Unicode, or others.

The `recode` utility converts between different character sets.

Scripting with regexes in perl, python, sed, awk, php, or similar such languages or shells can perform conversions relevant to common low-level problems. For example, I often use a sequence of shell utilities like

```bash
cut -f 2 bla | sort | uniq -c
```
\noindent
to remove column 2 from file `bla`, sort it, then count the number of repeated records. This extremely simple method often catches plenty of errors in structured files.

For unstructured files, I often use a script like the following to count and sort words.
```Perl
#!/usr/bin/env perl
# word frequency count
while(<>) {                       # Iterate over lines
                                  # from stdin.
  tr/A-Za-z/ /cs;                 # Remove punctuation
  foreach $word (split(' ', lc $_)) {
                                  # lc is lowercase.
    $freq{$word}++;               # Increment
                                  # frequency count
  }                               # for word.
}
foreach $word (sort keys %freq) { # Sort words found.
  print "$freq{$word}\t$word\n";  # Print word with
                                  # its frequency.
}
```

The above script is a crude tool for unstructured files. KWIC, standing for Key Word In Context, is a genre of slightly more sophisticated such tools. These typically produce three columns of output from an unstructured file. The middle column is a sorted list of all words in the file. The first and third columns represent context around the middle term.

Haskell is language that lends itself to parsing files and a philosophy / linguistics professor has used it to write an increasingly popular utility, `pandoc` taking a non-regex approach to parsing unstructured files of various forms.

The most sophisticated tool I have ever used is the file profiling tool (digitial record object identification or DROID) from National Archives of the UK. Tragically, they selected the name DROID back in the mid nineteen nineties for this project and have suffered search engine obscurity in the new millenium. Nevertheless, DROID is a remarkable tool for identifying a remarkable range of file formats, many of them from media no longer in common use. They received enormous publicity when it was discovered that a thousand year old time capsule in the UK contained material that could be easily read but a time capsule from a few years before contained material on a laser disk for which no reader still existed in the UK! The ensuing crisis led the widespread overuse of the word *curate* in many forms and numerous disjointed efforts to preserve digital materials and make them accessible. I (Mick) was personally asked by NASA to help them read some unreadable files in the nineties (and no, I could not read them either) and as a result became interested in this situation.

Near RIT, there is a scholar in Syracuse, Elizabeth Liddy, who has worked with Con Edison, a company that has process and equipment records it can not read. Some of its materials were 175 years old when Liddy studied the situation. Guess which files were easier to read, the ones in Thomas Edison's secretary's handwriting or the ones on tapes and disks from the past few decades.

I've placed a file called `ungarbling.pdf` into our Resources repository. That example recounts an effort to ungarble data from a MySQL database where Unicode translation is the issue and understanding the issued allows a quick Python scripting fix. Close examination of this report should convince you that understanding the problem was the difficult step.

## Extract, transform, load
ETL is the typical data warehousing framework for, among other things, cleaning incoming data.
It functions as a place to put non-security defenses against dirty data.
[ETL](http://en.wikipedia.org/wiki/Extract,_transform,_load) at Wikipedia represents a good resource on it. The reason we won't say more about it here is that a curriculum decision seems to place it in the data warehousing course. This course is meant to cover more of the cracks in between formal solutions. Your projects should have informal data cleaning methods and your future workplaces will like need both the formal and informal methods.
