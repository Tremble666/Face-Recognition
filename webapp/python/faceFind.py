import numpy as np
import cv2


def faceFind():
    face_cascade = cv2.CascadeClassifier(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\circleFace\reference\haarcascade_frontalface_alt2.xml')
    eye_cascade = cv2.CascadeClassifier(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\circleFace\reference\haarcascade_eye.xml')
    img = cv2.imread(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\circleFace\1.jpg')
    f = open(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\circleFace\face.txt', 'w')
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale(gray,  1.3 ,5)
    if faces == ():
        f.write("not a face")
    else:
        for (x,y,w,h) in faces:
            cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),3)
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = img[y:y+h, x:x+w]
            eyes = eye_cascade.detectMultiScale(roi_gray,1.3,5)
            for (ex,ey,ew,eh) in eyes:
                cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)

        cv2.imwrite(r'D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\circleFace\result\result.jpg', img)
        f.write(str(len(faces)))
    f.close()


if __name__ == '__main__':
    faceFind()