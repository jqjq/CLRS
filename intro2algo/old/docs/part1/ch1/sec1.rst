.. _ch1-1:

Algorithms
==========

Informally, an **algorithm** is any well-defined computational procedure that
takes some value, or set of values, as **input** and produces some value, or
set of values, as **output**. An algorithm is thus a sequence of computational
steps that transform the input into the output.

We can also view an algorithm as a tool for solving a well-specified
**computational problem**. The statement of the problem specifies in general
terms the desired input/output relationship. The algorithm describes a specific
computational procedure for achieving that input/output relationship.

.. compound::

    For example, we might need to sort a sequence of numbers into nondecreasing
    order. This problem arises frequently in practice and provides fertile
    ground for introducing many standard design techniques and analysis tools.
    Here is how we formally define the **sorting problem**:

    Input:
        A sequence of :math:`n` numbers
        :math:`\langle a_1,a_2,\dots,a_n\rangle`.

    Output:
        A permutation (reordering) :math:`\langle a'_1,a'_2,\dots,a'_n\rangle`
        of the input sequence such that :math:`a'_1\le a'_2\le\cdots\le a'_n`.

    For example, given the input sequence
    :math:`\langle31,41,59,26,41,58\rangle`, a sorting algorithm returns as
    output the sequence :math:`\langle26,31,41,41,58,59\rangle`. Such an input
    sequence is called an **instance** of the sorting problem. In general, an
    **instance of a problem** consists of the input (satisfying whatever
    constraints are imposed in the problem statement) needed to compute a
    solution to the problem.

Because many programs use it as an intermediate step, sorting is a fundamental
operation in computer science. As a result, we have a large number of good
sorting algorithms at our disposal. Which algorithm is best for a given
application depends on—among other factors—the number of items to be sorted,
the extent to which the items are already somewhat sorted, possible
restrictions on the item values, the architecture of the computer, and the kind
of storage devices to be used: main memory, disks, or even tapes.

An algorithm is said to be **correct** if, for every input instance, it halts
with the correct output. We say that a correct algorithm **solves** the given
computational problem. An incorrect algorithm might not halt at all on some
input instances, or it might halt with an incorrect answer. Contrary to what
you might expect, incorrect algorithms can sometimes be useful, if we can
control their error rate. We shall see an example of an algorithm with a
controllable error rate in :ref:`Chapter 31 <ch31>` when we study algorithms
for finding large prime numbers. Ordinarily, however, we shall be concerned
only with correct algorithms.

An algorithm can be specified in English, as a computer program, or even as a
hardware design. The only requirement is that the specification must provide a
precise description of the computational procedure to be followed.


.. _ch1-1-1:

What kinds of problems are solved by algorithms?
------------------------------------------------

Sorting is by no means the only computational problem for which algorithms have
been developed. (You probably suspected as much when you saw the size of this
book.) Practical applications of algorithms are ubiquitous and include the 
following examples:

* The Human Genome Project has made great progress toward the goals of
  identifying all the 100,000 genes in human DNA, determining the sequences of
  the 3 billion chemical base pairs that make up human DNA, storing this
  information in databases, and developing tools for data analysis. Each of
  these steps requires sophisticated algorithms. Although the solutions to the
  various problems involved are beyond the scope of this book, many methods to
  solve these biological problems use ideas from several of the chapters in
  this book, thereby enabling scientists to accomplish tasks while using
  resources efficiently. The savings are in time, both human and machine, and
  in money, as more information can be extracted from laboratory techniques.

* The Internet enables people all around the world to quickly access and
  retrieve large amounts of information. With the aid of clever algorithms,
  sites on the Internet are able to manage and manipulate this large volume of
  data. Examples of problems that make essential use of algorithms include
  finding good routes on which the data will travel (techniques for solving
  such problems appear in :ref:`Chapter 24 <ch24>`), and using a search engine
  to quickly find pages on which particular information resides (related
  techniques are in :ref:`Chapter 11 <ch11>` and :ref:`Chapter 32 <ch32>`).

* Electronic commerce enables goods and services to be negotiated and exchanged
  electronically, and it depends on the privacy of personal information such as
  credit card numbers, passwords, and bank statements. The core technologies
  used in electronic commerce include public-key cryptography and digital
  signatures (covered in :ref:`Chapter 31 <ch31>`), which are based on
  numerical algorithms and number theory.

* Manufacturing and other commercial enterprises often need to allocate scarce
  resources in the most beneficial way. An oil company may wish to know where
  to place its wells in order to maximize its expected profit. A political
  candidate may want to determine where to spend money buying campaign
  advertising in order to maximize the chances of winning an election. An
  airline may wish to assign crews to flights in the least expensive way
  possible, making sure that each flight is covered and that government
  regulations regarding crew scheduling are met. An Internet service provider
  may wish to determine where to place additional resources in order to serve
  its customers more effectively. All of these are examples of problems that
  can be solved using linear programming, which we shall study in
  :ref:`Chapter 29 <ch29>`).

