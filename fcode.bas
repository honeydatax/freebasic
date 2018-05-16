                
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
dim k as string
                
dim  ll as llist
dim  lll as llist
ll.count=0
lll.count=0
                
color 2,3
                
                
on error goto exitCode
print "file name to formated .c     ";
b=command(1)
                
                
                
                
open b for input as 1
                
a=0                
a= instr(1,b,".")
if a<0 then a=len(b)-1
b=mid(b,1,a)+"csf"
print b                
open b for output as 2
a=0                
do                
          line input #1,b
          b=ltrim(b)+"       "
          
     e=b
          f=0                
                          
        d=instr(e,"{")
       if d>0 then f=1
          
          d=instr(e,"}")
          if d>0  and  f=0 then f=2
          if d>0  and  f=1 then f=3
   
     

if instr(e,chr$(&h22))>1 or instr(e,chr$(&h27))>1 then     f=0



                                                 
          if f=1 then 
                    

          end if                
                          
          if f=2 then
                   
                   

          end if                
           
          if f=2 then a=a-10
          
         
          if a<0 then a=0
                          
                          
                          
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
