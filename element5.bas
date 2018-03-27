dim shared maps(0 to 29) as string
dim shared mmap(0 to 10) as any ptr
dim a as string
dim shared tmap as any ptr
dim shared xx as integer
dim shared yy as integer
dim n1 as integer=0
dim b as byte
dim r as byte
dim g as byte
dim n as integer=0
dim f as string
dim change as integer=-1
                
sub man()
          screenlock
          put (0,0),tmap,pset
          put (xx,yy),mmap(9),and
          put (xx,yy),mmap(8),xor
          screenunlock
end sub                
                
sub drawmap()
          dim n as integer
          dim nn as integer
          dim x as integer
          dim y as integer
          dim nnn as byte
          dim i as byte=asc("0")
          for n=0 to 29
                    for nn=0 to 39
                              x=nn*16                
                              y=n*16                
                              nnn=asc(mid(maps(n),nn+1,1))-i
                              put tmap,(x,y),mmap(nnn),pset
                    next nn                
          next n                
                          
end sub                
                
'.                    0123456789012345678901234567890123456789
'.                    0000000000111111111122222222223333333333
maps(00)="7777777777777777777777777777777777777777"
maps(01)="4444444444444444444444444444444444444444"
maps(02)="4444444444444444444444444444444444444444"
maps(03)="4444444444444444444444444444444444444444"
maps(04)="4444444444444444444444444444444444444444"
maps(05)="6666666666666666666666666666666666666666"
maps(06)="6666666666666666666666666666666666666666"
maps(07)="6666666666666666666666666666666666666666"
maps(08)="6666666666666666666666666666666666666666"
maps(09)="6666666666666666666666666666666666666666"
maps(10)="4444344444444444433444444444444434444444"
maps(11)="4444344444444444433444444444444434444444"
maps(12)="5555555555555555555555555555555555555555"
maps(13)="5555555555555555555555555555555555555555"
maps(14)="5555555555555555555555555555555555555555"
maps(15)="5555555555555555555555555555555555555555"
maps(16)="5555555555555555555555555555555555555555"
maps(17)="5555555555555555555555555555555555555555"
maps(18)="4444344444444444433444444444444434444444"
maps(19)="4444344444444444433444444444444434444444"
maps(20)="6666666666666666666666666666666666666666"
maps(21)="6666666666666666666666666666666666666666"
maps(22)="6666666666666666666666666666666666666666"
maps(23)="6666666666666666666666666666666666666666"
maps(24)="6666666666666666666666666666666666666666"
maps(25)="4444444444444444444444444444444444444444"
maps(26)="4444444444444444444444444444444444444444"
maps(27)="4444444444444444444444444444444444444444"
maps(28)="4444444444444444444444444444444444444444"
maps(29)="6666666666666666666666666666666666666666"
f=chr(27)
xx=0                
yy=0                
screenres 640,480,16
cls                
print "loading"
for n=0 to 9
          mmap(n)= ImageCreate(16,16 )
          bload trim(str(n))+".bmp",mmap(n)
next n                
                
tmap= ImageCreate(640,480)
                
do                
          if change then drawmap
          man                
          do                
                    a=inkey()
                    if a=f or a="1" or a="2" or a="3" or a="4" then exit do
          loop                
          if a="1" then yy=yy-3
          if a="2" then yy=yy+3
          if a="3" then xx=xx-3
          if a="4" then xx=xx+3
          if a=f then exit do
          if xx<0 then xx=0
          if xx>630 then xx=630
          if yy<0 then yy=0
          if yy> 470 then yy=470
          change=0                
loop                
                
for n=0 to 9
          ImageDestroy mmap(n)
next n                
                
