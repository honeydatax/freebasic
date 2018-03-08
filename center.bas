dim x as integer=0
dim y as integer=0
dim x1 as integer=0
dim y1 as integer=0
dim w as integer=640
dim h as integer=480
                
declare sub center(byref w as integer,byref h as integer,byref x as integer,byref y as integer,byref x1 as integer,byref y1 as integer)
                
screen 12
                
line (x,y)-(w,h),15,bf
x=w/2                
y=h/2                
center w,h,x,y,x1,y1
line (x,y)-(x1,y1),0,b
line(0,0)-(x,y),0
line(x1,y1)-(w,h),0
line(0,h)-(x,y1),0
line(x1,y)-(w,0),0
                
                
sleep                
                
                
sub center(byref w as integer,byref h as integer,byref x as integer,byref y as integer,byref x1 as integer,byref y1 as integer)
          dim a as integer
          dim b as integer
          dim c as integer
          dim d as integer
                          
          a=(w-x)/2
          b=(h-y)/2
                          
          x1=a+x                
          y1=b+y                
                          
          x=a                
          y=b                
                          
                          
end sub                 
