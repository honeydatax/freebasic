function smax(s as string,ss as string) as integer
          dim m as integer
          dim n as integer
          m=len(s)                
          n=len(ss)
          if m>n then n=m
          return n                
end function
                
                
print smax("im love marina","im love marina.")
