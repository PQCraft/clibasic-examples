max = 5000
x = 1: y = 1
@loop
if x > max: exit: endif
print x
x = x + y
if y > max: exit: endif
print y
y = x + y
goto loop
