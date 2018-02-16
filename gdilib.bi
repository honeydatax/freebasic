#include "vbcompat.bi"

#inclib "gdilib"

public const TitleBarSize as integer=16 
public const maxWin as integer=32 
const true as boolean=-1
const false as boolean=0
const pi as double= 3.1415927
dim w as integer=640
dim h as integer=480

type windows
x as integer
y as integer
w as integer
h as integer
images As Any Ptr
index as integer
id as integer
title as string
titlebar as boolean
end type

type wwin
win(0 to maxWin) as windows
count as integer
wins(0 to maxWin) as integer
end type

type clock
x as integer
y as integer
r as integer
h as integer
m as integer
s as integer
end type

declare sub drawclock(c as clock,ww  As Any Ptr)


declare sub moveToFront(w as wwin,i as integer)


declare sub closeG(w as wwin)

declare sub drawWindows(byref w as wwin)


declare sub drawClsWindow(w as wwin,i as integer)


declare sub drawTitleBar(byref w as wwin,i as integer)



declare function clickons(w as wwin,x as integer,y as integer) as integer



declare function creatWindows(byref w as wwin,xx as integer,yy as integer, ww as integer ,hh as integer, ccolors as ulong,title as string,tbar as boolean) as integer

declare sub startx()





declare sub cprint(s as string)
