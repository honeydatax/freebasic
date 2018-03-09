
const maxItem=100
type llist
          item(0 to maxItem) as string
          count as integer
          orders(0 to maxItem)as integer
end type                
                
                
                
function additem (ll as llist,s as string) as integer
          dim a as integer=-1
          if ll.count<maxItem-1 then
                    ll.count=ll.count+1
                    ll.orders(ll.count-1)=ll.count-1
                    ll.item(ll.count-1)=s
                    a=ll.count-1
          end if                
          return a                
end function
                
function listItens(ll as llist,s as string)as integer
          dim a as integer
          dim b as integer
          dim c as integer=-1
          
              if  ll.count >0 then
          for a=0 to ll.count-1
                    if s=ll.item(a) then 
                                 c=a
                                 a=ll.count
                    end if
          next a               
end if 
         return c      
end function               
                


dim a as long=0
dim b as string
dim c as integer=0
dim d as integer=0
dim e as string
dim f as integer=0
dim ff as integer=0
dim fff as integer=0
dim j as integer=0

dim  ll as llist
dim  lll as llist
ll.count=0
lll.count=0

color 2,3


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
          
          d=instr(e,"jo ")
          if d=1 then f=2
          d=instr(e,"jno ")
          if d=1 then f=2


           d=instr(e,"jna ")
          if d=1 then f=2
          d=instr(e,"ja ")
          if d=1 then f=2
          d=instr(e,"jea ")
          if d=1 then f=2
          d=instr(e,"jae ")
          if d=1 then f=2
          d=instr(e,"jbe ")
           

          d=instr(e,"jnz ")
          if d=1 then f=2
          d=instr(e,"jz ")
          if d=1 then f=2
          d=instr(e,"jb ")
          if d=1 then f=2
          d=instr(e,"jnb ")
          if d=1 then f=2
          d=instr(e,"jeb ")
          if d=1 then f=2
          
          d=instr(e,"ret")
          if d=1 then f=3
          d=instr(e,"iret")
          if d=1 then f=3
          d=instr(e,"retf")
          if d=1 then f=3
          d=instr(e,"ret ")
          if d=1 then f=3
          d=instr(e,"retz")
          if d=1 then f=3
           d=instr(e,":")
           if d>1then f=1
           
           if f=1 then 
                      b=ucase(e)
           j=0
           if fff=0 then 
j=1
else
ff= listItens(lll,trim(mid(b,1,instr(b,":")-1)))
if ff>-1 then
j=1
f=0
else

end if
end if
fff=1

        additem (ll,trim(mid(b,1,instr(b,":")-1)))
         
           
           end if
          
          if f=2 then
           b=ucase(e)
ff= listItens(ll,trim(mid(b,instr(b," "))))
if ff>-1 then

f=4

else
f=0
end if
           additem (lll,trim(mid(b,instr(b," "))))
         
                    
end if
          
          if f=3  then b=ucase(b)
          if a<0 then a=0



          b=space(a)+b
          
          print #2,b
          if f=1 then a=a+10
          if f=4 then a=a-10
          if f=3 then 
           a=0
           ll.count=0
           lll.count=0
           
           fff=0
           end if
          
          
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