Although some of the details of these examples are beyond the scope of this
book, we do give underlying techniques that apply to these problems and problem
areas. We also show how to solve many specific problems, including the
following:

* We are given a road map on which the distance between each pair of adjacent
  intersections is marked, and we wish to determine the shortest route from one
  intersection to another. The number of possible routes can be huge, even if
  we disallow routes that cross over themselves. How do we choose which of all
  possible routes is the shortest? Here, we model the road map (which is itself
  a model of the actual roads) as a graph (which we will meet in
  :ref:`Part VI <p6>` and :ref:`Appendix B <ch37>`), and we wish to find the
  shortest path from one vertex to another in the graph. We shall see how to
  solve this problem efficiently in :ref:`Chapter 24 <ch24>`.

* We are given two ordered sequences of symbols,
  :math:`X=\langle x_1,x_2,\dots,x_m\rangle` and
  :math:`Y=\langle y_1,y_2,\dots,y_n\rangle`, and we wish to find a longest
  common subsequence of :math:`X` and :math:`Y`. A subsequence of :math:`X` is
  just :math:`X` with some (or possibly all or none) of its elements removed.
  For example, one subsequence of :math:`\langle A,B,C,D,E,F,G\rangle` would be
  :math:`\langle B,C,D,E,F\rangle`. The length of a longest common subsequence
  of :math:`X` and :math:`Y` gives one measure of how similar these two
  sequences are. For example, if the two sequences are base pairs in DNA
  strands, then we might consider them similar if they have a long common
  subsequence. If :math:`X` has :math:`m` symbols and :math:`Y` has
  :math:`n` symbols, then :math:`X` and :math:`Y` have :math:`2^m` and
  :math:`2^n` possible subsequences, respectively. Selecting all possible
  subsequences of :math:`X` and :math:`Y` and matching them up could take a
  prohibitively long time unless :math:`m` and :math:`n` are very small. We
  shall see in :ref:`Chapter 15 <ch15>` how to use a general technique known as
  dynamic programming to solve this problem much more efficiently.

* We are given a mechanical design in terms of a library of parts, where each
  part may include instances of other parts, and we need to list the parts in
  order so that each part appears before any part that uses it. If the design
  comprises :math:`n` parts, then there are :math:`n!` possible orders, where
  :math:`n!` denotes the factorial function. Because the factorial function
  grows faster than even an exponential function, we cannot feasibly generate
  each possible order and then verify that, within that order, each part
  appears before the parts using it (unless we have only a few parts). This
  problem is an instance of topological sorting, and we shall see in
  :ref:`Chapter 22 <ch22>` how to solve this problem efficiently.

* We are given :math:`n` points in the plane, and we wish to find the convex
  hull of these points. The convex hull is the smallest convex polygon
  containing the points. Intuitively, we can think of each point as being
  represented by a nail sticking out from a board. The convex hull would be
  represented by a tight rubber band that surrounds all the nails. Each nail
  around which the rubber band makes a turn is a vertex of the convex hull.
  (See :ref:`Figure 33.6 <fig33-6>` on page 1029 for an example.) Any of the
  :math:`2^n` subsets of the points might be the vertices of the convex hull.
  Knowing which points are vertices of the convex hull is not quite enough,
  either, since we also need to know the order in which they appear. There are
  many choices, therefore, for the vertices of the convex hull.
  :ref:`Chapter 33 <ch33>` gives two good methods for finding the convex hull.

These lists are far from exhaustive (as you again have probably surmised from
this book’s heft), but exhibit two characteristics that are common to many
interesting algorithmic problems:

1. They have many candidate solutions, the overwhelming majority of which do
   not solve the problem at hand. Finding one that does, or one that is “best,”
   can present quite a challenge.

2. They have practical applications. Of the problems in the above list, finding
   the shortest path provides the easiest examples. A transportation firm, such
   as a trucking or railroad company, has a financial interest in finding
   shortest paths through a road or rail network because taking shorter paths
   results in lower labor and fuel costs. Or a routing node on the Internet may
   need to find the shortest path through the network in order to route a
   message quickly. Or a person wishing to drive from New York to Boston may
   want to find driving directions from an appropriate Web site, or she may use
   her GPS while driving.

Not every problem solved by algorithms has an easily identified set of
candidate solutions. For example, suppose we are given a set of numerical
values representing samples of a signal, and we want to compute the discrete
Fourier transform of these samples. The discrete Fourier transform converts the
time domain to the frequency domain, producing a set of numerical coefficients,
so that we can determine the strength of various frequencies in the sampled
signal. In addition to lying at the heart of signal processing, discrete
Fourier transforms have applications in data compression and multiplying large
polynomials and integers. :ref:`Chapter 30 <ch30>` gives an efficient
algorithm, the fast Fourier transform (commonly called the FFT), for this
problem, and the chapter also sketches out the design of a hardware circuit to
compute the FFT.


