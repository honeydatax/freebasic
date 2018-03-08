' compile fbc -o bgi.o bgi.bas
                
On Error Goto errhandler
                
                
#INCLUDE "gdilib.bi"
goto errorEscape
errhandler:
                
'Resume Next
system                
errorEscape:
                
                
                
Dim a As Double, b As Double
dim win as wwin
dim x as integer
dim y as integer
dim i as integer
                
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
                
                
'' Create a graphics screen.
startX                
                
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
                
                
cprint "im love marina"
