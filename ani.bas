declare sub drawScreens()
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
dim yyy as integer=480
dim r as integer=0



do
x=0

for r=0 to 480 step 8
ScreenSync
  ScreenLock
drawscreens
inverter yyy,r,y
mult 480,255,r*188/354,2,yy
circle (w/2,y),yy,1,,,1.0,f
if inkey$=chr$(27) then end -1
ScreenUnlock
sleep 100

next r


loop until inkey$=chr$(27)





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
dim e as long
a=max
c=maxi
e=y
b=a*100/c
d=c-y
b=b*d/960


r=b

end sub 

sub drawScreens()
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
end sub

