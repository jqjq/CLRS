#from docutils import nodes
from docutils.parsers.rst.directives.body import Rubric

class Subsubsection(Rubric):
    pass

def setup(app):
    app.add_directive("subsubsection", Subsubsection)

    return {
        'version': '0.1',
        'parallel_read_safe': True,
        'parallel_write_safe': True,
    }
