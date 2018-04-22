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
                
                
function rformated( s as string)as string
          dim n as integer
          dim m as byte
          dim ss as string=""
          dim sss as string
          for n=1 to len(s)
                    m=asc(mid(s,n,1))
                    if m > (asc("0")-1) and m < (asc("9")+1) or m=(asc(".")) then 
                              ss = ss + chr(m)
                    end if                
          next n                
          return ss
end function
                
function ppoint(s as string)as integer
          dim rt as integer
          dim t as integer
          t=instr(s,".")
          rt=len(s)
          if t<1 then 
                    rt=0                
                    else                
                    rt=rt-t                
          end if                
          return rt
end function
                
                
function ptat (s as string,p as integer)as string
          dim ss as string
          dim n as integer
          n=len(s)                
          ss=mid(s,1,n-p)+"."+mid(s,n-p+1)
          return ss
end function
                
                
function getforp(s as string) as string
          dim sss as string=""
          dim ss as string=""
          dim c as integer=0
          dim cc as integer
          dim n as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
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
                          
          s3=ss+"."
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
          s3=s3+ss                
          return s3    
                          
end function         
                
                
                
function strmultfile(s as string ,ss as string,byref e as integer,files as string) as string
          dim s1 as string
          dim s2 as string
          dim s4 as string
          dim s5 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim aa as integer
          dim ee as integer
          dim l as string="0"
          dim ll as string="0"
          dim b as integer
          dim r as string
          s1=s                
          s2=ss                
          open files for output  as #1
                          
          print #1,s1
          print #1, "X"
          print #1,s2
          a=len(s1)
          c=len(s2)
                          
          a=a+c+8                
          c=a/3                
          a=a+c                
                          
                          
                          
          print #1,string(a,"-")
          aa=a                
          s1=trim (s1)
          s2=trim(s2)
                          
          s1=rformated (s1)      
          s2=rformated (s2)           
          a= ppoint(s1)
          b=ppoint (s2)
          a=a+b                   
                          
          s1=remformated (s1)      
          s2=remformated (s2)           
                          
          r=""                
                          
                          
                          
                          
                          
          s4=s1                
                          
          s5=stringreverse(s2)
          c = len(s5)
          s2=""                
          s1=""                
                          
                          
          for n=1 to c
                    l=linemul(s4,mid(s5,n,1),ee)+string(n-1,"0")
                    e=ee                
                    if e=-1 then n=c+1
                    if e<>-1 then
                              r=l                
                                              
                              if len(r)<=a then r=space(a-len(r)+1)+r
                              r=mid(r,1,len(r)-a)+"."+mid(r,len(r)-a+1)
                              r= getforp(r)
                              r=space(aa-len(r))+r
                              print #1,r
                              ll=stringsum(ll,l,e)
                    end if                
                                    
                    e=ee                
                    if e=-1 then n=c+1
          next n     
          if a>=len(ll) then ll=string( a-len(ll),0)+ll           
          ll=ptat(ll,a)
          ll=getforp(ll)
          print  #1,string(aa,"-")
          print #1,space(aa-len(ll))+ll
          if e=-1 then print #1,"error"
          close #1                
          return ll
                          
end function           
                
                
function zerot(s as string)as string
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim s4 as string
          dim c as integer
          dim cc as integer
          dim n as integer
          dim m as integer
          s4=s                
          c= instr(s4,".")
          if c<1 then c=len(s4)
                          
                          
          if c>2 then
                    do                
                              c=instr(s4,".")
                              if c <1 then c=len(s4)
                              if c<3 then exit do
                              s3=mid(s4,1,1)
                                              
                              if s3="." then exit do
                              if s3<>"0" then exit do
                              if s3="0" and c>1 then s4=mid(s4,2)
                                              
                                              
                    loop                
          end if                
                          
                          
          c= instr(s4,".")
          if c>0 then
                    do                
                              n=len(s4)
                              s3=mid(s4,n,1)
                              if s3="0" then s4=mid(s4,1,n-1)
                              if s3<>"0" then exit do
                              c= instr(s4,".")
                              if c<n+1 then exit do
                    loop                
          end if                
                          
                          
          return s4
