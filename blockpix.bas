#!/usr/bin/env clibasic
#You will need the blockpix CLIBASIC extension

_TXTLOCK

IF _OS$()="Windows":T$=".dll":ELSE:T$=".so":ENDIF
E$="cbextblockpix"+T$
IF LOADEXT("./"+E$)=0:IF LOADEXT(DIRNAME$(_STARTCMD$())+E$)=0:IF LOADEXT(E$)=0:PRINT "Could not find ";E$;".":EXIT 1:ENDIF:ENDIF:ENDIF

IF BP.INIT()=0:PRINT "Could not init blockpix.":EXIT 1:ENDIF

DO:BP.RESIZE:W=BP.WIDTH():H=BP.HEIGHT():FOR Y,0,Y<H,1:FOR X,0,X<W,1:BP.IMMEDIATE_SET X,Y,RAND(ABS(SIN(X*PI()/25)),ABS(SIN(Y*PI()/25)))*(1-(X/W/1.5))*255:NEXT:NEXT:LOOP
