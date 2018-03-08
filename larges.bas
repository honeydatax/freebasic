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
                                        for xx=0 to s1-1
                                                  images[pos3]=ccolor
                                                  pos3=pos3+1
                                        next xx                
                                        pos1=pos1+1
                              next x                
                                              
                    next yy                
                    pos2=pos1
          next y                
                          
                          
End sub                
                
sub colorDep(image As byte Ptr,images As byte Ptr)
          images[4]=image[4]
          images[5]=image[5]
          images[6]=image[6]
          images[7]=image[7]
end sub                 
                
Dim pal(0 To 70000) As Integer
                
screen 18
Palette Get Using pal
Palette Using pal
dim tim as integer =4
dim tim2 as integer =4
dim s as string ="im love marina."
dim x as integer
dim y as integer
dim xx as integer
dim yy as integer
x=(len(s)+1)*9
y=16                
xx=x*tim                
yy=y*tim2
                
Dim image As Any Ptr = ImageCreate(x,y,15)
Dim images As Any Ptr = ImageCreate(xx,yy,15)
cls                
line (0,0)-(640,480),15,bf
Draw String image,(0,0),s ,1
                
                
                
Put (0, 0), image, PSet
                
streatch image,images,x,y,tim,tim2
                
Put (0, 160), images, PSet
'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep                
