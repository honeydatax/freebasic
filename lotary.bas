'fbc rand.bas
const maxcount as integer=9
type aa
dim a(0 to maxcount) as long
end type

dim a as aa

'randing(bb) bb the number of digits
function randing(bb as byte) as long
dim a as long
dim b as string=""
for a=0 to bb
b=b+trim$(str$(int(Rnd*9.6)))
next a
a=val(b)
return a
end function


sub order(byref a as aa,counts as integer)
dim b as integer
dim c as integer
dim e as integer
for b=0 to counts
for c=0 to b
if a.a(b)<a.a(c) then
e=a.a(c)
a.a(c)=a.a(b)
a.a(b)=e
end if
next c
next b
end sub

sub lists(byref a as aa, x as integer, y as integer,c as integer)
dim b as integer
for b= 0 to c
locate b+1+y,x
print a.a(b)
next b
end sub

sub genarator(byref a as aa,c as integer)
For i as integer = 0 to c
a.a(i)= randing(8)
next i
end sub

randomize
randomize int(Rnd*32000)+1,1
dim x as long
color 1,15
cls

genarator a,maxcount


lists a,1,1,maxcount


order a,maxcount


lists a,39,1,maxcount