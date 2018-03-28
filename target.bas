                
dim shared sene as any ptr
dim shared cruss0 as any ptr
dim shared cruss1 as any ptr
dim shared mmap(0 to 10) as any ptr
dim a as integer
dim n as integer
dim c as long
dim x as integer
dim y as integer
dim bt as integer
dim x1 as integer
dim y1 as integer
dim z as string
dim h as integer
dim t as double
dim tt as double=0.2
dim ttt as double
                
screenres 320,240,16
color rgb(0,0,0),rgb(255,255,255)
cls                
                
print "loading"
for n=0 to 8
          mmap(n)= ImageCreate(16,16 )
          bload "cur0"+trim(str(n))+".bmp",mmap(n)
next n                
                
sene=ImageCreate(320,240,rgb(255,255,255))
for a=100 to 15 step  -15
                          
          if a=int(a/2)*2 then 
                    circle sene, (320/2,240/2),a,rgb(255,0,0),,,1.0,f
                    else                 
                    circle sene,(320/2,240/2),a,rgb(255,255,255),,,1.0,f
          end if                
next a                
                
                
                
x=320/2                
y=240/2                
h=0                
setmouse x,y,0
                
do                
          screenlock
          put (0,0),sene,pset
          put (x-8,y-8),mmap(8),and
          if h>7 then h=0
          put (x-8,y-8),mmap(h),xor
          screenunlock
          t=timer                
          x1=x                
          y1=y                
          do          
                    z=inkey$()
                    if z=chr(27) then exit do
                    a= getmouse (x,y, ,bt)
                    if x <> x1 or y <> y1 then exit do
                    if x > 320/2-25 and x < 320/2+25 and y > 240/2-25 and y < 240/2+25 then
                                              
                              ttt=abs(timer-t)
                              if ttt>tt then
                                        h=h+1                
                                        exit do                
                              end if                
                              else                
                              h=0                
                    end if                
                                    
                                    
                    y1=y                
                    x1=x                
                                    
          loop                
                          
                          
          '_-------------------------------------------
          'if esc key press exit application
          if z=chr$(27) then exit do
                          
                          
                          
                          
loop                
                
cls                
