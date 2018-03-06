const maxstack as integer =1024
const maxnode as integer= 1024

type stack
mem (0 to maxstack) as integer
sp as integer
end type

type node
s as string 
n as long
child as integer
nexter as integer
end type

type tree
n (0 to maxnode) as node
index as integer
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


function addNode (byref t as tree,s as string,l as long,n as integer)as integer
dim a as integer=-1
if maxnode>t.index then
t.index=t.index+1
t.n(n).nexter=t.index-1
t.n(t.index-1).s=s
t.n(t.index-1).n=n
t.n(t.index-1).child=-1
t.n(t.index-1).nexter=-1

a=t.index-1
end if
return a
end function

function addChild(byref t as tree,s as string,l as long,n as integer)as integer
dim a as integer=-1
if maxnode>t.index then
t.index=t.index+1
t.n(n).child=t.index-1
t.n(t.index-1).s=s
t.n(t.index-1).n=n
t.n(t.index-1).child=-1
t.n(t.index-1).nexter=-1

a=t.index-1
end if
return a
end function



sub printTree(byref t as tree)
dim a as integer=0
dim tt as integer
dim b as integer
dim s as stack
dim n as integer
if t.index>0 then
n=0
do
print space(a);
print t.n(n).s
if t.n(n).nexter<0 and t.n(n).child<0 and a =0 then exit do
if t.n(n).child >-1 then
pushStack s,n
n=t.n(n).child
a=a+1
else
if t.n(n).nexter >-1 then
n=t.n(n).nexter
else
if a>0 then
printTreeagain:
a=a-1
n=popStack (s)
n=t.n(n).nexter
if a>0 and n=-1 then goto printTreeagain
else
n=t.n(n).nexter
end if
end if
end if
if n=-1 then exit do
loop
end if
end sub

dim s as stack
dim a as integer
dim t as tree
dim n as integer
dim b as integer
dim nn as integer
dim n1 as integer
dim c as integer

randomize ,1
randomize int(rnd*32000),1

color 1,15
cls
locate 1,1

n=0
for a=0 to 1
n= addNode (t,"node "+str$(a),0,n)
for b=0 to 1
if b=0 then 
nn= addChild (t,"node "+chr$(65+b),0,n)
else
nn= addNode (t,"node "+chr$(65+b),0,nn)
end if
for c=0 to 1
if c=0 then 
n1= addChild (t,"node "+chr$(&h61+c),0,nn)
else
n1= addNode (t,"node "+chr$(&h61+c),0,n1)
end if

next c
next b
next a

printTree t
