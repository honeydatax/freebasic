function csum (s as string,ss as string,byref e as integer,carry as string)as string
          dim n as byte
          dim m as byte
          dim c as byte
          dim r as string
          c=asc(carry)-asc("0")
          n=asc(s)-asc("0")
          m=asc(ss)-asc("0")
          n=n+m+c                
          if n<0 or n>19 then
                    e=-1                
                    else                 
                    e=0                
          end if                
          n=n+asc("0")
          if n>asc("9") then
                    n=n-10                
                    carry="1"
                    else                
                    carry="0"
          end if                
          r=""+chr(n)
          return r                
end function
                
function smax(s as string,ss as string) as integer
          dim m as integer
          dim n as integer
          m=len(s)                
          n=len(ss)
          if m>n then n=m
          return n                
end function
                
function stringReverse(s as string) as string
          dim ss as string=""
          dim sss as string=""
          dim n as integer
          for n=1 to len(s)
                    sss=mid(s,n,1)
                    ss=sss+ss
          next n                
          return ss
end function
                
function stringsum(s as string,ss as string,byref e as integer) as string
          dim sss as string=""
          dim carry as string="0"
          dim s1 as string
          dim s2 as string
          dim f as integer
          dim m as integer
          dim n as integer
          dim ee as integer
          n=smax (s,ss)
          n=n+1                
          if len(s)<>n then s1=string(n-len(s),"0")+s
          if len(ss)<>n then s2=string( n-len(ss),"0")+ss
          s1=stringReverse(s1)
          s2=stringReverse(s2)
          for m=1 to n
                    sss=csum(mid(s1,m,1),mid(s2,m,1),ee,carry)+sss
                    if ee<>0 then m=n+1
                    e=ee                
          next m                
                          
                          
          return sss
end function
                
                
                
sub priformated (s as string)
          dim sss as string=""
          dim ss as string=""
          dim c as integer=0
          dim cc as integer=len(s)
          dim n as integer
          sss=stringReverse(s)
          for n=1 to cc
                    ss=mid(sss,n,1)+ss
                    c=c+1                
                    if c=3 and n<>cc then
                              c=0                
                              ss=","+ss
                    end if                
          next n                
          print ss                
                          
end sub                
                
                
                
dim s1 as string=  "12345678901234567890123456789012345678901234567890"
dim s2 as string  ="44444444443333333333222222222211111111110000000000"
dim e as integer
                
color 1,15
cls                
                
                
print " ";
priformated s1
print "+";
priformated s2
print string(75,"-")
priformated stringsum(s1,s2,e)
                
                
                
