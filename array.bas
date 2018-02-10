sub picFill(ByVal colors as byte,byval address as UByte Ptr,byval size as long)
dim a as long
dim b as long

for a=32 to size+32
address[a]=colors
next a

End sub

ScreenRes 640, 480, 16

Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
cls
Dim c as byte =255
dim size as long = 64*64*2

picFill c,image ,size
Put (8, 8), image, PSet
line (7,7)-(7+65,7+65),rgb(0,0,255),b
'' Destroy the image.
ImageDestroy image
sleep
