
dim a as integer
color  1,15
cls
locate 1,1
print "im love marina."
locate 25,1
color 15,1
print space(79);
do
locate 25,50
print date();"   " ;time();"  .";
locate 25,50
sleep 1000
if inkey$=chr(27) then goto exitdo
loop

exitdo: