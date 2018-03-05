


sub currencys(i as integer)
dim a as string=""
dim b as integer
dim c as string
dim d as integer
dim e as integer

b=i/100
d=b*100
a=".0"

c=trim(str$(abs(i-d)))
if len(c)=2 then a="."
c=a+c
a=str$(b)
print  "current : $";a;c

end sub


dim a as string=""
dim b as integer
dim c as string
dim d as integer
dim f as integer=0

randomize ,1

d=10000

color 1,15
cls
locate 24,1

print "lunar base"



do
currencys d

for b= 1 to 8
d=d+(400-int(rnd*410))
currencys d
sleep 2000
next b

print " do you want to buy lunar base "+str$(f)+".y n e exit ";
input c
if c="y" then

d=d-5000
print "you buy base lunar"; f;
f=f+1
end if

currencys d

if c="e" then 
print " you lose"
exit do
end if

if d<1 then 
print " you lose"
exit do
end if

if  f>4 then 
print " you win"
exit do
end if


loop



