dim a as long
dim b as string
dim c as integer
dim d as integer
dim e as string
dim f as integer

on error goto exitCode
print "file name to formated .bas";
input b




open b for input as 1

a=0
a= instr(1,b,".")
if a<0 then a=len(b)-1
b=mid(b,1,a)+"bsf"
print b
open b for output as 2
a=0
do
          line input #1,b
          b=trim(b)
          if b="" then b="                "
          e=lcase(b)
          f=0
          d=instr$(e,"type")
          if d=1then f=1
          d=instr$(e,"do")
          if d=1then f=1
          d=instr$(e,"case")
          if d=1 then f=1
          d=instr$(e,"select")
          if d=1 then f=1
          d=instr$(e,"sub")
          if d=1 then f=1
          d=instr$(e,"for")
          if d=1 then f=1
          d=instr$(e,"if")
          if d=1 then d=instr(e,"then")
          if d>len(e)-6 then d=1
          if d=1 then f=1
          d=instr$(e,"function")
          if d=1 then f=1
          d=instr$(e,"end")
          if d=1 then f=2
          d=instr$(e,"loop")
          if d=1 then f=2
          d=instr$(e,"next")
          if d=1 then f=2
          if a<0 then a=0
          if f=2 then a=a-10
          b=space(a)+b
          print #2,b
          if f=1 then a=a+10
          
          if a<0 then a=0
          if eof(1) then exit do
loop

close 1
close 2

end -1

exitCode:
print " same error ocure"
close 1
close 2
