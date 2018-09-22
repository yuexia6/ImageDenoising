import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import random
import numpy as np
from scipy.misc import imsave
origin = mpimg.imread('images.jpg')
salt=origin.copy()
deviation=0
possibility=0.02
for i in range(225):
    for j in range(225):
        noise=random.uniform(0,1)
        if noise<=possibility:
            seed=random.uniform(0,1)
            deviation += 1
            if seed<=0.5:
                for k in range(3):
                   salt[i][j][k] = 255
            else:
                for k in range(3):
                   salt[i][j][k] = 0

imsave('salt.jpg', salt)
print(deviation)
plt.imshow(salt)
plt.show()