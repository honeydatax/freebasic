sub picFill(image As Any Ptr,images As Any Ptr,w as long,h as long)
          dim x as long
          dim y as long
          dim ccolor as ulong
          dim xx as integer
          dim yy as integer
          for y=0 to h
                    for yy = 0 to 1
                              for x=0 to w
                                        ccolor=point (x,y,image)
                                        for xx=0 to 1
                                                  pset images,(2*x+xx,2*y+yy),ccolor
                                        next xx                
                              next x                
                    next yy                
          next y                
                          
                          
End sub                
                
ScreenRes 640, 480, 16
                
Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
Dim images As Any Ptr = ImageCreate( 128,128, RGB(0,0,0) )
cls                
                
                
line (0,0)-(640,480),rgb(255,255,255),bf
                
line (0,0)-(63,63),rgb(0,0,0),b
line (0,0)-(63,63),rgb(0,0,0)
line (0,63)-(63,0),rgb(0,0,0)
get (0,0)-(63,63),image
picFill image,images,64,64
Put (0, 160), images, PSet
bsave "get.bmp" , images
'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep                
