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
end type

type wwin
win(0 to maxWin) as windows
count as integer
end type


sub drawWindows(byref w as wwin)
dim a as integer

for a= 0 to w.count-1
put (w.win(a).x,w.win(a).y),w.win(a).images,pset
next a
end sub


function creatWindows(byref w as wwin,xx as integer,yy as integer, ww as integer ,hh as integer, ccolors as ulong) as integer
dim r as integer=-1
if w.count < maxwin -1 then
w.count=w.count+1
w.win(w.count-1).images=ImageCreate( ww,hh,ccolors,16 )
line w.win(w.count-1).images,(0,0)-(ww-1,hh-1),rgb(0,0,0),b
w.win(w.count-1).x=xx
w.win(w.count-1).y=yy
r=w.count-1
end if
return r
end function



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


i=creatWindows(win,0,0,w,h,rgb(0,128,255))


for ii= 0 to maxWin-1
i=creatWindows(win,ii*w/maxWin,ii*h/maxWin,w/maxWin,h/maxWin,rgb(255,255,255))
if i>0 then

Draw String win.win(i).images,(0, 0), s,rgb(0,0,255)
else
end if
next ii

drawWindows(win)










Sleep
cls