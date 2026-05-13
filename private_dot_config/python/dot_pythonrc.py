import sys

try:
    from ptpython.ipython import embed
    sys.exit(embed())
except ImportError:
    print("ptpython could not be started, falling back to the standard REPL.")