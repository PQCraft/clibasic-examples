#!/usr/bin/env clibasic
_txtlock
@start
cls
o=1
m=1
d=-0.035
oy=1
v1=0
v2=1
hm=1
delayms=10
_txtattrib "reverse"
if 0
@_exit
do
    k$=inkey$()
    if asc(k$, limit(len(k$) - 1,0,)) = 32
        goto start
    elseif k$ = "\n"
        ?:exit
    endif
    wait 0.05
loop
endif
do
    h=height()
    resettimer
    p=abs(sin(pi()/2*o*hm))
    y=h-cint((cint((h-1)*p))*(1/hm))
    locate 1,y:?"bounce";
    if oy<>y:cls ,oy:endif
    oy=y
    if cint(h*(1/hm))=0:goto _exit:endif
    o=o+d
    if o>m:o=m:d=d*-1:endif
    if o<0:o=0:d=d*-1:endif
    if p>op:v1=1:else:v1=0:v2=0:endif
    if v1<>v2:hm=hm*2:endif
    op=p
    v2=v1
    waitms limit(delayms-timerms(),0,delayms)
loop
