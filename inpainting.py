
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

from cvxpy import *

if __name__ == "__main__":
        
    orig_img = Image.open("./figures/lena512.png")
    corr_img = Image.open("./figures/lena512_corrupted.png")
    
    Uorig = np.array(orig_img)
    Ucorr = np.array(corr_img)
    rows, cols = Uorig.shape
    
    Known = np.zeros((rows,cols))
    for i in xrange(rows):
        for j in xrange(cols):
            if Uorig[i,j] == Ucorr[i,j]:
                Known[i,j] = 1
    
    #recover original image using total variation in-painting
    U = Variable(rows, cols)
    obj = Minimize(tv(U))
    constraints = [mul_elemwise(Known, U) == mul_elemwise(Known, Ucorr)]
    prob = Problem(obj, constraints)
    prob.solve(verbose=True, solver=SCS)
    
    fig, ax = plt.subplots(1,2)
    img_rec = Image.fromarray(U.value)
    ax[0].imshow(img_rec)
    ax[0].set_title("In-Painted Image")
    ax[0].axis('off')
    
    img_diff = Image.fromarray(10*np.abs(Uorig-U.value))
    ax[1].imshow(img_diff)
    ax[1].set_title("Difference Image")
    ax[1].axis('off')
    fig.savefig('./inpainted.png')
    
    
    
    