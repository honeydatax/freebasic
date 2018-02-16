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
dim ttimess as integer=6

Dim image As Any Ptr = ImageCreate( 64, 64, RGB(255,255,255) )
Dim images As Any Ptr = ImageCreate( 64*ttimess,64*ttimess, RGB(255,255,255) )
cls

line (0,0)-(640,480),rgb(255,255,255),bf
bload "marina.bmp" , image

streatch image,images,64,64,ttimess,ttimess
Put (0, 0), images, PSet

'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep
