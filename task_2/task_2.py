import numpy as np
from numpy import linalg
import time
import pandas as pd
from requests import head

# вариант 9 QR-разложение (71)

time_track = []

for i in range(50):
    start_time = time.time()

    # читаем 
    a = np.genfromtxt('initial/item_' +str(i+1) + '.txt', delimiter=' ')

    # разлагаем 
    Q,R = linalg.qr(a)
    res = np.append(Q,R, axis=0)

    # записываем
    np.savetxt('q_r/Q_' +str(i+1) + '.txt', Q, fmt='%f')
    np.savetxt('q_r/R_' +str(i+1) + '.txt', R, fmt='%f')

    # фиксируем время
    total_time = time.time() - start_time

    # запоминаем время
    time_track.append(total_time)


time_track = np.array(time_track)
np.savetxt('time_Python.txt', time_track, fmt='%.6f')


'''
# Сравненеи времени выполнения программ

time_Python = np.genfromtxt('time_Python.txt', delimiter=' ')
time_Matlab = np.genfromtxt('time_Matlab.txt', delimiter=' ')

h_Python = []
h_Matlab = []

# сравниваем 
for i in range(50):
    if time_Python[i]<time_Matlab[i]:
        h_Python.append(1)
        h_Matlab.append(0)
    else:
        h_Python.append(0)
        h_Matlab.append(1)



time_res = {'Python': list(time_Python), 'Matlab': list(time_Matlab), 
    'L_Python': list(h_Python),
    'L_Matlab': list(h_Matlab)}


total_Mat = sum(h_Matlab)
total_Py = sum(h_Python)


frame_time = pd.DataFrame(time_res)
frame_time.to_excel('time_test.xlsx')
'''