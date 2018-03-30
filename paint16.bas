dim n as integer
dim c as integer=15
dim a as string
dim x as integer
dim y as integer
dim bt as integer
dim ab as integer
dim ccolor as integer
dim shared cx as integer
dim shared cy as integer
dim image1 as any ptr
dim shared ss as string
dim shared functi as byte
dim shared ccx as integer
dim shared ccy as integer
                
                
sub jk()                
          dim a as string
          dim x as integer
          dim y as integer
          dim ab as integer
          dim bt as integer
                          
          do                
                    a=inkey()
                    if a=chr(27) then exit do
                    ab=getmouse(x,y,,bt)
                    if bt=0 then exit do
          loop                
end sub                
                
sub inputs()
          dim a as string
          do                
                    do                
                              a=inkey()
                              if a<>"" then exit do
                    loop                
                    if a= chr(8) and len (ss)>0 then 
                              ss=mid(ss,1,len(ss)-1)
                    end if                
                    if a=chr(13) then exit do
                    if asc(a)>31 then ss=ss+a
                    line (250,13*16)-(319,14*16),15,bf
                    draw string (250,13*16),ss,1
          loop                
end sub           
                
                
sub grid()
          dim n as integer
          line(0,0)-(16*13,16*13),0,b
          for n=0 to 15
                    line(0,n*13)-(16*13,n*13),0
                    line(n*13,0)-(n*13,16*13),0
          next n             
end sub                 
sub drawpalette(c as integer)
                          
          dim n as integer =0
          dim m as integer=0
          color 0,c
          screenlock
          cls                
          for n=0 to 15
                    line(n*16,239-16)-((n+1)*16,239),n,bf
          next n                 
                          
                          
          draw string (270,2*16),"new",1
          draw string (270,3*16),"save",1
          draw string (270,4*16),"load",1
          draw string (270,5*16),"exit",1
          draw string (270,6*16),"line",1
          draw string (270,7*16),"point",1
          draw string (270,8*16),"circle",1
          draw string (270,9*16),"rect",1
          draw string (250,13*16),ss,1
          grid                
          screenunlock
end sub                
                
sub draws()
                          
          dim n as integer =0
          dim m as integer=0
          dim cc as byte
          screenlock
          for m=0 to 15
                    for n=0 to 15
                              cc=point(280+n,m)
                              line(n*13,m*13)-((n+1)*13,(m+1)*13),cc,bf
                    next n                
          next m                
          screenunlock
end sub                
                
sub click2()
          dim a as string
          dim x as integer
          dim y as integer
          dim ab as integer
          dim bt as integer
                          
          do                
                    jk                
                    do                
                              a=inkey()
                              if a=chr(27) then exit do
                              ab=getmouse(x,y,,bt)
                              if bt=1 then exit do
                    loop                
                    if bt=1 and functi<>0 and x>0 and x< 16*13 and y>0 and y<16*13 then
                              ccx=x\13                
                              ccy=y\13        
                              exit do                
                    end if                
          loop      
                          
end sub   
functi=0                
ccx=0                
ccy=0                
ss="name"
screenres 320,240,4
                
image1=imagecreate(16,16)               
drawpalette c        
                
                
do                
          line(319-16,0)-(319,16),c,bf
          grid                
          jk                
          do                
                    a=inkey()
                    if a=chr(27) then exit do
                    ab=getmouse(x,y,,bt)
                    if bt=1 then exit do
          loop                
          if a=chr(27) then exit do
          if bt=1 and x>0 and x< 16*16 and y>239-16 and y<239 then
                    c=x\16         
                    goto escapeloop
          end if              
                          
          if bt=1 and x>268 and x< 319 and y>16*2 and y<16*3-2 then
                    c=15                
                    drawpalette c
                    goto escapeloop
          end if                
          if bt=1 and x>268 and x< 319 and y>16*3 and y<16*4-2 then
                    get (280,0)-(280+15,15),image1
                    bsave ss+".bmp",image1
                    goto escapeloop
          end if                
          if bt=1 and x>268 and x< 319 and y>16*4 and y<16*5-2 then
                                    
                    bload ss+".bmp",image1
                    put (280,0),image1,pset
                                    
                    draws                
                    goto escapeloop
          end if                
          if bt=1 and x>268 and x< 319 and y>16*5 and y<16*6-2 then exit do
          if bt=1 and x>268 and x< 319 and y>16*6 and y<16*7-2 then functi=1
          if bt=1 and x>268 and x< 319 and y>16*7 and y<16*8-2 then functi=0
          if bt=1 and x>268 and x< 319 and y>16*8 and y<16*9-2 then functi=2
          if bt=1 and x>268 and x< 319 and y>16*9 and y<16*10-2 then functi=3
          if bt=1 and x>248 and x< 319 and y>16*13 and y<16*14-2 then inputs
                          
          if bt=1 and functi=0 and x>0 and x< 16*13 and y>0 and y<16*13 then
                    cx=x\13                
                    cy=y\13                
                    line(cx*13,cy*13)-((cx+1)*13,(cy+1)*13),c,bf
                    pset(280+cx,cy),c
                    goto escapeloop
          end if                
          if bt=1 and functi=1 and x>0 and x< 16*13 and y>0 and y<16*13 then
                    cx=x\13                
                    cy=y\13     
                                    
                    click2           
                    line(280+cx,cy)-(280+ccx,ccy),c
                    draws                
                    goto escapeloop
          end if            
          if bt=1 and functi=2 and x>0 and x< 16*13 and y>0 and y<16*13 then
                    cx=x\13                
                    cy=y\13     
                                    
                    click2           
                    circle(280+cx,cy),(abs(cx-ccx)+abs(cy-ccy))\2,c,,,1.0,f
                    draws                
                    goto escapeloop
          end if                
          if bt=1 and functi=3 and x>0 and x< 16*13 and y>0 and y<16*13 then
                    cx=x\13                
                    cy=y\13     
                                    
                    click2           
                    line(280+cx,cy)-(280+ccx,ccy),c,bf
                    draws                
                    goto escapeloop
          end if                
          escapeloop:
                          
loop                
                
line (0,0)-(16*15,240),15,bf
locate 10,1
print "save y n"
input a                
if a="n" or a="N" then system
                
get (280,0)-(280+15,15),image1
bsave ss+".bmp",image1
                