end function                
                
sub sumlistfile(inps as string , outps as string)
          dim r as string="0.0"
          dim e as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
          open inps for input as #1
          open outps for output as #2
                          
          do                
                    line input #1,s1
                    if s1="" then s1="0.0"
                    s2=s1+"+="
                    s1="0"+trim(s1)
                    s1=rformated(s1)
                    r=stringpsum(r,s1,e)
                    r=zerot(r)
                    s3=getforp(r)
                    s2=s2+s3                
                    print #2,s2
                                    
                    if e=-1 then print #2,"error"
                                    
                    if eof(1) then exit do
          loop                
          close #1                
          close #2                
end sub                
                
                
                
function great(s as string,ss as string)as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim a as integer
          dim b as integer
          dim c as integer=0
          s1=rformated (s)      
          s2=rformated (ss)
                          
          a=instr(s1,".")
          b=instr(s2,".")
          if a<1 then a=len(s1)
          if b<1 then b=len(s2)
          if a>b then
                    c=-1                
                                    
                    else                
                    if a<b then
                              c=0                
                              else                
                              if s1> s2 then c=-1
                                              
                    end if                
          end if                
                          
          return c                
end function 
                
                
function less(s as string,ss as string)as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim a as integer
          dim b as integer
          dim c as integer=0
          s1=rformated (s)      
          s2=rformated (ss)
                          
          a=instr(s1,".")
          b=instr(s2,".")
          if a<1 then a=len(s1)
          if b<1 then b=len(s2)
          if a<b then
                    c=-1                
                                    
                    else                
                    if a>b then
                              c=0                
                              else                
                              if s1<s2 then c=-1
                              if s1=s2 then c=0                
                    end if                
          end if                
                          
          return c                
end function 
                
                
function like(s as string,ss as string)as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim a as integer
          dim b as integer
          dim c as integer=0
          s1=rformated (s)      
          s2=rformated (ss)
                          
          if s1=s2 then c=-1
                          
                          
          return c                
end function 
                
                
function csub(s as string,ss as string,byref e as integer ,byref carry as string)as string
          dim n as byte
          dim m as byte
          dim c as byte
                          
          dim r as string
          c=asc(carry)-asc("0")
          n=asc(s)-asc("0")
          m=asc(ss)-asc("0")
                          
                          
                          
                          
          if n<0 or n>9 or m>9 or m<0 then
                    e=-1                
                    else                 
                    e=0                
          end if                
          carry="0"
          m=m+c                
          if m>n then 
                    n=n+10                
                    carry="1"
          end if                
          n=n-m                
          n=n+asc("0")
                          
          r=""+chr(n)
          return r                
end function 
                
                
                
function stringsub(s as string,ss as string,byref e as integer) as string
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
                    sss=csub(mid(s1,m,1),mid(s2,m,1),ee,carry)+sss
                    if ee<>0 then m=n+1
                    e=ee                
          next m                
                          
                          
          return sss
end function
                
                
                
function stringpsub(s as string,ss as string,byref e as integer) as string
          dim sss as string=""
          dim ssss as string =""
          dim carry as string="0"
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim s4 as string
          dim s5 as string
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
                    ssss=csub(mid(s3,m,1),mid(s4,m,1),ee,carry)+ssss
                    if ee<>0 then m=nn+1
                    e=ee                
          next m                
                          
          if e<>-1 then
                    for m=1 to n
                              sss=csub(mid(s1,m,1),mid(s2,m,1),ee,carry)+sss
                              if ee<>0 then m=n+1
                              e=ee                
                    next m                
          end if             
          sss=sss+"."+ssss 
          return sss
