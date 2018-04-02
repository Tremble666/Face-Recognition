import csv
import cv2
import numpy as np
import codecs

def faceRecognize():
	face_cascade = cv2.CascadeClassifier('D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\haarcascade_frontalface_alt.xml')
	message = codecs.open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\singlePicture\testFace.txt", 'r','utf-8').read()
	fpimg = cv2.imread(message)
	print message
	fpgray = cv2.cvtColor(fpimg,cv2.COLOR_BGR2GRAY)
	faces = face_cascade.detectMultiScale(fpgray,  1.3 ,5)
	f = open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\singlePicture\rec.txt", 'w')
	print faces
	if faces == ():
		f.write("not a face")
	else:
		for (x,y,w,h) in faces:
			roi_gray = fpgray[y:y+h, x:x+w]
		fitPhoto = cv2.resize(roi_gray,(92,112))
		cv2.imwrite(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\singlePicture\fp.jpg",fitPhoto)
		recognizer = cv2.face.LBPHFaceRecognizer_create()
		recognizer.read(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\python\recognizer.xml")
		predicted = recognizer.predict(fitPhoto)
		print predicted
		# f = open(r'C:\Users\dell-pc\Desktop\facere\rec.txt','w')
		if(predicted[1] < 30):
			f.write("-1")
		else:
			f.write(str(predicted[0])+","+str(predicted[1]))
	f.close()

if __name__ == '__main__':
        faceRecognize()
	
