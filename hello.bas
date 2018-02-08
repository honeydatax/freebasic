
'' Create a graphics screen.
ScreenRes 320, 200, 32
dim s as string
s = "im love marina"
'Set the window title
WindowTitle s
cls
beep

'' Create a 64x64 pixel image with a darkish green background.
Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0, 128, 0) )
Dim images As Any Ptr = ImageCreate( 340,200, RGB(255, 255, 255) )
dim x as integer
dim y as integer

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
line images,(0,0)-(320,200),rgb(255,255,255),bf
for y= 0 to 200 step 63
for x= 0 to 320 step 63
Put images,(x, y), image,alpha
next x
next y

w=320
h=200
x = (w - Len(s) * 8) \ 2
y = (h - 1 * 8) \ 2

Draw String images, (x, y), s,rgb(255,255,255)
Put (0, 0), images,pset
'' Destroy the image.
ImageDestroy image

Sleep
cls