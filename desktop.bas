const true as boolean=-1
const false as boolean=0
const TitleBarSize as integer=16
const maxWin as integer=10
type windows
          x as integer
          y as integer
          w as integer
          h as integer
          images As Any Ptr
          index as integer
          id as integer
          title as string
          titlebar as boolean
end type                
                
type wwin
          win(0 to maxWin) as windows
          count as integer
          wins(0 to maxWin) as integer
end type                
                
type clock
          x as integer
          y as integer
          r as integer
          h as integer
          m as integer
          s as integer
end type                
                
                
sub drawclock(c as clock,ww  As Any Ptr)
          dim pi as double= 3.1415927
          dim xx1 as double
          dim yy1 as double
          dim xx3 as double
          dim yy3 as double
          dim xx2 as double
          dim yy2 as double
          dim x as integer
          dim y as integer
          dim xxx as integer
                          
                          
          circle ww,(c.x+c.r,c.y+c.r),c.r,rgb(128,128,128),,,1.0,f
                          
          for xxx=1 to 12
                    xx2=xxx                
                    xx3=c.r                
                    xx1=xx3+(xx3*0.8)*sin(xx2/6*pi)
                                    
                    yy1=xx3-(xx3*0.8)*cos(xx2/6*pi)
                    x=xx1                
                    y=yy1                
                    draw string ww,(c.x+x,c.y+y),ltrim$(str$(xxx)),rgb(0,128,255)
          next xxx                
                          
                          
          xx2=c.s                
          xx3=c.r                
          xx1=xx3+(xx3*0.8)*sin(xx2/30*pi)
                          
          yy1=xx3-(xx3*0.8)*cos(xx2/30*pi)
          x=xx1                
          y=yy1                
          line ww,(c.x+c.r,c.y+c.r)-(c.x+x,c.y+y),rgb(255,255,255)
          xx2=c.m                
          xx1=xx3+(xx3*0.5)*sin(xx2/30*pi)
                          
          yy1=xx3-(xx3*0.5)*cos(xx2/30*pi)
          x=xx1                
          y=yy1                
          line ww,(c.x+c.r,c.y+c.r)-(c.x+x,c.y+y),rgb(0,0,255)
          xx2=c.h                
          if xx2 > 12.0 then xx2=xx2-12.0
          xx1=xx3+(xx3*0.2)*sin(xx2/6*pi)
                          
          yy1=xx3-(xx3*0.2)*cos(xx2/6*pi)
          x=xx1                
          y=yy1                
          line ww,(c.x+c.r,c.y+c.r)-(c.x+x,c.y+y),rgb(0,0,0)
                          
                          
end sub                
                
sub moveToFront(w as wwin,i as integer)
          dim a as integer
          dim b as integer
          dim c as integer
          b=w.wins(i)
          for a =i to w.count-2
                    c=w.wins(a+1)
                    w.wins(a)=c
          next a                
          w.wins(w.count-1)=b
                          
end sub                
                
                
sub closeG(w as wwin)
          dim a as integer
          for a=0 to maxWin-1
                    ImageDestroy w.win(a).images
          next                
end sub                
                
sub drawWindows(byref w as wwin)
          dim a as integer
          ScreenSync
          ScreenLock
          for a= 0 to w.count-1
                    if w.win(a).titlebar then
                              put (w.win(w.wins(a)).x,w.win(w.wins(a)).y),w.win(w.wins(a)).images,trans
                              else                
                              put (w.win(w.wins(a)).x,w.win(w.wins(a)).y),w.win(w.wins(a)).images,pset
                    end if                
          next a                
          ScreenUnlock
                          
                          
end sub                
                
sub drawClsWindow(w as wwin,i as integer)
          line w.win(i).images,(0,TitleBarSize+1)-(w.win(i).w,w.win(i).h),rgb(255,255,255),bf
          line w.win(i).images,(0,TitleBarSize)-(w.win(i).w-1,w.win(i).h-1),rgb(0,0,0),b
end sub                 
                
sub drawTitleBar(byref w as wwin,i as integer)
                          
          circle w.win(i).images,(TitleBarSize/2,TitleBarSize/2),TitleBarSize/2,rgb(0,128,255),,,1.0,f
          circle w.win(i).images,(w.win(i).w-TitleBarSize/2,TitleBarSize/2),TitleBarSize/2,rgb(0,128,255),,,1.0,f
          circle w.win(i).images,(TitleBarSize/2,TitleBarSize/2),TitleBarSize/2,rgb(0,0,0)
          circle w.win(i).images,(w.win(i).w-TitleBarSize/2,TitleBarSize/2),TitleBarSize/2,rgb(0,0,0)
          line w.win(i).images,(TitleBarSize/2,0)-(w.win(i).w-TitleBarSize/2,TitleBarSize),rgb(0,128,255),bf
          Draw String w.win(i).images,(TitleBarSize/2+8, 4), w.win(i).title,rgb(255,255,255)
          line w.win(i).images,(0,TitleBarSize)-(w.win(i).w,TitleBarSize),rgb(0,0,0)
          line w.win(i).images,(TitleBarSize/2,0)-(w.win(i).w-TitleBarSize/2,0),rgb(0,0,0)
