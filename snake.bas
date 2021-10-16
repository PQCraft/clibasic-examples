#!/usr/bin/env clibasic

############################################
##                                        ##
##   Snake for CLIBASIC by PQCraft 2021   ##
##                                        ##
############################################
##  W, A, S, D to move; ESC, Q to exit;   ##
##  Space to pause                        ##
############################################

## Config: #################################

## Starting length
# < 1 = Auto
l = 0

## Delay between moves in milliseconds
ms = 100

## Arena dimentions
# < 1 = Auto
w = 0
h = 0

## Color
# 0 = Disabled, <> 0 = Enabled
c = 1

############################################



if width() < 46 | height() < 24: ?"Your terminal needs to be at least 46x24": exit 1: endif
cls

if w<1:w=int((width()-2)/2)-2:endif
if h<1:h=height()-4:endif
tw=(w+2)*2+2:th=h+4

if l<1: l=cint((w*h)/250):endif
p=l-1
dim x, l-1, cint(rand(w-1))
dim y, l-1, cint(rand(h-1))
fx=cint(rand(w-1))
fy=cint(rand(h-1))
ox=x[p]
oy=y[p]
s=0
d=cint(rand(3))
ms=abs(ms)
sd=1

sbc=2  'Snake body color
shc=10 'Snake head color
ac=3   'Arena color
adc=1  'Arena death color
apc1=6 'Arena pause color 1
apc2=5 'Arena pause color 2
fc=9   'Fruit color
bc=4   'Border color
btc=10 'Border text color
btdc=9 'Border text death color

if _os$()="Windows"
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
_txtattrib "bold"
if c=0: _txtattrib "fgc", 0: endif

if 1=0 'a little trick due to LABEL being run unconditionally ;)
@chkdie
for tl,0,tl<l,1:tx=x[p]:ty=y[p]:if tl<>p&tx=x[tl]&ty=y[tl]:btc=btdc:ac=adc:gosub redraw:gosub _exit:endif:next
return
@redraw
color bc:locate 3,2:?g1$;g5$;g5$;:color btc:?" Snake for CLIBASIC ";:color bc:for dl,44,dl<tw,1:?g5$;:next:color btc:?" 2021 PQCraft ";:color bc:?g5$;g5$;g2$
cc=fgc()
locate 1,3:for dy,0,dy<h,1:color bc:?"  ";g6$;:color ac:for dx,0,dx<w,1:?ac$;:next:color bc:?g6$:next
?"  ";g3$;g5$;g5$;:color btc:?" Score: ";:s$=str$(s)+" ":dl=len(s$)+16:?s$;:color bc:for dl,dl,dl<tw,1:?g5$;:next:?g4$
tp=p-1:if tp<0:tp=l-1:endif
otx=x[p]:oty=y[p]
color sbc
for tl,1,tl<l,1:ntx=x[tp]:nty=y[tp]:if ntx=otx&nty=oty:break:endif:locate ntx*2+4,nty+3:otx=ntx:oty=nty:?sc$;:tp=tp-1:if tp<0:tp=l-1:endif:next
color cc
@draw
locate fx*2+4,fy+3:color fc:?fc$;
locate ox*2+4,oy+3:color ac:?ac$;
tp=p-1:if tp<0:tp=l-1:endif
color sbc:locate x[tp]*2+4,y[tp]+3:?sc$;
tp=mod(p+1,l)
color sbc:locate x[tp]*2+4,y[tp]+3:?sc$;
color shc:locate x[p]*2+4,y[p]+3:?sc$
color btc:locate 14,h+3:?s;" "
return
@score
o=0
sd=1
s=s+1
fx=cint(rand(w-1))
fy=cint(rand(h-1))
dim nx, l
dim ny, l
nx[0]=ox
ny[0]=oy
for i,1,i<=l,1:p=mod(p+1, l):nx[i]=x[p]:ny[i]=y[p]:next
swap nx, x
swap ny, y
del nx, ny
p=l
l=l+1
return
@pause
tac=ac
do:ac=apc1:if inkey$()=" ":break:endif:gosub redraw:wait 0.5:ac=apc2:if inkey$()=" ":break:endif:gosub redraw:wait 0.5:loop
ac=tac
gosub redraw
return
@_exit
tmph=height()
us=2000000/tmph
_txtattrib "fgc", 0
vt=_vt()
for i,0,i<tmph,1
waitus us:?:if vt=1:put "\e[3J":endif
next
cls
exit
endif

o=0
gosub redraw
do
resettimer
if x[p]=fx&y[p]=fy:gosub score:endif
gosub draw
k$=inkey$()
k=len(k$)
c$=snip$(k$,k-1,k)
if d<>1&~(c$="w"|k$="\e[A"|k$="\xE0H")=1:d=0
elseif d<>0&~(c$="s"|k$="\e[B"|k$="\xE0P")=1:d=1
elseif d<>3&~(c$="a"|k$="\e[D"|k$="\xE0K")=1:d=2
elseif d<>2&~(c$="d"|k$="\e[C"|k$="\xE0M")=1:d=3
elseif c$=" ":gosub pause
elseif c$="\e"|c$="q":gosub _exit
endif
if o=0:o=1:else:gosub chkdie:endif
tx=x[p]
ty=y[p]
if d=0
ty=ty-1
if ty<0:ty=h-1:endif
elseif d=1
ty=ty+1
if ty>=h:ty=0:endif
elseif d=2
tx=x[p]-1
if tx<0:tx=w-1:endif
elseif d=3
tx=x[p]+1
if tx>=w:tx=0:endif
endif
p=mod(p+1,l)
ox=x[p]
oy=y[p]
y[p]=ty
x[p]=tx
waitms limit(ms-timerms(),0,ms)
loop