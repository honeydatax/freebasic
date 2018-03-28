dim shared plane(0 to 2) as any ptr
dim shared sene as any ptr
dim shared sene0 as any ptr
dim shared sene1 as any ptr
dim b as string
dim xx as integer
dim yy as integer
dim a as integer
dim e as string=chr(27)
                
                
sub scrolls()
          get sene,(0,0)-(319,236),sene0
          get sene,(0,237)-(319,239),sene1
          put sene,(0,3),sene0,pset
          put sene,(0,0),sene1,pset
end sub                
                
sub theplane(xx as integer,yy as integer)
          screenlock
          put (0,0),sene,pset
          put (xx,yy),plane(1),and
          put (xx,yy),plane(0),xor
          screenunlock
end sub                
                
                
randomize ,1
                
screenres 320,240,16
setmouse 0,0,0
cls                
                
sene=ImageCreate(320,240)
sene0=ImageCreate(320,237)
sene1=ImageCreate(320,3)
line sene,(0,0)-(320,240),rgb(0,0,0),bf
for a=0 to 20
          pset sene,(int(rnd*319),int(rnd*239)),rgb(255,255,255)
next a                
for a=0 to 1
          plane(a)= ImageCreate(16,16 )
          bload  "plane"+trim(str(a))+".bmp",plane(a)
                          
next a                
yy=200                
xx=170                
                
do                
                          
          do                
                    scrolls                
                                    
                    theplane xx,yy
                    sleep 200
                    b=inkey()
                    if b=e or  b="1" or b="2" or b="3" or b="4" then exit do
          loop                
                          
          if b="1" then yy=yy-3
          if b="2" then yy=yy+3
          if b="3" then xx=xx-3
          if b="4" then xx=xx+3
          if b=e then exit do
          if xx<0 then xx=0
          if xx>310 then xx=310
          if yy<0 then yy=0
          if yy> 230 then yy=230
loop                
                
                
cls                
