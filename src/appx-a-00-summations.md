# Summations

When an algorithm contains an iterative control construct such as a
<span class="kw">while</span> or <span class="kw">for</span> loop, we can
express its running time as the sum of the times spent on each execution of the
body of the loop. For example, we found in Section 2.2 that the \\(j\\)th
iteration of insertion sort took time proportional to \\(j\\) in the worst
case. By adding up the time spent on each iteration, we obtained the summation
(or series)
\\[
  \sum^n_{j=2}j.
\\]
When we evaluated this summation, we attained a bound of \\(\Theta(n^2)\\) on
the worst-case running time of the algorithm. This example illustrates why you
should know how to manipulate and bound summations.
