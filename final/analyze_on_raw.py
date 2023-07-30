f = open("analysis_raw.d","r")
raw_data = f.read()
raw_data = raw_data.split("\n")
functions = [];
for rd in raw_data:
    if(len(rd)==0):
        continue
    functions.append(rd[-1])
    
fw = open("analysis_final.d","w+")
for func in functions:
    fw.write(func)
    fw.write("\n")
