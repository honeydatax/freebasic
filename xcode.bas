dim a as long
dim b as string
dim c as integer
dim d as integer
dim e as string
dim f as integer

on error goto exitCode
print "file name to formated .asm ";
b=command(1)




open b for input as 1

a=0
a= instr(1,b,".")
if a<0 then a=len(b)-1
b=mid(b,1,a)+"asf"
print b
open b for output as 2
a=0
do
          line input #1,b
          b=ltrim(b)
          if len(b)<9 then b=b+"                "
          e=lcase(b)
          f=0
          d=instr(e,":")
           if d>1then f=1
           
           
          d=instr(e,"jo ")
          if d=1 then f=2
          d=instr(e,"jno ")
          if d=1 then f=2
          d=instr(e,"jb ")
          if d=1 then f=2
          d=instr(e,"jnb ")
          if d=1 then f=2
           
           
           d=instr(e,"jbe ")
          if d=1 then f=2
          d=instr(e,"jeb ")
          if d=1 then f=2
          d=instr(e,"jae ")
          if d=1 then f=2
          d=instr(e,"jea ")
          if d=1 then f=2
           
           
           
          d=instr(e,"jne ")
          if d=1 then f=2
          d=instr(e,"je ")
          if d=1 then f=2
          d=instr(e,"ja ")
          if d=1 then f=2
          d=instr(e,"jna ")
          if d=1 then f=2
          
          d=instr(e,"jnc ")
          if d=1 then f=2
          d=instr(e,"jc ")
          if d=1 then f=2
          d=instr(e,"jz ")
          if d=1 then f=2
          d=instr(e,"jnz ")
          if d=1 then f=2
          
          d=instr(e,"ret")
          if d=1 then f=3
          d=instr(e,"iret")
          if d=1 then f=3
          d=instr(e,"retf")
          if d=1 then f=3
          d=instr(e,"retnz")
          if d=1 then f=3
          d=instr(e,"retz")
          if d=1 then f=3
          
          if f=3 or f=2 or f=3 then b=ucase(b)
          if a<0 then a=0
          if f=2 then a=a-10
          b=space(a)+b
          
          print #2,b
          if f=1 then a=a+10
          if f=3 then a=0
          
          
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
