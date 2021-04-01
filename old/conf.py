# Configuration file for the Sphinx documentation builder.

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
sys.path.insert(0, os.path.abspath('../src'))

# -- Project information -----------------------------------------------------

project = 'clrs'

copyright = '2009, Massachusetts Institute of Technology'

author = 'Thomas H. Cormen, ' \
         'Charles E. Leiserson, ' \
         'Ronald L. Rivest, ' \
         'Clifford Stein'

# The full version, including alpha/beta/rc tags
release = '3.0'

# -- General configuration ---------------------------------------------------

extensions = [
    'sphinx.ext.autodoc',
    'sphinx-rtd-theme'
]

with open('rst_prolog.rst') as f:
    RST_PROLOG = f.read()

rst_prolog = RST_PROLOG

numfig = True

numfig_format = {
    'figure': 'Figure %s'
}

numfig_secnum_depth = 2

# -- Options for LaTeX output ------------------------------------------------

latex_engine = 'xelatex'

latex_logo = 'cover.png'

latex_docclass = {
    'manual': 'book'
}

latex_documents = [(
    'index',
    project + '.tex',
    'Introduction to Algorithms',
    author.replace(', ', r'\and '),
    'manual'
)]

latex_additional_files = [
    'clrscode3e.sty',
    'mystyle.sty'
]

latex_toplevel_sectioning = 'part'

latex_elements = {
    'papersize': 'a4paper',
    'preamble': r'\usepackage{mystyle}',
    'tableofcontents': r'''
\frontmatter

\sphinxtableofcontents
'''
}

latex_domain_indices = False
