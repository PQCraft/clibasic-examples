#!/usr/bin/env clibasic
#You will need the blockpix CLIBASIC extension

SUB LEXT
    IF _ARG$(2)="":LEXT.E=1:ELSE:LEXT.E=VAL(_ARG$(2)):ENDIF
    IF _OS$()="Windows":LEXT.T$=".dll":ELSE:LEXT.T$=".so":ENDIF
    LEXT.E$=_ARG$(1)+LEXT.T$
    IF LOADEXT("./"+LEXT.E$)=0:IF LOADEXT(DIRNAME$(_STARTCMD$())+LEXT.E$)=0:IF LOADEXT(LEXT.E$)=0:PRINT "Could not find ";LEXT.E$;".":EXIT LEXT.E:ENDIF:ENDIF:ENDIF
ENDSUB

CALLSUB LEXT, "cbextblockpix"

_TXTLOCK

IF BP.INIT()=0:PRINT "Could not init blockpix.":EXIT 1:ENDIF

DO:BP.RESIZE:W=BP.WIDTH():H=BP.HEIGHT():FOR Y,0,Y<H,1:FOR X,0,X<W,1:BP.IMMEDIATE_SET X,Y,RAND(ABS(SIN(X*PI()/25)),ABS(SIN(Y*PI()/25)))*(1-(X/W/1.5))*255:NEXT:NEXT:LOOP
