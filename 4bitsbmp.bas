dim img1 as any ptr
screenres 320,240,4
img1=imagecreate(48,64)
color 0,15

cls

bload "4bitsbmp.bmp",img1

put (0,0),img1,pset

sleep