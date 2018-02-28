dim a(0 to 10) as string
randomize ,1
color 1,15
cls
dim b as integer
dim c as integer
dim e as string
for b= 0 to 10
a(b)=chr$(int(rnd()*26)+65)
next b


for b= 0 to 10
locate b+1,1
print a(b)
next b

print "....................."


for b=0 to 10
for c=0 to b
if a(b)<a(c) then
e=a(c)
a(c)=a(b)
a(b)=e
end if
next c
next b

for b= 0 to 10
locate b+1,39
print a(b)
next b