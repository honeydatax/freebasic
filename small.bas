sub small(image As byte Ptr,images As byte Ptr,w as long,h as long,s1 as integer,s2 as integer)
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
for y=0 to h-1step s2
for x=0 to w-1 step s1
ccolor=image[pos1]
ccolor2=image[pos1+1]
images[pos3]=ccolor
images[pos3+1]=ccolor2
pos3=pos3+2
pos1=pos1+(2*s1)
next x
pos1=pos1+(h*s2)
next y


End sub

ScreenRes 640, 480, 16
Dim pal(0 To 256-1) As Integer
Dim image As Any Ptr =ImageCreate( 64,64, RGB(255,255,255) )
BLoad "marina.bmp",image ',@pal(0)
' Palette Using pal(0)
Dim images As Any Ptr = ImageCreate(64/2,64/2, RGB(255,255,255) )


line (0,0)-(640,480),rgb(255,255,255),bf


Put (0, 0), image, PSet
small image,images,64,64,2,2

Put (0, 160), images, PSet
bsave "marina2.bmp",images
'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep