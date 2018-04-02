import csv
import numpy as np
import cv2
import codecs
import sys


def faceGet():
    reload(sys)
    sys.setdefaultencoding('utf-8')
    face_cascade = cv2.CascadeClassifier('D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\haarcascade_frontalface_alt.xml')
    # message = csv.reader(codecs.open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\uploadPicture\at.txt", 'r', 'utf-8'))
    message = codecs.open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\uploadPicture\at.txt", 'r', 'utf-8')
    f = codecs.open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\uploadPicture\afterTrain.txt", 'w', 'utf-8')
    i = 0
    for item in message:
        # print item
        s = "".join(item).split(';')
        img = cv2.imread(s[0].encode('gbk'))
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)
        if faces == ():
            pass
        else:
            for (x, y, w, h) in faces:
                roi_gray = gray[y:y + h, x:x + w]
            fitPhoto = cv2.resize(roi_gray, (92, 112))
            src = 'D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\upload\\grayHandle\\%d.jpg' % int(i)
            i += 1
            cv2.imwrite(src, fitPhoto)
            f.write(src + ';' + str(s[1]) + '\r\n')
    f.close()

if __name__ == '__main__':
    faceGet()