end function
                
                
sub sublistfile(inps as string , outps as string)
          dim r as string="0.0"
          dim e as integer
          dim s1 as string
          dim s2 as string
          dim s3 as string
          open inps for input as #1
          open outps for output as #2
          line input #1,s1
          s2=s1+"+="
          s1=trim(s1)
          s1=rformated(s1)
          r=s1                 
          print #2,r
          do                
                    line input #1,s1
                    if s1="" then s1="0.0"
                    s2=s1+"-="
                    s1="0"+trim(s1)
                    s1=rformated(s1)
                    r=stringpsub(r,s1,e)
                    r=zerot(r)
                    s3=getforp(r)
                    s2=s2+s3                
                    print #2,s2
                                    
                    if e=-1 then print #2,"error"
                                    
                    if eof(1) then exit do
          loop                
          close #1                
          close #2                
end sub               
                
                
sub e(s as string,i as integer)
          dim s1 as string
          dim s2 as string
          dim c as integer
          dim b as integer
          dim d as integer
          dim a as integer
                          
          s1=rformated(s)
          c=instr(s1,".")
          s1=remformated(s1)
          a=len(s1)
          b=a-c                
          d=i-b-1                
          s2=s1+string(d,"0")
          priformated(s2)
                          
end sub       
                
                
function zerott(s as string)as string
          dim s1 as string
          dim s2 as string
          dim s3 as string
          dim s4 as string
          dim c as integer
          dim cc as integer
          dim n as integer
          dim m as integer
          s4=s                
                          
          c=len(s4)
                          
                          
          if c>1 then
                    do                
                                              
                                              
                              if len(s4)=1 then exit do
                              s3=mid(s4,1,1)
                                              
                                              
                              if s3<>"0" then exit do
                              if s3="0" and len(s4)>1 then s4=mid(s4,2)
                                              
                                              
                    loop                
          end if                
                          
                          
                          
                          
          return s4
end function                
                
                
                
sub strdiv(filein as string,fileout as string)
          dim ry as integer
          dim carryc as integer
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim f as integer
          dim ff as integer
          dim ass as string
          dim ee as integer
          dim b as integer
          dim d as integer
          dim l as string="0"
          dim ll as string="0"
          dim s as string
          dim ss as string
          dim sss as string
          dim nn as integer
          dim ssss as string
          dim ssss1 as string
          dim ss2 as string
          dim jjj as string
          dim h as integer
          dim lll as integer
          dim j1 as string
          open filein for input as #1
          open fileout for output as #2
          line input #1,ss
          line input #1,s
          ss=trim(ss)
          s=trim(s)
                          
          print #2,ss
                          
          ss=rformated(ss)
          c=instr(ss,".")
          a=len(ss)
          ss=remformated(ss)
                          
          b=a-c           
          if c<1 then b=0
          d=b       
          ss=zerott("0"+ss)
          a=len(ss)
          ry=a                
          f=a                
          ff=a                
          print #2,ss
                          
                          
                          
                          
                          
          sss=rformated(s)
          c=instr(sss,".")
                          
          ass=sss            
          a=len(sss)
                          
          sss=remformated(sss)
                          
                          
                          
          sss=zerott("0"+sss)
                          
                          
          b=a-c          
          if c<1 then b=0
          d=d-b                
                          
          a=len(sss)
          if a>ry then
                    d=d+(a-ry)
                    ss=ss+string(a-ry,"0")
          end if                
          n=a                
          f=0                
          s1=""                
          ss2=mid(ss,1,a)            
                          
                          
          do                
                                    
                                    
                    carryc=0                
                                    
                    ss2=zerott("0"+ss2)  
                                    
                                    
                                    
                                    
                    lll=len(ss2)
                                    
                    for h=9 to 0 step -1
                              j1=chr(asc("0")+h)
                              ssss1=strmult(sss,j1,ee)
                              ssss1=zerott("0"+ssss1)  
                                              
                              if ee<>-1 and great(ss2,ssss1) or like(ss2,ssss1) then
                                        carryc=-1
                                        s1=s1+j1                
                                        jjj=stringsub(ss2,ssss1,ee)
                                        jjj=zerott("0"+jjj)  
                                        ss2=jjj                
                                                        
                                                        
                                                        
                                        f=n                
                                        h=-1                
                                        ee=0                
                              end if                
                    next h                
                                    
                                    
                    again:                
                    if ee=-1 then print #2,"error"
                    if ee=-1 then exit do
                                    
                                    
                    ss2=zerott("0"+ss2)
                    if f>ry and ss2="0" and carryc=-1 then 
                              print #2,space(n-len(ss2))+ss2
                              exit do     
                    end if                 
                    if f>=ry+17 and carryc=-1  then 
                              print #2,space(n-len(ss2))+ss2
                              exit do                
                    end if                
                    n=n+1                
                                    
                                    
                    if  great(ss2,sss)=0 and like (ss2,sss)=0 then
                              if n<=ry then 
                                        ss2=ss2+mid(ss,n,1)
                                        else                
                                        ss2=ss2+"0"
                                        d=d+1                
                              end if                 
                    end if                
                    if carryc=-1 then print #2,space(n-len(ss2))+ss2
                                    
          loop            
                          
          if ee<>-1 then
                    print #2,string(len(s1)+8,"-")
                    print #2," \"
                    print #2,ass
                    if len(s1)<=d then s1=string(d-len(s1),"0")+s1
                    s1=ptat(s1,d)
                    s1=getforp(s1)
                    print #2,s1
                                    
                    else                
                                    
                    print #2,"error"
          end if                 
          close #1                
          close #2                
                          
                          
