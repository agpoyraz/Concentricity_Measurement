
import matplotlib.pyplot as plt 
from PIL import Image
import numpy as np

from devernay_edges import DevernayEdges

def circle_fit(x, y):
    # Verileri numpy dizisine çevir
    x = np.array(x)
    y = np.array(y)

    # A, B, C matrisleri oluştur
    A = np.c_[2*x, 2*y, np.ones(x.shape[0])]
    b = x**2 + y**2

    # Least squares çözümü
    c, _, _, _ = np.linalg.lstsq(A, b, rcond=None)
    x0 = c[0]
    y0 = c[1]
    r = np.sqrt(c[2] + x0**2 + y0**2)

    return x0, y0, r

def main():
    sigma = 3.0
    high_treshold = 4.0
    low_threshold = 0.0

    image_rgb = Image.open("0035.bmp")    
    # image_rgb = Image.open("dog.jpg")

    # convert to binary
    image_binary = Image.open("0035_outer.bmp")
    # image_binary = Image.open("binary_dog_image.jpg")

    devernayEdges = DevernayEdges(image_binary, sigma, high_treshold, low_threshold)
    [edges_x, edges_y] = devernayEdges.detect_edges()
    
    print(f"edges_x len: {len(edges_x)}")
    print(f"edges_y len: {len(edges_y)}")

    plt.figure(1)
    plt.title("Devernay Edge Detection")
    plt.imshow(image_binary)
    plt.scatter(edges_x, edges_y, color="magenta", marker=".", linewidth=.1)
    plt.show()





if __name__ == "__main__": main()