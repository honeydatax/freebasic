                
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
dim tt as double=0.5
dim ttt as double
dim d1 as integer
dim xx as integer
dim yy as integer
dim yyy as integer
dim xxx as integer
dim tx as integer
dim ty as integer
dim rr as integer
                
screenres 320,240,16
color rgb(0,0,0),rgb(255,255,255)
cls                
                
print "loading"
for n=0 to 7
          mmap(n)= ImageCreate(16,16 )
          bload "mov"+chr(asc("a")+n)+".bmp",mmap(n)
next n                
                
                
                
                
x=320/2                
y=240/2                
h=0                
d1=0                
xx=x                
yy=y                
do           
          t=timer                
          screenlock
          color rgb(0,0,0),rgb(0,0,255)
          cls                
          circle (x,y),rr,rgb(0,0,0)
          put (xx-8,yy-8),mmap(d1+4),and
                          
          put (xx-8,yy-8),mmap(d1),xor
          screenunlock
                          
          x1=x                
          y1=y                
          do          
                    z=inkey$()
                    if z=chr(27) then exit do
                    a= getmouse (tx,ty, ,bt)
                    if bt<>0 then
                              rr=1                
                              x=tx                
                              y=ty                
                    end if                
                    if not(x > xx-16 and x < xx-16 and y > yy-16 and y < yy+16) then
                                              
                              ttt=abs(timer-t)
                              if ttt>tt then
                                        if x>xx and abs(x-xx)>5 then
                                                  xx=xx+3             
                                                  d1=0                
                                        end if                
                                        if x<xx and abs(x-xx)>5 then
                                                  xx=xx-3                
                                                  d1=2                
                                        end if                
                                        if y>yy and abs(y-yy)>5 then
                                                  yy=yy+3                
                                                  d1=1                
                                        end if                
                                        if y<yy and abs(y-yy)>5 then
                                                  yy=yy-3                
                                                  d1=3                
                                        end if                
                                                        
                                        rr=rr+6                
                                        if rr>50 then rr=1
                                        exit do                
                              end if            
                              else                
                              rr=1                    
                    end if                
                                    
                                    
                                    
                                    
                                    
                                    
          loop                
                          
                          
          '_-------------------------------------------
          'if esc key press exit application
          if z=chr$(27) then exit do
                          
                          
                          
                          
loop                
                
cls                
