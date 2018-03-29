                
dim ab as integer
dim x as integer=1
dim y as integer=1
dim bt as integer
dim s as string
dim b as byte
color 1,15
                
cls                
                
setmouse 0,0,-1
do                
          color 1,15
          locate y,x
          b=screen (y,x,0)
          print chr(b);
          locate y,x
          ab= getmouse (x,y, ,bt)
          x=x+1                
          y=y+1                
          locate 1,1
                          
          print x;"=x.     ";y;"=y.       ";bt;"=bt.   "
          color 15,1
          locate y,x
          b=screen (y,x,0)
          print chr(b);
          locate y,x
          s=inkey()
                          
          if s=chr(27) then exit do
          sleep 700
                          
loop                
                
                
cls                
