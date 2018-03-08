Declare Sub Zoom (ByVal X As Integer)
declare Sub Sound(ByVal freq As UInteger, dur As UInteger)
                
Dim As Integer X = 500, Xdelta = 50
                
ScreenRes 640, 480, 32
                
Do                
          Do While X < 525 And X > 50
                    X += Xdelta                      '' Change window size.
                    Zoom(X)                
                    If Inkey <> "" Then Exit Do, Do  '' Stop if key pressed.
                    Sound(523, 60)  'C5
          Loop                
          X -= Xdelta
          Xdelta *= -1                       '' Reverse size change.
Loop                
                
Sub Zoom (ByVal X As Integer)
          Window (-X,-X)-(X,X)               '' Define new window.
          ScreenLock
          cls                
          line (-60,-60)-(60,60),rgb(255,255,255),bf
          line(-60,-60)-(60,60),rgb(0,0,0)
          line(-60,60)-(60,-60),rgb(0,0,0)
                          
                          
          ScreenUnlock
End Sub                
                
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
                
                
                
