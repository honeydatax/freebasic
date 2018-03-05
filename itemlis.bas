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

sub moveback(byref ll as llist,index as integer)
dim a as integer
dim c as integer
dim d as integer
dim e as string
if ll.count>0 and ll.count > index then
if ll.count>1then 
c=ll.orders(index)
for a=index to ll.count -1
ll.orders(a)=ll.orders(a+1)
if ll.orders(a)>c then ll.orders(a)=ll.orders(a)-1
next a
ll.orders(ll.count-1)=ll.count-1
e=ll.item(c)
for a=c to ll.count -1
ll.item(a)=ll.item(a+1)
next a

ll.item(ll.count-1)=e
end if
end if
end sub

sub listOrder(ll as llist)
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
end sub



sub itemRemove (byref ll as llist,index as integer)
moveback ll,index
if ll.count>0 then ll.count=ll.count-1
end sub


sub listItens(ll as llist)
dim a as integer
dim b as integer
dim c as integer

for a=0 to ll.count-1
print ll.item(ll.orders(a))
next a

end sub

dim  ll as llist
dim a as integer
randomize ,1
randomize int(rnd*32000),1

color 1,15
cls
locate 1,1

for a=0 to 5
additem (ll ,string$(12,chr$(65+int(rnd*26))))
next a

listItens ll

Print "----------------------removing item 2- and order"

itemRemove ll,2

listOrder ll

listItens ll
