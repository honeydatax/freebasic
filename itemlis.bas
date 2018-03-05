const maxItem=100
type llist
item(0 to maxItem) as string
count as integer
orders(0 to maxItem)as integer
end type



function additem (ll as llist,s as string) as integer
dim a as integer=-1
if ll.count<maxItem-1 then
ll.count=ll.count+1
ll.orders(ll.count-1)=ll.count-1
ll.item(ll.count-1)=s
a=ll.count-1
end if
return a
end function


sub listItens(ll as llist)
dim a as integer
dim b as integer
dim c as integer
for a=0 to ll.count-1
for b=0 to a
if ll.item(ll.orders(a))<ll.item(ll.orders(b))then
c=ll.orders(a)
ll.orders(a)=ll.orders(b)
ll.orders(b)=c
end if
next b
next a

for a=0 to ll.count-1
print ll.item(ll.orders(a))
next a

end sub

dim  ll as llist
dim a as integer
randomize ,1


for a=0 to 12
additem (ll ,string$(12,chr$(65+int(rnd*26))))
next a

listItens ll