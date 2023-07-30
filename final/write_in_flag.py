import sys
f = open("analysis_final.d","r")
data = f.read()
func_name = sys.argv[1]
if func_name in data:
    print("1")
else:
    print("0")

