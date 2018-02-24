

type objc
x as integer
y as integer
pic as integer
end type

type pics
pic as any ptr
end type


type conj
objcts (0 to maxobjc)as objc
pics(0 to maxpics) as pics
cene as any ptr
o as integer
p as integer
end type


declare sub endx(c as conj)
declare sub startx(c as conj)

declare sub defineX(byval x as integer,byval n as integer,byval maxx as integer,byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
declare sub mult(byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
declare sub inverter (byval max as integer,byref n as integer,byref y as integer)
declare function creatpics(c as conj,w as integer , h as integer)as integer
declare sub drawobj(c as conj)
declare function creatobj(c as conj,x as integer,y as integer, pic as integer)as integer





sub inverter (byval max as integer,byref n as integer,byref y as integer)
dim a as integer
dim b as integer
dim c as integer
dim d as integer
a=max-n
y=a
end sub


sub mult(byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
dim a as long
dim b as long
dim c as long
dim d as long
dim e as long
a=max
c=maxi
e=y
b=a*100/c
d=c-y
b=b*d/960


r=b

end sub 



sub defineX(byval x as integer,byval n as integer,byval maxx as integer,byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
dim a as integer
dim b as integer
dim c as integer
dim d as integer

b=n/2
mult max,maxi,y,muls,a
c=a*b
c=maxx/2-c
d=a*x+c


r=d
end sub

sub startx(c as conj)
screen 12
line(0,0)-(640,480),15,bf
draw string (10,10),"loading...",1
c.cene=ImageCreate(640,480 )
event_drawscreens c.cene
end sub


sub endx(c as conj)
dim n as integer
ImageDestroy c.cene
for n=0 to c.p -1
ImageDestroy c.pics(n).pic
next n

end sub

function creatpics(c as conj,w as integer , h as integer)as integer
dim a as integer = -1
if c.p<maxpics then
c.p=c.p+1
c.pics(c.p-1).pic=ImageCreate( w,h,0 )
a=c.p-1

end if
return a
end function

sub drawobj(c as conj)
dim n as integer

put (0,0),c.cene,pset
for n=0 to c.o -1
put (c.objcts(n).x,c.objcts(n).y), c.pics(c.objcts(n).pic).pic,trans
next n
end sub

function creatobj(c as conj,x as integer,y as integer, pic as integer)as integer
dim a as integer = -1
if c.o<maxobjc then
c.o=c.o+1
c.objcts(c.o-1).x=x
c.objcts(c.o-1).y=y
c.objcts(c.o-1).pic=pic
a=c.o
end if
return a

end function

