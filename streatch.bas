sub streatch(image As byte Ptr,images As byte Ptr,w as long,h as long,s1 as integer,s2 as integer)
dim x as long
dim y as long
dim ccolor as byte
dim ccolor2 as byte
dim xx as integer
dim yy as integer
dim pos1 as integer
dim pos2 as integer
dim pos3 as integer
pos1=32
pos3=pos1
pos2=pos1
for y=0 to h-1
for yy = 0 to s2-1
pos1=pos2
for x=0 to w-1
ccolor=image[pos1]
ccolor2=image[pos1+1]
for xx=0 to s1-1
images[pos3]=ccolor
images[pos3+1]=ccolor2
pos3=pos3+2
next xx
pos1=pos1+2
next x

next yy
pos2=pos1
next y


End sub

ScreenRes 640, 480, 16

Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
Dim images As Any Ptr = ImageCreate( 64*3,64*3, RGB(0,0,0) )
cls


line (0,0)-(640,480),rgb(255,255,255),bf

line (0,0)-(63,63),rgb(0,0,0),b
line (0,0)-(63,63),rgb(0,0,0)
line (0,63)-(63,0),rgb(0,0,0)
get (0,0)-(63,63),image
streatch image,images,64,64,3,3
Put (0, 160), images, PSet
bsave "get.bmp" , images
'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep
