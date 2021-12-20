#!/usr/bin/env clibasic

PRINT "location: " + _ARG$(0)
PRINT "args: " + _ARG$()
FOR I, 1, I <= _ARGC(), 1
    print "arg #" + STR$(I) + ": " + _ARG$(I)
NEXT
PRINT "Press [ENTER] to continue...";
DOWHILE INKEY$() <> "\n": LOOP
