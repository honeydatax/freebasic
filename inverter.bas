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
line(640/2,0)-(640/2,480),1
for r=0 to h/16-1
s=str$(r)
xx=len(s)
centerString w,h,x,y,xx
inverter yy,r,y
y=y*16
Draw String (x,y),s ,1

next r



sleep


sub centerString(byref w as integer, byref h as integer,byref x as integer,byref y as integer,byref size as integer)
dim a as integer
dim b as integer
dim c as integer
dim d as integer
d=w/2
c=size*8\2
a=d-c
x=a
end sub

sub inverter (byval max as integer,byref n as integer,byref y as integer)
dim a as integer
dim b as integer
dim c as integer
dim d as integer
a=max-n
y=a
end sub