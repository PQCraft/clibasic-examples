#!/usr/bin/clibasic

########################################
## Snake for CLIBASIC by PQCraft 2021 ##
########################################

## W,A,S,D to move, ESC,Q to exit
########################################

## Starting length
# <1 = Auto
l = 0

## Delay between moves in milliseconds
ms = 100

## Arena dimentions
# <1 = Auto
w = 0
h = 0

########################################



if width() < 46 | height() < 24: ?"Your terminal needs to be at least 46x24": exit 1: endif
cls

if w<1:w=int((width()-2)/2)-2:endif
if h<1:h=height()-4:endif
tw=(w+2)*2+2:th=h+4

p = 0
if l<1: l = cint((w*h)/250)
dim x, l-1, cint(rand(w-1))
dim y, l-1, cint(rand(h-1))
fx = cint(rand(w-1))
fy = cint(rand(h-1))
ox = x[p]
oy = y[p]
s = 0
d = cint(rand(3))
ms=abs(ms)
sd=1

sbc = 2  'Snake body color
shc = 10 'Snake head color
ac = 3   'Arena color
fc = 9   'Fruit color
bc = 4   'Border color
btc = 10 'Border text color

if _os$() = "Windows"
ac$="##"
sc$="[]"
fc$="()"
g1$="."
g2$="."
g3$="'"
g4$="'"
g5$="-"
g6$="|"
else
ac$="░░"
sc$="██"
fc$="▓▓"
g1$="╔"
g2$="╗"
g3$="╚"
g4$="╝"
g5$="═"
g6$="║"
endif

_txtlock

if 1 = 0 'a little trick due to LABEL being run unconditionally ;)
@redraw
color bc:locate 3,2:?g1$;g5$;g5$;:color btc:?" Snake for CLIBASIC ";:color bc:for dl,44,dl<tw,1:?g5$;:next:color btc:?" 2021 PQCraft ";:color bc:?g5$;g5$;g2$
cc=fgc()
locate 1,3:for dy,0,dy<h,1:color bc:?"  ";g6$;:color ac:for dx,0,dx<w,1:?ac$;:next:color bc:?g6$:next
?"  ";g3$;g5$;g5$;:color btc:?" Score: ";:s$=str$(s)+" ":dl=len(s$)+16:?s$;:color bc:for dl,dl,dl<tw,1:?g5$;:next:?g4$
color cc
@draw
locate ox*2+4,oy+3:color ac:?ac$;
if sd=1:locate fx*2+4,fy+3:color fc:?fc$;:sd=0:endif
color shc:tp=p:locate x[tp]*2+4,y[tp]+3:?sc$:color sbc:for tl,1,tl<l,1:tp=mod(tp+1,l):locate x[tp]*2+4,y[tp]+3:?sc$;:next
color btc:locate 14,h+3:?s;" "
return
@score
o=0
sd=1
s = s+1
fx = cint(rand(w-1))
fy = cint(rand(h-1))
dim nx, l
dim ny, l
nx[0]=x[p]
ny[0]=y[p]
for i,1,i<=l,1:p = mod(p+1, l):nx[i] = x[p]:ny[i] = y[p]:next
swap nx, x
swap ny, y
del nx, ny
l = l+1
p = l-1
return
@_exit
exit
endif

o=0
gosub redraw
do
resettimer
gosub draw
if x[p]=fx&y[p]=fy:gosub score:endif
if o=0:o=1:else
for tl,0,tl<l,1:if tl<>p:if x[p]=x[tl]&y[p]=y[tl]:btc=9:ac=124:gosub redraw:gosub _exit:endif:endif:next
endif
tx=x[p]
ty=y[p]
if d=0
ty=ty-1
if ty<0:ty=h-1:endif
p=mod(p+1,l)
elseif d=1
ty=ty+1
if ty>=h:ty=0:endif
p=mod(p+1,l)
elseif d=2
tx=x[p]-1
if tx<0:tx=w-1:endif
p=mod(p+1,l)
elseif d=3
tx=x[p]+1
if tx>=w:tx=0:endif
p=mod(p+1,l)
endif
ox=x[p]
oy=y[p]
y[p]=ty
x[p]=tx
waitms limit(ms-timerms(),0,ms)
k$=" "+inkey$()
k=len(k$)
k$=snip$(k$,k-1,k)
if d<>1&k$="w":d=0
elseif d<>0&k$="s":d=1
elseif d<>3&k$="a":d=2
elseif d<>2&k$="d":d=3
elseif k$="\e"|k$="q":gosub _exit
endif
loop
