#!/usr/bin/env clibasic

print "You are running CLIBASIC "; _VER$(); " on "; _OS$(); " "; _BITS$(); "-bit with";:if _vt()=0:put "out":endif:print " VT support."
call dirname$(_arg$(0)) + "color.bas"

