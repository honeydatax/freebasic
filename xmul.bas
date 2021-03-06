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
                
function stringpsum(s as string,ss as string,byref e as integer) as string
          dim sss as string=""
          dim ssss as string =""
          dim carry as string="0"
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim s4 as string
          dim f as integer
          dim m as integer
          dim n as integer
          dim nn as integer
          dim ee as integer
          if instr(s,".")>0 then
                    s1=mid(s,1,instr(s,".")-1)
                    if  instr(s,".")<len(s) then
                              s3=mid(s,instr(s,".")+1)
                              else                
                              s3="0"                
                    end if                
                    else                
                    s3="0"                
                    s1=s                
          end if                
                          
          if instr(ss,".")>0 then
                    s2=mid(ss,1,instr(ss,".")-1)
                    if  instr(ss,".")<len(ss) then
                              s4=mid(ss,instr(ss,".")+1)
                              else                
                              s4="0"                
                    end if                
                    else                
                    s4="0"                
                    s2=ss                
          end if                
                          
                          
                          
          nn=smax (s3,s4)
          n=smax (s1,s2)
          n=n+1                
          nn=nn+1           
          if len(s1)<>n then s1=string(n-len(s1),"0")+s1
          if len(s2)<>n then s2=string( n-len(s2),"0")+s2
          if len(s3)<>n then s3=s3+string(nn-len(s3),"0")
          if len(s4)<>n then s4=s4+string( nn-len(s4),"0")
          s1=stringReverse(s1)
          s2=stringReverse(s2)
          s3=stringReverse(s3)
          s4=stringReverse(s4)
          carry="0"
          for m=1 to nn
                    ssss=csum(mid(s3,m,1),mid(s4,m,1),ee,carry)+ssss
                    if ee<>0 then m=nn+1
                    e=ee                
          next m                
                          
          if e<>-1 then
                    for m=1 to n
                              sss=csum(mid(s1,m,1),mid(s2,m,1),ee,carry)+sss
                              if ee<>0 then m=n+1
                              e=ee                
                    next m                
          end if             
          sss=sss+"."+ssss 
          return sss
end function
                
sub printforp(s as string)
          dim sss as string=""
          dim ss as string=""
          dim c as integer=0
          dim cc as integer
          dim n as integer
          dim s1 as string
          dim s2 as string
          s1=mid(s,1,instr(s,".")-1)
          s2=mid(s,instr(s,".")+1)
          cc=len(s1)
          sss=stringReverse(s1)
          c=0                
          for n=1 to cc
                    ss=mid(sss,n,1)+ss
                    c=c+1                
                    if c=3 and n<>cc then
                              c=0                
                              ss=","+ss
                    end if                
          next n                
          print ss  ;"."            ;
          cc=len(s2)
          ss=""                
          sss=s2                
          c=0                
          for n=1 to cc
                    ss=ss+mid(sss,n,1)
                    c=c+1                
                    if c=3 and n<>cc then
                              c=0                
                              ss=ss+","
                    end if                
          next n                
          print ss                
                          
end sub                
                
                
                
function cmul(s as string,ss as string ,byref e as integer,byref carry as string)as string
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim b as integer
          dim c as integer
                          
          c=val(carry)
          a=asc(s)-asc("0")
          b=asc(ss)-asc("0")
          if a>9 or b>9 or a<0 or b<0 then e=-1
          a=b*a+c                
          s1=trim(str(a))
          if len(s1)>1 then 
                    carry=mid(s1,1,len(s1)-1)
                    else                
                    carry="0"
          end if                
          s1=mid(s1,len(s1))
          return s1
end function
                
                
function linemul(s as string,ss as string,byref e as integer) as string
          dim carry as string="0"
          dim s1 as string=""
          dim s2 as string
          dim m as integer
          dim n as integer
          dim c as integer
          dim ee as integer=0
                          
          s2=stringreverse(s)
          c=len(s)                
          for n=1 to c
                    s1=cmul(mid(s2,n,1),ss,ee,carry)+s1
                    e=ee                
                    if e=-1 then n=c+1
          next n                
                          
          if e<>-1 then s1=carry+s1
                          
          return s1
end function                
                
                
function strmult(s as string ,ss as string,byref e as integer) as string
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim ee as integer
          dim l as string="0"
          dim ll as string="0"
          s1=stringreverse(ss)
          c = len(s1)
                          
                          
          for n=1 to c
                    l=linemul(s,mid(s1,n,1),ee)+string(n-1,"0")
                    e=ee                
                    if e=-1 then n=c+1
                    if e<>-1 then
                              ll=stringsum(ll,l,e)
                    end if                
                                    
                    e=ee                
                    if e=-1 then n=c+1
          next n                
                          
          return ll
                          
end function
                
function remformated( s as string)as string
          dim n as integer
          dim m as byte
          dim ss as string=""
          dim sss as string
          for n=1 to len(s)
                    m=asc(mid(s,n,1))
                    if m > (asc("0")-1) and m < (asc("9")+1) then 
                              ss = ss + chr(m)
                    end if                
          next n                
          return ss
end function
                
dim s1 as string=  ""
dim s2 as string  =""
dim e as integer
dim r as string
dim carry as string
                
color 1,15
cls                
                
print " input a number using,separete"
line input s1        
                
print "X"
print " input a number using,separete"
line input s2
s1=remformated (s1)      
s2=remformated (s2)             
print string(75,"-")
r=strmult(s1,s2,e)
priformated r                
                
                
                
