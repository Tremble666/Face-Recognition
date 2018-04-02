#coding=utf-8
import cv2
import numpy as np

def Laplacian():
    img = cv2.imread(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\drawFace\1.jpg')
    gray_lap = cv2.Laplacian(img, cv2.CV_16S, ksize = 5)
    dst = cv2.convertScaleAbs(gray_lap)
    dst = 255 - dst
    cv2.imwrite(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\drawFace\result.jpg', dst)


if __name__ == '__main__':
    Laplacian()