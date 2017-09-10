f = e^(expand(indefinite_integral(1/(x-x^i),x)))
fprime = diff(f,x)
newtontransform = x - f/fprime
x0 = e
x1 = newtontransform(x=x0)
x2 = newtontransform(x=x1)
x3 = newtontransform(x=x2)
x4 = newtontransform(x=x3)
print 'x0 = x0', bool(x0 == x0)
print 'x0 = x1', bool(x0 == x1)
print 'x0 = x2', bool(x0 == x2)
print 'x0 = x3', bool(x0 == x3)
print 'x0 = x4', bool(x0 == x4)