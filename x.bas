const maxobjc=32
const maxpics=100
declare sub event_drawScreens(pic as any ptr)
#include "x.bi"



dim aa as integer=0
dim c as conj
dim s as string ="..."
dim x as integer
dim y as integer
dim w as integer=640
dim h as integer=480
dim xx as integer
dim yy as integer=0
dim yyy as integer=480
dim r as integer=0
dim xxx as integer=0
dim xxxx as integer=0
dim tpict as integer
dim t as integer
startx c


for r=480 to 0 step -8
inverter yyy,r,y
defineX xxxx,10,640,480,255,r*188/354,2,xxx
mult 480,255,r*188/354,2,yy
tpict=creatpics( c,yy*2,yy*2)
circle c.pics(tpict).pic,(yy,yy),yy,15,,,1.0,f
next r

r=creatobj(c,0,0,0)

s=inkey$()
do
x=0

for r=0 to 58
ScreenSync
  ScreenLock
t=480-r*8
inverter yyy,t,y
defineX xxxx,10,640,480,255,t*188/354,2,xxx
mult 480,255,t*188/354,2,yy
c.objcts(0).x=xxx-yy
c.objcts(0).y=y-yy
c.objcts(0).pic=r
drawobj c
ScreenUnlock
if inkey$=chr$(27)then goto exitdo

sleep 1

next r
xxxx=xxxx+1
if xxxx>10 then xxxx=0
loop until inkey$=chr$(27)


exitdo:
endx c

sub event_drawScreens(pic as any ptr)
dim x as integer
dim y as integer
dim w as integer=640
dim h as integer=480
dim xx as integer
dim yy as integer=0
dim r as integer=0




line pic,(0,0)-(640,480),6,bf
x=w/2
y=0


line pic,(0,h)-(x,0),1

line pic,(w,h)-(x,0),1
paint pic,(640/2,400),9,1


x=0
line(640/2,0)-(640/2,480),15
end sub
