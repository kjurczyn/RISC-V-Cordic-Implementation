from math import atan, pi

mul = 1<<31

y = 0
x = atan(2**(-0))/pi
print('0x'+'{:08x}'.format(int(x*mul)), end=',')
y+= 1
for i in range(1, 31):
    x = atan(2**(-i))/pi
    print('0x'+'{:08x}'.format(int(x*mul)),end=',')
    y+=1
x = atan(2**(-31))/pi
print('0x'+'{:08x}'.format(int(x*mul)))
y+= 1
print(y)
a = 1
for i in range(y):
    a *= 1/((1+2**(-2*i)**1/2))
print('0x'+'{:08x}'.format(int(a*mul)))
print(a)
print(mul)