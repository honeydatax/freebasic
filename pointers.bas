declare sub fillmem(x as integer,object1 As byte ptr)
declare sub copymem(x as integer,y as integer,object1 As byte ptr,object2 As any ptr,pitch as integer ,bypp as integer)
Dim object1 As byte ptr = allocate(320 *200* SizeOf(byte))
Dim object2 As any ptr 
dim s1 as byte ptr
dim a as integer=0
dim b as integer=0
dim c as byte
Dim As Integer w, h, bypp, pitch
                
screenres 320,200,8
object2=screenptr()
ScreenInfo w, h, , bypp, pitch
                
locate 1,1
print "loading..."
fillmem(320*200,object1)
ScreenLock()
copymem(w,h,object1,object2,pitch,bypp)
ScreenUnlock()
Deallocate (object1)
                
                
                
sleep                
                
sub fillmem(x as integer,object1 As byte ptr)
          dim a as integer
          dim b as long
          dim c as byte
                          
          for b=0 to x-1
                    object1[b]=c
                    c=c+1                
          next b                
                          
end sub                
                
sub copymem(x as integer,y as integer,object1 As byte ptr,object2 As any ptr,pitch as integer ,bypp as integer)
          dim a as integer
          dim b as integer
          dim c as byte=0
          Dim As Any Ptr row
          Dim As byte Ptr pixel
                          
          row = object2
          for b=0 to y-1
                    pixel=row
                    for a= 0 to x-1
                                              
                              *pixel=object1[b*x+a]
                              pixel += 1
                                              
                    next a                
                    row += pitch
          next b                
                          
end sub                
                
                
                
