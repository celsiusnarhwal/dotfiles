import sys

try:
    from ptpython.ipython import embed
except ImportError:
    pass
else:
    sys.exit(embed())
