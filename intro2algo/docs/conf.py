# Configuration file for the Sphinx documentation builder.

from intro2algo import __version__, __author__, __copyright__

# -- Project information -----------------------------------------------------

project = 'intro2algo'
release = __version__
author = __author__
copyright = __copyright__

# -- General configuration ---------------------------------------------------

extensions = [
    'sphinx.ext.autodoc'
]

templates_path = ['_templates']

exclude_patterns = []

# with open('rst_prolog.rst') as f:
#     rst_prolog = f.read()

numfig = True

numfig_format = {
    'figure': 'Figure %s'
}

numfig_secnum_depth = 2

# -- Options for HTML output -------------------------------------------------

html_theme = 'alabaster'

html_static_path = ['_static']

html_logo = 'cover.png'

# -- Options for LaTeX output ------------------------------------------------

# latex_engine = 'xelatex'

# latex_logo = 'cover.png'

# latex_docclass = {
#     'manual': 'book'
# }

# latex_documents = [(
#     'index',
#     project + '.tex',
#     'Introduction to Algorithms',
#     author.replace(', ', r'\and '),
#     'manual'
# )]

# latex_additional_files = [
#     'clrscode3e.sty',
#     'mystyle.sty'
# ]

# latex_toplevel_sectioning = 'part'

# latex_elements = {
#     'papersize': 'a4paper',
#     'preamble': r'\usepackage{mystyle}',
#     'tableofcontents': r'''
# \frontmatter

# \sphinxtableofcontents
# '''
# }

# latex_domain_indices = False
