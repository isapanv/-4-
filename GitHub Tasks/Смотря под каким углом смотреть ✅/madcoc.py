import numpy as np
import matplotlib.pyplot as plt

def madcoc(x0, y0, z0, a, phi, V):
    t = np.linspace(0, 100, 1000)  # this is time

    #init radius
    r0 = np.sqrt(x0**2 + y0**2)

    # velocity
    omega = V * np.cos(phi) / (a * np.sin(phi))

    # velocity normal
    vz = V * np.cos(phi)

    z = z0 + vz * t
    r = r0 + (z - z0) * np.tan(phi)
    theta = omega * t

    x = r * np.cos(theta)
    y = r * np.sin(theta)

    # CONE
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    Theta, Z = np.meshgrid(np.linspace(0, 2*np.pi, 100), np.linspace(0, max(z), 100))
    R = a * Z
    X = R * np.cos(Theta)
    Y = R * np.sin(Theta)
    ax.plot_surface(X, Y, Z, color='c', alpha=0.3, edgecolor='none')

    # TRAEKTORIA
    ax.plot(x, y, z, 'red', linewidth=2)

    # START AND APEX
    ax.plot([x0], [y0], [z0], 'ro', markersize=10)

    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')
    ax.set_title('Cucaracha way')
    plt.show()

madcoc(1, 1, np.sqrt(2), 1, np.pi / 4, 0.1)

