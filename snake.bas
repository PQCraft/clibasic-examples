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

## Extended ASCII
# 0 = Disabled, <> 0 = Enabled
ea = 1

## Debug
# 0 = Disabled, <> 0 = Enabled
debug = 0

############################################

if width() < 46 | height() < 24: ?"Your terminal needs to be at least 46x24": exit 1: endif

if w<1:w=int((width()-2)/2)-2:endif
if h<1:h=height()-4:endif
tw=(w+2)*2+2:th=h+4

if l<1: l=cint((w*h)/250):endif
p=l-1
dim x, l-1, cint(rand(w-1))
dim y, l-1, cint(rand(h-1))
dim a, (w+1)*(h+1)
fx=cint(rand(w-1))
fy=cint(rand(h-1))
ox=x[p]
oy=y[p]
s=0
d=cint(rand(3))
ms=abs(ms)
sd=1

sbc=2
shc=10
ac=3
adc=1
apc1=6
apc2=5
fc=9
bc=4
btc=10
btdc=9

if ea
if _os$()="Windows"
ac$="\xB0\xB0"
sc$="\xDB\xDB"
fc$="\xB2\xB2"
g1$="\xC9"
g2$="\xBB"
g3$="\xC8"
g4$="\xBC"
g5$="\xCD"
g6$="\xBA"
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
else
ac$=",'"
sc$="{}"
fc$="()"
g1$="."
g2$="."
g3$="'"
g4$="'"
g5$="-"
g6$="|"
endif

_txtlock
if c=0: _txtattrib "fgc", 0: endif
cc=fgc()

if 1=0
@die
btc=btdc:ac=adc:gosub redraw
wait 0.33
de=0:k$=inkey$()
sec=timer()
while de=0:wait 0.1:if inkey$()<>""|timerms()/1000-sec>3.66:break:endif:loop
gosub _exit
@chkdie
if a[x[p]+y[p]*w]:gosub die:endif
return
@dredraw
color bc:locate 3,2:?g1$;g5$;g5$;:color btc:?" Snake for CLIBASIC ";:color bc:for dl,44,dl<tw,1:?g5$;:next:color btc:?" 2021 PQCraft ";:color bc:?g5$;g5$;g2$
tmph=height():us=2000000/tmph
locate 1,3:for dy,0,dy<h,1:tmpus=timeus():color bc:locate 3:?g6$;:color ac:for dx,0,dx<w,1:?ac$;:next:color bc:?g6$:while timeus()-tmpus<us:if inkey$()<>"":us=0:endif:loop:next
locate 3:?g3$;g5$;g5$;:color btc:?" Score: ";:s$=str$(s)+" ":dl=len(s$)+16:?s$;:color bc:for dl,dl,dl<tw,1:?g5$;:next:?g4$
tp=p-1:if tp<0:tp=l-1:endif
otx=x[p]:oty=y[p]
color sbc
wait 0.5
gosub drawc
color cc
waitms limit(ms,500,)
return
@redraw
color bc:locate 3,2:?g1$;g5$;g5$;:color btc:?" Snake for CLIBASIC ";:color bc:for dl,44,dl<tw,1:?g5$;:next:color btc:?" 2021 PQCraft ";:color bc:?g5$;g5$;g2$
color ac
gosub drawc
locate 1,3
for dy,0,dy<h,1
color bc:locate 3:?g6$;:color ac
if dy=fy|dy=y[p]
for dx,0,dx<w,1:if ~(dx=fx&dy=fy)|~(dx=x[p]&dy=y[p])|a[dx+dy*w]:rlocate 2:else:?ac$;:endif:next
else
for dx,0,dx<w,1:if a[dx+dy*w]:rlocate 2:else:?ac$;:endif:next
endif
color bc
?g6$
'put "test"
next
'put "bruh"
locate 3:?g3$;g5$;g5$;:color btc:?" Score: ";:s$=str$(s)+" ":dl=len(s$)+16:?s$;:color bc:for dl,dl,dl<tw,1:?g5$;:next:?g4$
tp=p-1:if tp<0:tp=l-1:endif
otx=x[p]:oty=y[p]
color sbc
color cc
return
@draw
locate ox*2+4,oy+3:color ac:?ac$;:a[ox+oy*w]=0
@drawc
tp=p-1:if tp<0:tp=l-1:endif
v=~(l>1)
color sbc:locate x[tp]*2+4,y[tp]+3:?sc$;:a[x[tp]+y[tp]*w]=v
tp=mod(p+1,l)
color sbc:locate x[tp]*2+4,y[tp]+3:?sc$;:a[x[tp]+y[tp]*w]=v
color shc:locate x[p]*2+4,y[p]+3:?sc$:
locate fx*2+4,fy+3:color fc:?fc$;
color btc:locate 14,h+3:?s;" "
return
@score
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
@pausesub
if ps:gosub redraw:t=timems():while timems()-t<500&ps:k$=inkey$():if k$=" ":waitms limit(ms,250):ps=0:elseif k$="q":gosub _exit:endif:loop:endif
return
@pause
tac=ac
ps=1
do:ac=apc1:gosub pausesub:ac=apc2:gosub pausesub:loopwhile ps
ac=tac
gosub redraw
resettimer
return
@_exit
tmph=height()
us=2000000/tmph
_txtattrib "fgc", 0
csb=~(_vt()&snip$(sh$("tty"),8)<>"/dev/tty")
k$=inkey$()
for i,0,i<tmph,1
tmpus=timeus()
while timeus()-tmpus<us:loop
?:if csb:put "\e[3J":endif
if inkey$()<>"":break:endif
next
cls
exit 'remove to enter the shadow realm
endif

