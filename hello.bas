
'' Create a graphics screen.
ScreenRes 320, 200, 32

'Set the window title
WindowTitle "im love marina"



'' Create a 64x64 pixel image with a darkish green background.
Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0, 128, 0) )
dim x as integer
dim y as integer
dim s as string
dim w as integer
dim h as integer

If image = 0 Then
    Print "Failed to create image."
    Sleep
    End -1
End If

'' Draw a semi-transparent, red circle in the center of the image.
line  image, (0,0)-(64,64),rgba(0,0,0,0),bf
Circle image, (32, 32), 32, RGB(0,0,255),,, 1.0, f
Circle image, (32, 32), 32, RGB(0,0,0),,, 1.0

'' Draw the image onto the screen using various blitting methods.
line (0,0)-(320,200),rgb(255,255,255),bf
for y= 0 to 200 step 60
for x= 0 to 320 step 60
Put (x, y), image,alpha
next x
next y
s = "im love marina"
w=320
h=200
x = (w - Len(s) * 8) \ 2
y = (h - 1 * 8) \ 2

Draw String (x, y), s,rgb(255,255,255)

'' Destroy the image.
ImageDestroy image

Sleep