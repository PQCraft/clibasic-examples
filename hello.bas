#!/usr/bin/env clibasic

_TXTLOCK
_TXTATTRIB "TRUECOLOR", 1
OC = FGC()
R = CINT(RAND(255)): G = CINT(RAND(255)): B = CINT(RAND(255))
X = 2: Y = RAND(0.5, 1): X = X - Y: Z = RAND(0.5, 1): X = X -Z
IF CINT(RAND(1)) = 1: X = X * -1: ENDIF
IF CINT(RAND(1)) = 1: Y = Y * -1: ENDIF
IF CINT(RAND(1)) = 1: Z = Z * -1: ENDIF
@ LOOP
RESETTIMER
COLOR RGB(LIMIT(R, 0, 255), LIMIT(G, 0, 255), LIMIT(B, 0, 255))
PRINT "Hello, World!";
COLOR OC
PRINT
R = R + X
G = G + Y
B = B + Z
IF R > 255: X = X * -1: ENDIF
IF R < 0: X = X * -1: ENDIF
IF G > 255: Y = Y * -1: ENDIF
IF G < 0: Y = Y * -1: ENDIF
IF B > 255: Z = Z * -1: ENDIF
IF B < 0: Z = Z * -1: ENDIF
WAITMS LIMIT(10 - TIMERMS(), 0, 10)
RESETTIMER
PUT "\r"
RLOCATE , -1
GOTO LOOP
