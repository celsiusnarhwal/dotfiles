import os
import sys
import subprocess

uv_args = ["uv", "run", "--with", "ipython", "--with", "ptpython"]
python_args = ["python", "-q"]

separator = "--"
separator_found = False

plain_arg = "--plain"
plain_arg_found = False

for arg in sys.argv[1:]:
    if arg == separator:
        separator_found = True
    elif arg == plain_arg:
        plain_arg_found = True
    elif separator in sys.argv and not separator_found:
        uv_args.append(arg)
    else:
        python_args.append(arg)

if plain_arg_found:
    uv_args = uv_args[:2] + uv_args[6:]
    python_args.remove("-q")

subprocess.run(uv_args + python_args)
