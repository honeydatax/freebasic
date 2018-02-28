const maxobjc=32
const maxpics=100

declare sub event_drawScreens(pic as any ptr)
#include "x.bi"



dim aa as integer=0
dim c as conj
dim s as string ="..."
dim x as integer
dim y as integer
dim w as integer=screenw
dim h as integer=screenh
dim xx as integer
dim yy as integer=0
dim yyy as integer=screenh
dim yy2 as integer=0
dim r2 as integer=0
dim r as integer=0
dim xxx as integer=0
dim xxxx as integer=0
dim tpict as integer
dim t as integer
dim y2 as integer
startx c


for r2=screenh to 0 step -8

mult screenh,255,r2*188/354,2,yy2
tpict=creatpics( c,yy2*2,yy2*2)
circle c.pics(tpict).pic,(yy2,yy2),yy2,1,,,1.0,f
circle c.pics(tpict).pic,(yy2,yy2),yy2*8/10,15,,,1.0,f

next r2

r2=creatobj(c,1,1,400,0)
r2=creatobj(c,2,2,380,0)
r2=creatobj(c,3,3,340,0)
r2=creatobj(c,4,4,320,0)

c.objcts(0).r=1
c.objcts(1).r=1
c.objcts(2).r=1
c.objcts(3).r=1


s=inkey$()
do
for r=0 to 3
c.objcts(r).z=c.objcts(r).z-8

if c.objcts(r).z<0 then
 c.objcts(r).z=480
c.objcts(r).x=c.objcts(r).x+1
moveToBack c,r
end if 

if c.objcts(r).x>10 then
c.objcts(r).x=0
c.objcts(r).y=c.objcts(r).y+1
end if

if c.objcts(r).y>10 then
c.objcts(r).y=0
end if


c.objcts(r).pic=c.objcts(r).z/8
next r
ScreenSync
  ScreenLock
drawobj c
ScreenUnlock
if inkey$=chr$(27)then goto exitdo

sleep 1



loop until inkey$=chr$(27)


exitdo:
endx c

sub event_drawScreens(pic as any ptr)
dim x as integer
dim y as integer
dim w as integer=screenw
dim h as integer=screenh
dim xx as integer
dim yy as integer=0
dim r as integer=0




line pic,(0,0)-(screenw,screenh),6,bf
x=w/2
y=0


line pic,(0,h)-(x,0),1

line pic,(w,h)-(x,0),1
paint pic,(screenw/2,400),9,1


x=0
line(screenw/2,0)-(screenw/2,screenh),15
end sub
