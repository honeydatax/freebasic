declare sub mult(byref max as integer,byval maxi as integer,byval y as integer, byval muls as integer,byref r as integer)
declare sub inverter (byval max as integer,byref n as integer,byref y as integer)
screen 12
                
                
dim s as string ="im love marina"
dim x as integer
dim y as integer
dim w as integer=640
dim h as integer=480
dim xx as integer
dim yy as integer=0
dim r as integer=0
                
                
line (0,0)-(640,480),15,bf
x=w/2                
y=0                
                
                
line(0,h)-(x,0),1
                
line(w,h)-(x,0),1
                
                
x=0                
line(640/2,0)-(640/2,480),1
for r=0 to 480 step 480/10
                          
          inverter yy,r,y
          mult 480,255,r*188/354,2,yy
          circle (w/2,r),yy,1
                          
next r                
                
                
                
sleep                
                
                
                
                
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
          a=max                
          c=maxi                
          b=a*100/c
          d=y                
          b=b*d/960
                          
                          
          r=b                
                          
end sub                 
                
                
                
