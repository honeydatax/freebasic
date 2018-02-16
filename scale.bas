declare sub scale(byref h as integer,byref p as integer,byref y as integer)

screen 12


dim s as string ="im love marina"
dim x as integer
dim y as integer
dim w as integer=640
dim h as integer=480
dim xx as integer
dim yy as integer=480
dim r as integer=0



for r=0 to 100
scale yy,r,y
line (0,0)-(640,y),11,bf
line(0,y)-(640,480),6,bf
locate 1,1
print str$(r);"%"
sleep 100

if inkey$=chr$(27) then end -1
next r






sub scale(byref h as integer,byref p as integer,byref y as integer)
dim a as long
dim b as long=p
dim c as long
dim d as long
if b=0 then b=1
a=(h*b\100)
y=a
end sub

