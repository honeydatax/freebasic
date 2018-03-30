dim n as integer
dim c as integer=15
dim a as string
dim x as integer
dim y as integer
dim bt as integer
dim ab as integer
                
                
sub drawpalette(c as integer)
                          
          dim n as integer =0
          color 0,c
          screenlock
          cls                
          for n=0 to 15
                    line(n*16,239-16)-((n+1)*16,239),n,bf
          next n                
          screenunlock
end sub                
                
                
                
screenres 320,240,4
                
                
                
                
do                
          drawpalette c
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
loop                
                
                