end sub                
                
function strints(s as string)as string
          dim sss as string
          dim l as integer
                          
          sss=rformated(s)
          l=instr(sss,".")-1
          if l<1 then l=len(sss)
          sss=mid(sss,1,l)
          return sss
end function
                
sub percentbar(x as integer,y as integer,p as integer)
          dim pp as integer
          locate y,x
          pp=p                
          if pp>100 then pp=100
          if pp<0 then pp=0
          print pp;"%";"    "
end sub               
                
function blocks(p as integer,bmax as integer) as integer
          dim a as integer
          dim l as long
          dim ll as long
          l=p                
          ll=bmax                
          ll=ll*10000
          ll=ll\100
          l=l*10000
          ll=l\ll                
          a=ll                
          return a                
end function 
                
                
sub squreroot(filein as string,fileout as string,x as integer,y as integer)
          dim ry as integer
          dim carryc as integer
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim f as integer
          dim ff as integer
          dim ass as string
          dim ee as integer
          dim b as integer
          dim d as integer
          dim l as string="0"
          dim ll as string="0"
          dim s as string
          dim ss as string
          dim sss as string
          dim nn as integer
          dim ssss as string
          dim ssss1 as string
          dim ss2 as string
          dim jjj as string
          dim h as integer
          dim lll as integer
          dim j1 as string
          open filein for input as #1
          open fileout for output as #2
          line input #1,ss
                          
          ss=trim(ss)
          ss=zerott("0"+ss)  
          print #2,ss
          ss=strints(ss)
          print #2,ss
          nn=len(ss)\2+2
                          
          ss2=string(nn,"0")
                          
                          
                          
                          
          for b=1 to nn
                    lll=blocks(b,nn)
                    percentbar x,y,lll
                    for h=9 to 0 step -1
                                              
                              ss2=mid(ss2,1,b-1)+(chr(asc("0")+h))+mid(ss2,b+1,nn-b+1)
                              s1=strmult(ss2,ss2,ee)
                              s1=zerott("0"+s1)  
                              if less(s1,ss) or like(s1,ss) then
                                        h=0                
                                                        
                              end if                 
                    next h                
          next b                
                          
                          
                          
          print #2,string(len(ss)+16,"-")
                          
          ss2=getforp(ss2+".")
          print #2,"=~"+ss2
                          
          close #1                
          close #2                
