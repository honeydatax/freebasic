const maxobjc=32
const maxpics=100
                
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
declare sub drawScreens(pic as any ptr)
declare sub defineX(byval x as integer,byval n as integer,byval maxx as integer,byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
declare sub mult(byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
declare sub inverter (byval max as integer,byref n as integer,byref y as integer)
declare function creatpics(c as conj,w as integer , h as integer)as integer
declare sub drawobj(c as conj)
declare function creatobj(c as conj,x as integer,y as integer, pic as integer)as integer
                
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
                
drawscreens c.cene
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
                
sub drawScreens(pic as any ptr)
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
                
