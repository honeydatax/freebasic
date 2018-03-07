Dim w As Integer, h As Integer
Dim depth As Integer
Dim driver_name As String
dim a as integer
for a= 1 to 19
                          
          Screen a                
          cls                
          ' Obtain info about current mode 
          ScreenInfo w, h, depth,,,,driver_name
          print "screen mode"; a
          Print Str(w) + "x" + Str(h) + "x" + Str(depth)
          Print " using " + driver_name + " driver" 
                          
          Sleep                 
next a                
