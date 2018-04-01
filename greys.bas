dim img1 as any ptr
screenres 640,480,4
img1=imagecreate(640,480)

cls

bload "greys.bmp",img1

put (0,0),img1,pset

sleep


cls