o=0
gosub dredraw
do
resettimer
k$=inkey$()
k=len(k$)
if snip$(k$,k-1,k)="\e"|snip$(k$,k-1,k)="q":gosub _exit:endif
if debug:ok$=k$:endif
if _os$()<>"Windows"
for i,0,i<k,1
if asc(k$,i)=27
tk$=snip$(k$,i,i+3)
if tk$="\e[A":tk$="w"
elseif tk$="\e[B":tk$="s"
elseif tk$="\e[D":tk$="a"
elseif tk$="\e[C":tk$="d"
else: tk$=""
endif
k$=snip$(k$,i)+tk$+snip$(k$,i+3,)
ntkl=len(tk$)
i=i-(ntkl-otkl)
endif
next
else
for i,0,i<k,1
if asc(k$,i)=27
tk$=snip$(k$,i,i+2)
otkl=len(tk$)
if k$="\xE0H":k$="w"
elseif k$="\xE0P":k$="s"
elseif k$="\xE0K":k$="a"
elseif k$="\xE0M":k$="d"
else: tk$=""
endif
k$=snip$(k$,i)+tk$+snip$(k$,i+2,)
ntkl=len(tk$)
i=i-(ntkl-otkl)
endif
next
endif
k=len(k$)
nk$=""
for i,0,i<k,1
nc$=snip$(k$,i,i+1)
if nc$="w"|nc$="a"|nc$="s"|nc$="d"|nc$=" ":nk$=nk$+nc$:endif
next
k$=nk$
do
if k$="":break:endif
if asc(k$)=asc(gk$,1):k$=snip$(k$,1,):gk$=k$:else:gk$=gk$+k$:break:endif
loop
if len(gk$)>0:gc$=snip$(gk$,1):endif
color cc
if debug:?"["+pad$(ok$,8)+"]:"+pad$(gc$,1)+":["+pad$(gk$,8)+"]\e[0K";:endif
if d<>1&gc$="w":d=0
elseif d<>0&gc$="s":d=1
elseif d<>3&gc$="a":d=2
elseif d<>2&gc$="d":d=3
elseif gc$=" ":gosub pause
endif
gc$=""
gk$=snip$(gk$,1,)
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
a[ox+oy*w]=0
if x[p]=fx&y[p]=fy:gosub score:endif
gosub draw
gosub chkdie
waitms limit(ms-timerms(),0,ms)
loop