end sub                
                
function clickons(w as wwin,x as integer,y as integer) as integer
          dim a as integer
          dim b as integer
          dim c as integer=-1
          for a=w.count-1 to 1 step -1
                    if x> w.win(w.wins(a)).x and x<w.win(w.wins(a)).x+w.win(w.wins(a)).w and y>w.win(w.wins(a)).y and y<w.win(w.wins(a)).y+w.win(w.wins(a)).h then
                              c=a                
                              a=0                
                    end if                
          next a                
          return c                
end function
                
                
function creatWindows(byref w as wwin,xx as integer,yy as integer, ww as integer ,hh as integer, ccolors as ulong,title as string,tbar as boolean) as integer
          dim r as integer=-1
          if w.count < maxwin -1 then
                    w.count=w.count+1
                    if tbar then
                              w.win(w.count-1).images=ImageCreate( ww,hh)
                              else                
                              w.win(w.count-1).images=ImageCreate( ww,hh,ccolors,16 )
                    end if                
                                    
                    'line w.win(w.count-1).images,(0,0)-(ww-1,hh-1),rgb(0,0,0),b
                    w.win(w.count-1).x=xx
                    w.win(w.count-1).y=yy
                    w.win(w.count-1).w=ww
                    w.win(w.count-1).h=hh
                    w.win(w.count-1).title=title
                    w.win(w.count-1).titlebar=tbar
                    w.wins(w.count-1)=w.count-1
                    if tbar then 
                              drawTitleBar w,w.count-1
                              drawClsWindow w,w.count-1
                              line w.win(w.count-1).images,(0,TitleBarSize)-(ww-1,hh-1),rgb(0,0,0),b
                    end if                
                    r=w.count-1
          end if                
          return r                
end function
                
                
#include "vbcompat.bi"
Dim a As Double, b As Double
dim win as wwin
dim x as integer
dim y as integer
dim i as integer
dim w as integer
dim h as integer
dim ii as integer
dim y12 as integer
dim b12 as integer
dim x12 as integer
dim y11 as integer
dim i12 as integer
dim w12 as integer
dim h12 as integer
                
dim y1 as integer
dim b1 as integer
                
dim cc as clock
dim bb as integer
dim x1 as integer
w=640                
h=480                
                
                
'' Create a graphics screen.
ScreenRes w, h, 16
                
dim s as string
s = "im love marina"
'Set the window title
WindowTitle s
                
                
win.count=0
w12=w                
h12=h                
                
i=creatWindows(win,0,0,w,h,rgb(255,255,255),s,false)
                
for y12= 0 to h12 step 8
          line win.win(i).images,(0,y12)-(w12,y12),rgb(0,0,255)
next y12                
for x12= 0 to w12 step 8
          line win.win(i).images,(x12,0)-(x12,h12),rgb(0,0,255)
next x12                
                
for y12= 0 to h step 8
          Draw String win.win(i).images,(y12, y12), s,rgb(0,0,255)
next y12                
                
                
i=creatWindows(win,20,20,160,80,rgb(255,255,255),"month",true)
i=creatWindows(win,40,40,160,80,rgb(255,255,255),"day",true)
i=creatWindows(win,60,60,160,80,rgb(255,255,255),"year",true)
i=creatWindows(win,80,80,160,80,rgb(255,255,255),"hour",true)
i=creatWindows(win,100,100,160,80,rgb(255,255,255),"minuts",true)
i=creatWindows(win,120,120,160,80,rgb(255,255,255),"seconds",true)
i=creatWindows(win,140,140,160,200,rgb(255,255,255),"clock",true)
                
cc.x=5                
cc.y=TitleBarSize+5
cc.r=75                
                
do                
          for ii=1 to win.count-1
                    drawClsWindow win,ii
          next ii                
                          
                          
                          
          a = Now                
          cc.h=Hour(a)
          cc.m=minute(a)
          cc.s=second(a)
                          
          drawclock cc,win.win(7).images
                          
          Draw String win.win(1).images,(4,TitleBarSize +8 ),str$(month(a)),rgb(0,0,255)
          Draw String win.win(2).images,(4,TitleBarSize +8 ),str$(day(a)),rgb(0,0,255)
          Draw String win.win(3).images,(4,TitleBarSize +8 ),str$(year(a)),rgb(0,0,255)
                          
          Draw String win.win(4).images,(4,TitleBarSize +8 ),str$(Hour(a)),rgb(0,0,255)
          Draw String win.win(5).images,(4,TitleBarSize +8 ),str$(minute(a)),rgb(0,0,255)
          Draw String win.win(6).images,(4,TitleBarSize +8 ),str$(second(a)),rgb(0,0,255)
                          
                          
          drawWindows win
                          
          sleep 1                
          GetMouse(x1,y1,,b1)
          if b1<> 0 then
                    b1=clickons (win,x1,y1)
                    if b1<> -1 then
                              moveToFront(win,b1)
                    end if                
          end if                 
loop until inkey$<>""
                
                
                
                
                
                
closeG win
                
                
cls                
