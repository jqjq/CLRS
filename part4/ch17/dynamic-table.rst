.. _ch17-4:

Dynamic tables
==============

We do not always know in advance how many objects some applications will store
in a table. We might allocate space for a table, only to find out later that it
is not enough. We must then reallocate the table with a larger size and copy
all objects stored in the original table over into the new, larger table.
Similarly, if many objects have been deleted from the table, it may be
worthwhile to reallocate the table with a smaller size. In this section, we
study this problem of dynamically expanding and contracting a table. Using
amortized analysis, we shall show that the amortized cost of insertion and
deletion is only :math:`O(1)`, even though the actual cost of an operation is
large when it triggers an expansion or a contraction. Moreover, we shall see
how to guarantee that the unused space in a dynamic table never exceeds a
constant fraction of the total space.

We assume that the dynamic table supports the operations ``TableInsert`` and
``TableDelete``. ``TableInsert`` inserts into the table an item that occupies a
single **slot**, that is, a space for one item. Likewise, ``TableDelete``
removes an item from the table, thereby freeing a slot. The details of the
data-structuring method used to organize the table are unimportant; we might
use a stack (:ref:`Section 10.1 <ch10-1>`), a heap (:ref:`Chapter 6 <ch6>`), or
a hash table (:ref:`Chapter 11 <ch11>`). We might also use an array or
collection of arrays to implement object storage, as we did in
:ref:`Section 10.3 <ch10-3>`.

We shall find it convenient to use a concept introduced in our analysis of
hashing (:ref:`Chapter 11 <ch11>`). We define the **load factor**
:math:`\alpha(T)` of a nonempty table :math:`T` to be the number of items
stored in the table divided by the size (number of slots) of the table. We
assign an empty table (one with no items) size :math:`0`, and we define its
load factor to be :math:`1`. If the load factor of a dynamic table is bounded
below by a constant, the unused space in the table is never more than a
constant fraction of the total amount of space.

We start by analyzing a dynamic table in which we only insert items. We then
consider the more general case in which we both insert and delete items.

.. _ch17-4-1:

Table expansion
---------------

Let us assume that storage for a table is allocated as an array of slots. A
table fills up when all slots have been used or, equivalently, when its load
factor is :math:`1`. [#f1]_ In some software environments, upon attempting to
insert an item into a full table, the only alternative is to abort with an
error. We shall assume, however, that our software environment, like many
modern ones, provides a memory-management system that an allocate and free
blocks of storage on request. Thus, upon inserting an item into a full table,
we can **expand** the table by allocating a new table with more slots than the
old table had. Because we always need the table to reside in contiguous memory,
we must allocate a new array for the larger table and then copy items from the
old table into the new table.

A common heuristic allocates a new table with twice as many slots as the old
one. If the only table operations are insertions, then the load factor of the
table is always at least :math:`1/2`, and thus the amount of wasted space never
exceeds half the total space in the table.

In the following pseudocode, we assume that :math:`T` is an object representing
the table. The attribute :math:`T.\mathit{table}` contains a pointer to the
block of storage representing the table, :math:`T.\mathit{num}` contains the
number of items in the table, and :math:`T.\mathit{size}` gives the total
number of slots in the table. Initially, the table is empty:
:math:`T.\mathit{num} = T.\mathit{size} = 0`.

.. literalinclude:: /../src/libalgo/table.py

.. _ch17-4-2:

Table expansion and contraction
-------------------------------

.. _ex17-4:

Exercises
^^^^^^^^^

.. _ex17-4-1:

**17.4-1** Suppose that we wish to implement a dynamic, open-address hash
table. Why might we consider the table to be full when its load factor reaches
some value :math:`\alpha` that is strictly less than :math:`1`? Describe
briefly how to make insertion into a dynamic, open-address hash table run in
such a way that the expected value of the amortized cost per insertion is
:math:`O(1)`. Why is the expected value of the actual cost per insertion not
necessarily :math:`O(1)` for all insertions?



.. rubric:: Footnotes

.. [#f1] In some situations, such as an open-address hash table, we may wish to
         consider a table to be full if its load factor equals some constant
         strictly less than :math:`1`. (See :ref:`Exercise 17.4-1 <ex17-4-1>`.)
