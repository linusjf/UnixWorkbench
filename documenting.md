Any plain text documentation or mark-up can be used this way, either interspersed
throughout the code or better yet collected at the end of the script. Since computer
systems that have bash will probably also have Perl, its Plain Old Documentation
(POD) may be a good choice. Perl usually comes with pod2* programs to convert
POD to HTML, LaTeX, man, text, and usage files.
Damian Conway’s Perl Best Practices (O’Reilly) has some excellent library module
and application documentation templates that could be easily translated into any
documentation format including plain text. In that book, see CODE/ch07/Ch07.001_
Best_Ex7.1 and 7.2 in the examples tarball (http://examples.oreilly.com/perlbp/PBP_
code.tar.gz).
If you keep all of your embedded documentation at the very bottom of the script,
you could also add an exit 0 right before the documentation begins. That will sim-
ply exit the script rather than force the shell to parse each line looking for the end of
the here-document, so it will be a little faster. Thought, you need to be careful not to
do that if you intersperse code and embedded documentation in the body of the
script.
See Also
• http://examples.oreilly.com/perlbp/PBP_code.tar.gz
• “Embedding manpages in Shell Scripts with kshdoc” at http://www.unixlabplus.
com/unix-prog/kshdoc/kshdoc.html

5.3 Promoting Script Readability
Problem
You’d like to make your script as readable as possible for ease of understanding and
future maintenance.
Solution
• Document your script as noted in Recipe 5.1, “Documenting Your Script” and
Recipe 5.2, “Embedding Documentation in Shell Scripts”
• Indent and use vertical whitespace wisely
• Use meaningful variable names
• Use functions, and give them meaningful names
• Break lines at meaningful places at less than 76 characters or so
• Put the most meaningful bits to the left
Discussion
Document your intent, not the trivial details of the code. If you follow the rest of the
points, the code should be pretty clear. Write reminders, provide sample data lay-
outs or headers, and make a note of all the details that are in your head now, as you
write the code. But document the code itself too if it is subtle or obscure.
We recommend indenting using four spaces per level, with no tabs and especially no
mixed tabs. There are many reasons for this, though it often is a matter of personal
preference or company standards. After all, four spaces is always four spaces, no
matter how your editor (excepting proportional fonts) or printer is set. Four spaces is
big enough to be easily visible as you glance across the script but small enough that
you can have several levels of indenting without running the lines off the right side of
your screen or printed page. We also suggest indenting continued lines with two
additional spaces, or as needed, to make the code the most clear.
Use vertical white space, with separators if you like them, to create blocks of similar
code. Of course you’ll do that with functions as well.
Use meaningful names for variables and functions, and spell them out. The only time
$i or $x is ever acceptable is in a for loop. You may think that short, cryptic names
are saving you time and typing now, but we guarantee that you will lose that time
10- or 100-fold somewhere down the line when you have to fix or modify that script.
Break long lines at around 76 characters. Yes, we know that most of the screens (or
rather terminal programs) can do a lot more than that. But 80 character paper and
screens are still the default, and it never hurts to have some white space to the right
of the code. Constantly having to scroll to the right or having lines wrap on the
screen or printout is annoying and distracting. Don’t cause it.

Unfortunately, there are sometimes exceptions to the long line rule. When creating
lines to pass elsewhere, perhaps via Secure Shell (SSH), and in certain other cases,
breaking up the line can cause many more code headaches than it solves. But in most
cases, it makes sense.
Try to put the most meaningful bits to the left when you break a line because we
read shell code left-to-right, so the unusual fact of a continued line will stand out
more. It’s also easier to scan down the left edge of the code for continued lines,
should you need to find them. Which is more clear?
# Good
[ $results ] \
 && echo "Got a good result in $results" \
 || echo 'Got an empty result, something is wrong'
# Also good
[ $results ] && echo "Got a good result in $results" \
 || echo 'Got an empty result, something is wrong'
# OK, but not ideal
[ $results ] && echo "Got a good result in $results" \
 || echo 'Got an empty result, something is wrong'
# Bad
[ $results ] && echo "Got a good result in $results" || echo 'Got an empty result,
something is wrong'
# Bad
[ $results ] && \
 echo "Got a good result in $results" || \
 echo 'Got an empty result, something is wrong'
See Also
• Recipe 5.1, “Documenting Your Script”
• Recipe 5.2, “Embedding Documentation in Shell Scripts”
