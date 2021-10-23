#!/usr/bin/env clibasic
#You will need the blockpix CLIBASIC extension

_TXTLOCK

IF _OS$()="Windows":T$=".dll":ELSE:T$=".so":ENDIF
E$="cbextblockpix"+T$
IF LOADEXT(E$)=0:IF LOADEXT("./"+E$)=0:IF LOADEXT(DIRNAME$(_STARTCMD$())+E$)=0:PRINT "Could not find ";E$;".":EXIT 1:ENDIF:ENDIF:ENDIF

IF BP.INIT()=0:PRINT "Could not init blockpix.":EXIT 1:ENDIF

W=BP.WIDTH():H=BP.HEIGHT():DO:FOR Y,0,Y<H,1:FOR X,0,X<W,1:BP.IMMEDIATE_SET X,Y,RGB(CINT(RAND(255)),CINT(RAND(255)),CINT(RAND(255))):NEXT:NEXT:LOOP
