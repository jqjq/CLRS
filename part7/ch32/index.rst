.. _ch32:

***************
String Matching
***************

Text-editing programs frequently need to find all occurrences of a pattern in
the text. Typically, the text is a document being edited, and the pattern
searched for is a particular word supplied by the user. Efficient algorithms
for this problem—called “string matching”—can greatly aid the responsiveness of
the text-editing program. Among their many other applications, string-matching
algorithms search for particular patterns in DNA sequences. Internet search
engines also use them to find Web pages relevant to queries.

We formalize the string-matching problem as follows. We assume that the text is
an array :math:`T[1 \twodots n]` of length :math:`n` and that the pattern is an
array :math:`P[1 \twodots m]` of length :math:`m \le n`. We further assume that
the elements of :math:`P` and :math:`T` are characters drawn from a finite
alphabet :math:`\Sigma`. For example, we may have
:math:`\Sigma = \{ \mathtt{0,1} \}` or
:math:`\Sigma = \{ \mathtt{a,b,\ldots,z} \}` :math:`\Sigma = \{ 1,2,3 \}`. The
character arrays :math:`P` and :math:`T` are often called :strongemph:`strings`
of characters.
