

   ScreenRes 640,480, 16
   
   Dim As Any Ptr sprite
   Dim As Integer counter = 0
   
   sprite = ImageCreate( 32, 32 )                  
   
   Line ( 0, 0 )-(640,480 ), RGB(0,128,255), bf  
   Line sprite, ( 0,0)-( 31,31), RGBA(0, 0, 0, 255), b
draw string (3,2),"im love marina",rgb(0,0,0)
   


   Put ( 2,2 ), sprite, Trans


   

   
   ImageDestroy( sprite )                          '' free allocated memory for sprite
   Sleep : End 0

