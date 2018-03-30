dim img1 as any ptr
screenres 320,240,8
img1=imagecreate(48,64)

cls
line (0,0)-(320,240),15,bf
bload "8bitsbmp.bmp",img1

put (0,0),img1,pset

sleep


cls