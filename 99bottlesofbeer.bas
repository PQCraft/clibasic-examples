#!/usr/bin/env clibasic

count=99
while count > 1
    print count; " bottles of beer on the wall, "; count; " bottles of beer."
    print "Take one down and pass it around, ";
    count=count-1
    print count; " bottle";
    if count>1: ?"s";: endif
    print " of beer on the wall.\n"
loop
print "1 bottle of beer on the wall, 1 bottle of beer."
print "Take one down and pass it around, no more bottles of beer on the wall.\n"
print "No more bottles of beer on the wall, no more bottles of beer."
print "Go to the store and buy some more, 99 bottles of beer on the wall."
