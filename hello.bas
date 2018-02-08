Sub Sound(ByVal freq As UInteger, dur As UInteger)
  Dim t As Double,f1 As Unsigned Short
    f1 = 1193181 \ freq
    Out &h61,Inp(&h61) Or 3
    Out &h43,&hb6
    Out &h42,LoByte(f1)
    Out &h42,HiByte(f1)
    t=Timer 
    While ((Timer - t) * 1000) < dur
      Sleep 0,1
    Wend
    Out &h61,Inp(&h61) And &hfc
End Sub


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
ImageDestroy images

Sound(523, 60)  'C5
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6

Sleep
cls