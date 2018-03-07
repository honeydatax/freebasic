const maxstack as integer =1024
                
type stack
          mem (0 to maxstack) as integer
          sp as integer
end type                
                
function pushStack (byref s as stack,value as integer)as integer
          dim a as integer=-1
          if maxstack > s.sp then
                    s.sp=s.sp+1
                    s.mem(s.sp-1)=value
                    a=s.sp-1                
          end if                
          return a                
end function
                
                
function popStack(byref s as stack) as integer
          dim a as integer=-1
          if s.sp>0 then
                    s.sp=s.sp-1
                    a=s.mem(s.sp)
          end if                
          return a                
end function
                
                
dim s as stack
dim a as integer
                
randomize ,1
randomize int(rnd*32000),1
                
color 1,15
cls                
locate 1,1
                
for a=0 to 12
          pushStack s,int(rnd*49)+1
next a                
                
for a=0 to 12
          print popStack (s)
next a                
