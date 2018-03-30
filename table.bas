dim n as integer
dim c as integer=15
dim a as string
dim x as integer
dim y as integer
dim bt as integer
dim ab as integer
dim ccolor as integer
dim cx as integer
dim cy as integer
                
                
sub drawpalette(c as integer)
                          
          dim n as integer =0
          dim m as integer=0
          color 0,c
          screenlock
          cls                
          for n=0 to 15
                    line(n*16,239-16)-((n+1)*16,239),n,bf
          next n                 
          line(0,0)-(16*13,16*13),0,b
          for n=0 to 15
                    line(0,n*13)-(16*13,n*13),0
                    line(n*13,0)-(n*13,16*13),0
          next n                
                          
          screenunlock
end sub                
                
                
                
screenres 320,240,4
                
drawpalette c        
                
                
do                
          line(319-16,0)-(319,16),c,bf
          do                
                    a=inkey()
                    if a=chr(27) then exit do
                    ab=getmouse(x,y,,bt)
                    if bt=0 then exit do
          loop                
          do                
                    a=inkey()
                    if a=chr(27) then exit do
                    ab=getmouse(x,y,,bt)
                    if bt=1 then exit do
          loop                
          if a=chr(27) then exit do
          if bt=1 and x>0 and x< 16*16 and y>239-16 and y<239 then
                    c=x\16                
          end if               
          if bt=1 and x>0 and x< 16*13 and y>0 and y<16*13 then
                    cx=x\13                
                    cy=y\13                
                    line(cx*13,cy*13)-((cx+1)*13,(cy+1)*13),c,bf
                    pset(280+cx,cy),c
          end if                
loop                
                
                
