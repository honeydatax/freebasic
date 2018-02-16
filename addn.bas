'fbc -lib addn.bas
#include once "addn.bi"
function Addn( byval a as integer, byval b as integer) as integer export
	function = a + b
end function