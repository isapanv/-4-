import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import RK45

def zhukko(side_length, speed):
    def f(t, z):
        x1, y1, x2, y2, x3, y3, x4, y4 = z
        dxdt = [0, 0, 0, 0, 0, 0, 0, 0]
        dxdt[0] = speed*(x2 - x1)/np.linalg.norm([x2 - x1, y2 - y1])**2
        dxdt[1] = speed*(y2 - y1)/np.linalg.norm([x2 - x1, y2 - y1])**2
        dxdt[2] = speed*(x3 - x2)/np.linalg.norm([x3 - x2, y3 - y2])**2
        dxdt[3] = speed*(y3 - y2)/np.linalg.norm([x3 - x2, y3 - y2])**2
        dxdt[4] = speed*(x4 - x3)/np.linalg.norm([x4 - x3, y4 - y3])**2
        dxdt[5] = speed*(y4 - y3)/np.linalg.norm([x4 - x3, y4 - y3])**2
        dxdt[6] = speed*(x1 - x4)/np.linalg.norm([x1 - x4, y1 - y4])**2
        dxdt[7] = speed*(y1 - y4)/np.linalg.norm([x1 - x4, y1 - y4])**2
        return dxdt

    z0 = [0, 0, side_length, 0, side_length, side_length, 0, side_length]  # initials
    t0, tf = 0, 10
    sol = RK45(f, t0, z0, tf)

    t_values, z_values = [], []
    while sol.status == 'running':
        t_values.append(sol.t)
        z_values.append(sol.y.copy())
        sol.step()

    t_values = np.array(t_values)
    z_values = np.array(z_values)

    for i in range(len(z0)//2):
        plt.plot(z_values[:, i*2], z_values[:, i*2+1], label=f'Cucaracha {i+1}')
    plt.title('Cucaracha movement in the room')
    plt.xlabel('x')
    plt.ylabel('y')
    #plt.xlim(-side_length, side_length)
    #plt.ylim(-side_length, side_length)
    plt.legend()
    plt.grid()
    plt.gca().set_aspect('equal', adjustable='box')

    plt.show()

side_length = int(input())
speed = int(input())
zhukko(side_length, speed)
