#!/usr/bin/env clibasic

_txtlock
do
  'print "Polling..."
  k = asc(inkey$())
  if k <> 0
    print k
  endif
loop
