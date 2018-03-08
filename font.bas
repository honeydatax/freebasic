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
                
dim x as integer
dim y as integer
                
dim w as integer
dim h as integer
w=640                
h=480                
                
                
Const FIRSTCHAR = 32, LASTCHAR = 127
                
Const NUMCHARS = (LASTCHAR - FIRSTCHAR) + 1
Dim As UByte Ptr p, myFont
Dim As Integer i
                
                
ScreenRes 640, 480, 8
                
line(0,0)-(640,480),15,bf
                
for y= 0 to h step 8
          line (0,y)-(w,y),1
next y                
for x= 0 to w step 8
          line (x,0)-(x,h),1
next x                
                
                
                
'' Create custom font into PUT buffer
                
myFont = ImageCreate(NUMCHARS * 8, 9)
                
'' Put font header at start of pixel data
                
#ifndef ImageInfo '' older versions of FB don't have the ImageInfo feature
p = myFont + IIf(myFont[0] = 7, 32, 4)
#else                
ImageInfo( myFont, , , , , p )
#endif                
                
p[0] = 0                
p[1] = FIRSTCHAR
p[2] = LASTCHAR
                
'' PUT each character into the font and update width information
For i = FIRSTCHAR To LASTCHAR
                          
          '' Here we could define a custom width for each letter, but for simplicity we use
          '' a fixed width of 8 since we are reusing the default font glyphs
          p[3 + i - FIRSTCHAR] = 8
                          
          '' Create character onto custom font buffer by drawing using default font
          Draw String myFont, ((i - FIRSTCHAR) * 8, 1), Chr(i), 32 + (i Mod 24) + 24
                          
Next i                
                
'' Now the font buffer is ready; we could save it using BSAVE for later use
BSave "myfont.bmp", myFont
                
'' Here we draw a string using the custom font
                
for y= 0 to h step 8
          Draw String (1+y,1+y), "im love marina.", , myFont
next y                
                
                
                
'' Free the font from memory, now we are done with it
ImageDestroy myFont
                
Sound(523, 60)  'C5
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6
                
                
Sleep                
