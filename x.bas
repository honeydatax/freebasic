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
dim r as integer=0
dim xxx as integer=0
dim xxxx as integer=0
dim tpict as integer
dim t as integer
dim y2 as integer
startx c



for r=screenh to 0 step -8

mult screenh,255,r*188/354,2,yy
tpict=creatpics( c,yy*2,yy*2)
circle c.pics(tpict).pic,(yy,yy),yy,15,,,1.0,f
next r

r=creatobj(c,0,0,0,0)

s=inkey$()
do
x=0
c.objcts(0).r=1
for y2=0 to 10
for xxxx=0 to 10
for r=0 to 58

t=r*8
c.objcts(0).x=xxxx
c.objcts(0).z=t
c.objcts(0).y=y2

c.objcts(0).pic=r
ScreenSync
  ScreenLock
drawobj c
ScreenUnlock
if inkey$=chr$(27)then goto exitdo

sleep 1

next r
next xxxx
next y2
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
