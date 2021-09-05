import numpy as np


def trianglin(P1, P2, x1, x2):
    """
    :param P1: Projection matrix for image 1 with shape (3,4)
    :param P2: Projection matrix for image 2 with shape (3,4)
    :param x1: Image coordinates for a point in image 1
    :param x2: Image coordinates for a point in image 2
    :return X: Triangulated world coordinates
    """
    
    # Form A and get the least squares solution from the eigenvector 
    # corresponding to the smallest eigenvalue
    ##-your-code-starts-here-##
    x1 = np.reshape(x1, (1, 3))
    x2 = np.reshape(x2, (1, 3))
    prod1 = np.dot(x1, P1)
    prod2 = np.dot(x2, P2)
    A = np.vstack((prod1, prod2))

    A = np.asarray(A)
    U, S, Vh = np.linalg.svd(A) # u and vh are 2D unitary arrays and s is a 1D array of a’s singular values.
    X = Vh[-1, :] / Vh[-1, -1]
    ##-your-code-ends-here-##

    # X = np.array([0, 0, 0, 1])  # remove me
    
    return X
