import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import random
from scipy.misc import imsave
import numpy as np
origin = mpimg.imread('images.jpg')
sigma=20# sigma in gaussian distribution
gaussian=origin.copy()
deviation=0
for i in range(225):
    for j in range(225):
        noise=int(random.gauss(0,sigma))
        if gaussian[i][j][0]+noise>=255:
            gaussian[i][j][0]=255
        elif gaussian[i][j][0]+noise<=0:
            gaussian[i][j][0]=0
        else:
            gaussian[i][j][0]+=noise
        gaussian[i][j][1]=gaussian[i][j][0]
        gaussian[i][j][2]=gaussian[i][j][0]
for i in range(225):
    for j in range(225):
        deviation+=abs(int(gaussian[i][j][0])-int(origin[i][j][0]))

imsave('gaussian.jpg', gaussian)
plt.imshow(gaussian)
plt.show()