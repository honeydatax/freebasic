dim x as integer=0
dim y as integer=0
dim x1 as integer=0
dim y1 as integer=0
dim w as integer=640
dim h as integer=480



screen 12

line (x,y)-(w,h),15,bf
x=w/2
y=0


line(0,h)-(x,0),0

line(w,h)-(x,0),0
paint (x,h/2),1,0

sleep


