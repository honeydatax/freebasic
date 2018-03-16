color 2,3
cls
locate 20,1
print "gess a number from 0 to 100"

randomize ,1
dim a as integer=int(rnd*100)
dim aa as string
dim b as integer

do
input aa
b=val(aa)
if b>a then print "number is to hight"
if b<a then print "number is to low"
if b=a then
                    print "you gess the number"
                    aa=""
                    
                   end if
loop until aa =""