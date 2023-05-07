from math import atan, pi

y = 0
x = atan(2**(-0))/pi
print('0x'+'{:08x}'.format(int(x*(10**9))), end=',')
y+= 1
for i in range(1, 31):
    x = atan(2**(-i))/pi
    print('0x'+'{:08x}'.format(int(x*(10**10))),end=',')
    y+=1
x = atan(2**(-31))/pi
print('0x'+'{:08x}'.format(int(x*(10**10))))
y+= 1
print(y)
a = 1
for i in range(y):
    a *= 1/((1+2**(-2*i)**1/2))
print('0x'+'{:08x}'.format(int(a*(10**9))))
print(a)