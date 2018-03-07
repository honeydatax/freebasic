declare sub centerString(byref w as integer, byref h as integer,byref x as integer,byref y as integer,byref size as integer)
declare sub inverter (byval max as integer,byref n as integer,byref y as integer)
screen 12
                
                
dim s as string ="im love marina"
dim x as integer
dim y as integer
dim w as integer=640
dim h as integer=480
dim xx as integer
dim yy as integer=h/16-1
dim r as integer=0
                
                
line (0,0)-(640,480),15,bf
x=w/2                
y=0                
                
                
line(0,h)-(x,0),1
                
line(w,h)-(x,0),1
                
                
x=0                
line(640/2,0)-(640/2,480),1
for r=0 to h/16-1
                          
          inverter yy,r,y
          y=y*16                
          circle (w/2,y),5,1,,,1.0,f
                          
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