.. _ch1-1-2:

Data structures
---------------

This book also contains several data structures. A **data structure** is a way
to store and organize data in order to facilitate access and modifications. No
single data structure works well for all purposes, and so it is important to
know the strengths and limitations of several of them.


.. _ch1-1-3:

Technique
---------

Although you can use this book as a “cookbook” for algorithms, you may someday
encounter a problem for which you cannot readily find a published algorithm
(many of the exercises and problems in this book, for example). This book will
teach you techniques of algorithm design and analysis so that you can develop
algorithms on your own, show that they give the correct answer, and understand
their efficiency. Different chapters address different aspects of algorithmic
problem solving. Some chapters address specific problems, such as finding
medians and order statistics in :ref:`Chapter 9 <ch9>`, computing minimum
spanning trees in :ref:`Chapter 23 <ch23>`, and determining a maximum flow in a
network in :ref:`Chapter 26 <ch26>`. Other chapters address techniques, such as
divide-and-conquer in :ref:`Chapter 4 <ch4>`, dynamic programming in
:ref:`Chapter 15 <ch15>`, and amortized analysis in :ref:`Chapter 17 <ch17>`.


.. _ch1-1-4:

Hard problems
-------------

Most of this book is about efficient algorithms. Our usual measure of
efficiency is speed, i.e., how long an algorithm takes to produce its result.
There are some problems, however, for which no efficient solution is known.
:ref:`Chapter 34 <ch34>` studies an interesting subset of these problems, which
are known as NP-complete.

Why are NP-complete problems interesting? First, although no efficient
algorithm for an NP-complete problem has ever been found, nobody has ever
proven that an efficient algorithm for one cannot exist. In other words, no one
knows whether or not efficient algorithms exist for NP-complete problems.
Second, the set of NP-complete problems has the remarkable property that if an
efficient algorithm exists for any one of them, then efficient algorithms exist
for all of them. This relationship among the NP-complete problems makes the
lack of efficient solutions all the more tantalizing. Third, several
NP-complete problems are similar, but not identical, to problems for which we
do know of efficient algorithms. Computer scientists are intrigued by how a
small change to the problem statement can cause a big change to the efficiency
of the best known algorithm.

You should know about NP-complete problems because some of them arise
surprisingly often in real applications. If you are called upon to produce an
efficient algorithm for an NP-complete problem, you are likely to spend a lot
of time in a fruitless search. If you can show that the problem is NP-complete,
you can instead spend your time developing an efficient algorithm that gives a
good, but not the best possible, solution.

As a concrete example, consider a delivery company with a central depot. Each
day, it loads up each delivery truck at the depot and sends it around to
deliver goods to several addresses. At the end of the day, each truck must end
up back at the depot so that it is ready to be loaded for the next day. To
reduce costs, the company wants to select an order of delivery stops that
yields the lowest overall distance traveled by each truck. This problem is the
well-known “traveling-salesman problem,” and it is NP-complete. It has no known
efficient algorithm. Under certain assumptions, however, we know of efficient
algorithms that give an overall distance which is not too far above the
smallest possible. :ref:`Chapter 35 <ch35>` discusses such “approximation
algorithms.”


.. _ch1-1-5:

Parallelism
-----------

For many years, we could count on processor clock speeds increasing at a steady
rate. Physical limitations present a fundamental roadblock to ever-increasing
clock speeds, however: because power density increases superlinearly with clock
speed, chips run the risk of melting once their clock speeds become high
enough. In order to perform more computations per second, therefore, chips are
being designed to contain not just one but several processing “cores.” We can
liken these multicore computers to several sequential computers on a single
chip; in other words, they are a type of “parallel computer.” In order to
elicit the best performance from multicore computers, we need to design
algorithms with parallelism in mind. :ref:`Chapter 27 <ch27>` presents a model
for “multithreaded” algorithms, which take advantage of multiple cores. This
model has advantages from a theoretical standpoint, and it forms the basis of
several successful computer programs, including a championship chess program.


.. _ex1-1:

.. rubric:: Exercises 1.1

.. _ex1-1-1:

1. Give a real-world example that requires sorting or a real-world example that
   requires computing a convex hull.
 
.. _ex1-1-2:

2. Other than speed, what other measures of efficiency might one use in a
   real-world setting?

.. _ex1-1-3:

3. Select a data structure that you have seen previously, and discuss its
   strengths and limitations.

.. _ex1-1-4:

4. How are the shortest-path and traveling-salesman problems given above
   similar? How are they different?

.. _ex1-1-5:

5. Come up with a real-world problem in which only the best solution will do.
   Then come up with one in which a solution that is “approximately” the best
   is good enough.