end sub                
                
                
                
sub cubicroot(filein as string,fileout as string,x as integer,y as integer)
          dim ry as integer
          dim carryc as integer
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim f as integer
          dim ff as integer
          dim ass as string
          dim ee as integer
          dim b as integer
          dim d as integer
          dim l as string="0"
          dim ll as string="0"
          dim s as string
          dim ss as string
          dim sss as string
          dim nn as integer
          dim ssss as string
          dim ssss1 as string
          dim ss2 as string
          dim jjj as string
          dim h as integer
          dim lll as integer
          dim j1 as string
          open filein for input as #1
          open fileout for output as #2
          line input #1,ss
                          
          ss=trim(ss)
          ss=zerott("0"+ss)  
          print #2,ss
          ss=strints(ss)
          print #2,ss
          nn=len(ss)\3+3
                          
          ss2=string(nn,"0")
                          
                          
                          
                          
          for b=1 to nn
                    lll=blocks(b,nn)
                    percentbar x,y,lll
                    for h=9 to 0 step -1
                                              
                              ss2=mid(ss2,1,b-1)+(chr(asc("0")+h))+mid(ss2,b+1,nn-b+1)
                              s1=strmult(ss2,ss2,ee)
                              s1=strmult(s1,ss2,ee)
                              s1=zerott("0"+s1)  
                              if less(s1,ss) or like(s1,ss) then
                                        h=0                
                                                        
                              end if                 
                    next h                
          next b                
                          
                          
                          
          print #2,string(len(ss)+16,"-")
                          
          ss2=getforp(ss2+".")
          print #2,"=~"+ss2
                          
          close #1                
          close #2                
end sub                
                
                
sub rootd4(filein as string,fileout as string,x as integer,y as integer)
          dim ry as integer
          dim carryc as integer
          dim s1 as string
          dim s2 as string
          dim a as integer
          dim n as integer
          dim c as integer
          dim f as integer
          dim ff as integer
          dim ass as string
          dim ee as integer
          dim b as integer
          dim d as integer
          dim l as string="0"
          dim ll as string="0"
          dim s as string
          dim ss as string
          dim sss as string
          dim nn as integer
          dim ssss as string
          dim ssss1 as string
          dim ss2 as string
          dim jjj as string
          dim h as integer
          dim lll as integer
          dim j1 as string
          open filein for input as #1
          open fileout for output as #2
          line input #1,ss
                          
          ss=trim(ss)
          ss=zerott("0"+ss)  
          print #2,ss
          ss=strints(ss)
          print #2,ss
          nn=len(ss)\4+4
                          
          ss2=string(nn,"0")
                          
                          
                          
                          
          for b=1 to nn
                    lll=blocks(b,nn)
                    percentbar x,y,lll
                    for h=9 to 0 step -1
                                              
                              ss2=mid(ss2,1,b-1)+(chr(asc("0")+h))+mid(ss2,b+1,nn-b+1)
                              s1=strmult(ss2,ss2,ee)
                              s1=strmult(s1,ss2,ee)
                              s1=strmult(s1,ss2,ee)
                              s1=zerott("0"+s1)  
                              if less(s1,ss) or like(s1,ss) then
                                        h=0                
                                                        
                              end if                 
                    next h                
          next b                
                          
                          
                          
          print #2,string(len(ss)+16,"-")
                          
          ss2=getforp(ss2+".")
          print #2,"=~"+ss2
                          
          close #1                
          close #2                
end sub                
                
dim s1 as string=  "input.txt"
dim s2 as string  ="report.txt"
dim ee as integer=32000
dim r as string
dim carry as string="0"
dim a as integer
dim b as integer
                
                
color 1,15
cls      
                
rootd4 s1,s2,1,1
                
