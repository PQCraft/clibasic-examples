count=0
while count < 100
    count=count+1: a=mod(count, 15): b=mod(count, 3): c=mod(count, 5)
    if a = 0
        print "FizzBuzz"
    elseif b = 0
        print "Fizz"
    elseif c = 0
        print "Buzz"
    else
        print count
    endif
loop
