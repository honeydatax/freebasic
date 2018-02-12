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
end type


sub drawWindows(byref w as wwin)
dim a as integer
ScreenSync
  ScreenLock
for a= 0 to w.count-1
put (w.win(a).x,w.win(a).y),w.win(a).images,pset
next a
ScreenUnlock


end sub

sub drawClsWindow(w as wwin,i as integer)
line w.win(i).images,(0,TitleBarSize+1)-(w.win(i).w,w.win(i).h),rgb(255,255,255),bf
line w.win(i).images,(0,0)-(w.win(i).w-1,w.win(i).h-1),rgb(0,0,0),b
end sub 

sub drawTitleBar(byref w as wwin,i as integer)
line w.win(i).images,(0,0)-(w.win(i).w,TitleBarSize),rgb(0,0,255),bf
Draw String w.win(i).images,(4, 4), w.win(i).title,rgb(255,255,255)
line w.win(i).images,(0,0)-(w.win(i).w,TitleBarSize),rgb(0,0,0),b
end sub

function creatWindows(byref w as wwin,xx as integer,yy as integer, ww as integer ,hh as integer, ccolors as ulong,title as string,tbar as boolean) as integer
dim r as integer=-1
if w.count < maxwin -1 then
w.count=w.count+1
w.win(w.count-1).images=ImageCreate( ww,hh,ccolors,16 )
line w.win(w.count-1).images,(0,0)-(ww-1,hh-1),rgb(0,0,0),b
w.win(w.count-1).x=xx
w.win(w.count-1).y=yy
w.win(w.count-1).w=ww
w.win(w.count-1).h=hh
w.win(w.count-1).title=title
w.win(w.count-1).titlebar=tbar
if tbar then drawTitleBar w,w.count-1
line w.win(w.count-1).images,(0,0)-(ww-1,hh-1),rgb(0,0,0),b
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
w=640
h=480


'' Create a graphics screen.
ScreenRes w, h, 16
 
dim s as string
s = "im love marina"
'Set the window title
WindowTitle s


win.count=0


i=creatWindows(win,0,0,w,h,rgb(0,128,255),s,false)


i=creatWindows(win,20,20,160,80,rgb(255,255,255),"month",true)
i=creatWindows(win,40,40,160,80,rgb(255,255,255),"day",true)
i=creatWindows(win,60,60,160,80,rgb(255,255,255),"year",true)
i=creatWindows(win,80,80,160,80,rgb(255,255,255),"hour",true)
i=creatWindows(win,100,100,160,80,rgb(255,255,255),"minuts",true)
i=creatWindows(win,120,120,160,80,rgb(255,255,255),"seconds",true)


do
for ii=1 to win.count-1
 drawClsWindow win,ii
next ii

a = Now
Draw String win.win(1).images,(4,TitleBarSize +8 ),str$(month(a)),rgb(0,0,255)
Draw String win.win(2).images,(4,TitleBarSize +8 ),str$(day(a)),rgb(0,0,255)
Draw String win.win(3).images,(4,TitleBarSize +8 ),str$(year(a)),rgb(0,0,255)

Draw String win.win(4).images,(4,TitleBarSize +8 ),str$(Hour(a)),rgb(0,0,255)
Draw String win.win(5).images,(4,TitleBarSize +8 ),str$(minute(a)),rgb(0,0,255)
Draw String win.win(6).images,(4,TitleBarSize +8 ),str$(second(a)),rgb(0,0,255)


drawWindows win
sleep 100

loop until inkey$<>""









cls