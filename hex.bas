type ip                
          address as long
          segment as integer
end type                
                
                
Function getData() as ip
          dim a as long
          dim b as integer
          dim iip as ip
          asm                
          call jk                
          jk:                
          pop eax                
          mov [a],eax
          mov ax,cs
          mov [b],cs
                          
end asm                
iip.address=a
iip.segment=b
return iip
end function
                
                
dim a as ip=getData()
print "address:   ";hex$(a.segment);":"; hex$(a.address)
