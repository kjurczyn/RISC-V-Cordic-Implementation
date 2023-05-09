from math import atan, pi
import decimal as dc
dc.getcontext().prec=32

mul = dc.Decimal(1<<31)

y = 0
x = dc.Decimal(atan(2**(-0)))/dc.Decimal(pi)
print('0x'+'{:08x}'.format(int(x*mul)), end=',')
y+= 1
for i in range(1, 31):
    x = dc.Decimal(atan(2**(-i)))/dc.Decimal(pi)
    print('0x'+'{:08x}'.format(int(x*mul)),end=',')
    y+=1
x = dc.Decimal(atan(2**(-31)))/dc.Decimal(pi)
print('0x'+'{:08x}'.format(int(x*mul)))
y+= 1
print(f"N: {y}")
a = dc.Decimal(1)
for i in range(y):
    a *= 1+dc.Decimal(2)**dc.Decimal(-i*2)

a = a**dc.Decimal(1/2)
a = 1/a

print("K const: " + '0x'+'{:08x}'.format(int(a*mul)))
print(f"1/K: {a}")
print(f"MUL: {mul}")