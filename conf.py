# Configuration file for the Sphinx documentation builder.

# -- Path setup --------------------------------------------------------------

# import os
# import sys
# sys.path.insert(0, os.path.abspath('../src'))

# -- Project information -----------------------------------------------------

project = 'clrs'

copyright = '2009, Massachusetts Institute of Technology'

author = 'Thomas H. Cormen, ' \
         'Charles E. Leiserson, ' \
         'Ronald L. Rivest, ' \
         'Clifford Stein'

release = '3.0'

# -- General configuration ---------------------------------------------------

 
exclude_patterns = [
    'old/*',
    '.tox/*'
]

# extensions = [
#     'sphinx.ext.autodoc',
#     'sphinx-rtd-theme'
# ]

with open('rst_prolog.rst') as f:
    rst_prolog = f.read()

numfig = True

numfig_format = {
    'figure': 'Figure %s'
}

# numfig_secnum_depth = 2

# -- Options for LaTeX output ------------------------------------------------

latex_engine = 'xelatex'

# latex_logo = 'cover.png'

# latex_docclass = {
#     'manual': 'book'
# }

latex_documents = [(
    'index',
    project + '.tex',
    'Introduction to Algorithms',
    author.replace(', ', r'\and '),
    'manual'
)]

latex_additional_files = [
    'clrscode3e.sty',
    'preamble.sty'
]

latex_toplevel_sectioning = 'part'

latex_elements = {
    'papersize': 'a4paper',
    'preamble': r'\usepackage{preamble}'
}

# latex_elements = {
#     'papersize': 'a4paper',
#     'preamble': r'\usepackage{mystyle}',
#     'tableofcontents': r'''
# \frontmatter

# \sphinxtableofcontents
# '''
# }

# latex_domain_indices = False
