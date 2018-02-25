const maxxxx=10
const screenw=640
const screenh=480

type objc
x as integer
y as integer
z as integer
r as integer
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
declare function creatobj(c as conj,x as integer,y as integer,z as integer, pic as integer)as integer





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
line(0,0)-(screenw,screenh),15,bf
draw string (10,10),"loading...",1
c.cene=ImageCreate(screenw,screenh )
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
dim t as integer=0
dim yyy as integer=screenh
dim y as integer=0
dim xxxx as integer=0
dim x as integer=0
dim yy as integer=0
dim xxx as integer=0
dim x1 as integer
dim y1 as integer
dim z as integer
dim y2 as integer

put (0,0),c.cene,pset
for n=0 to c.o -1
xxxx=c.objcts(n).x
t=screenh-c.objcts(n).z
inverter yyy,t,y
defineX xxxx,maxxxx,screenw,screenh,255,t*188/354,2,xxx
mult screenh,255,t*188/354,2,yy
y=y-(c.objcts(n).y*c.objcts(n).r*yy)
x1=xxx-c.objcts(n).r*yy
y1=y-c.objcts(n).r*yy
put (x1,y1), c.pics(c.objcts(n).pic).pic,trans
next n
end sub

function creatobj(c as conj,x as integer,y as integer,z as integer, pic as integer)as integer
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

