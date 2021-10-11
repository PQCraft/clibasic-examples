# Ported from FreakC version: https://github.com/FreakC-Foundation/FreakC/blob/master/Examples/99BottlesOfBeer.fclang
# FreakC: https://github.com/FreakC-Foundation/FreakC
# Optimized port

_title "99 Bottles Of Beer"

count=99
while count > 2
	print count; " bottles of beer on the wall"
	print count; " bottles of beer,"
	print "Take one down, pass it around,"
	count=count-1
    print count; " bottles of beer on the wall."
loop
print "2 bottles of beer on the wall"
print "2 bottles of beer,"
print "Take one down, pass it around,"
print "1 bottle of beer on the wall."
print "1 bottle of beer on the wall"
print "1 bottle of beer,"
print "Take one down, pass it around,"
print "No more bottle of beer on the wall."
exit
