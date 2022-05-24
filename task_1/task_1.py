from sympy import integrate, Symbol 
import time


# для подсчета времени выполнения
start_time = time.time()

x = Symbol('x')
a = Symbol('a')

upp =  [i for i in range(1,11)]
down = [i for i in range(10,20)]


a = 5
f = open('task_1_python.txt', 'w')

for u in upp:
    for d in down:
         res = integrate(a**x, (x,u,d)).evalf()
         #print(res)
         f.write('%.6f \n' % res)


f.close()
print("--- %s seconds ---" % (time.time() - start_time))
