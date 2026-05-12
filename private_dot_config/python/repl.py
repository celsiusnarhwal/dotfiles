import sys
import subprocess

uv_args = ["uv", "run", "--with", "ipython", "--with", "ptpython"]
python_args = ["python", "-q"]
separator = "--"
separator_found = False

if separator not in sys.argv:
    python_args.extend(sys.argv[1:])
else:
    for arg in sys.argv[1:]:
        if arg == separator:
            separator_found = True
        elif not separator_found:
            uv_args.append(arg)
        else:
            python_args.append(arg)


subprocess.run(uv_args + python_args)
