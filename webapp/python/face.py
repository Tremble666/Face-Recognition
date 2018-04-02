import csv
import cv2
import numpy as np


def faceRead():
	message = csv.reader(open("C:\\Users\\chenjin\\Desktop\\temp\\facere\\at.txt"))
	imgs = []
	labels = []

	for item in message:
		s = "".join(item).split(';')
		path = s[0]
		label = s[1]    
		labels.append(int(label))
		imgs.append(cv2.imread((path),cv2.IMREAD_GRAYSCALE))
	recognizer = cv2.face.LBPHFaceRecognizer_create()
	recognizer.setThreshold(75)
	recognizer.train(imgs, np.array(labels))  
	recognizer.save("C:\\Users\\chenjin\\Desktop\\temp\\recognizer.xml")
	return recognizer
	
	
def recognize(recognizer):
	face_cascade = cv2.CascadeClassifier('C:\\Users\\chenjin\\Desktop\\temp\\facere\\haarcascade_frontalface_alt.xml')
	fpimg = cv2.imread(r"C:\Users\chenjin\Desktop\picture\7.jpg")
	fpgray = cv2.cvtColor(fpimg,cv2.COLOR_BGR2GRAY)
	faces = face_cascade.detectMultiScale(fpgray,  1.3 ,5)

	fitphoto = 0
	for (x,y,w,h) in faces:
		roi_color = fpimg[y:y+h, x:x+w]
		roi_gray = fpgray[y:y+h, x:x+w]        
		fitPhoto = cv2.resize(roi_gray,(92,112))
		cv2.imwrite(r'C:\Users\chenjin\Desktop\picture\fp.jpg',fitPhoto)
	predicted = recognizer.predict(fitPhoto)
	print predicted
	predicted = predicted[0]

	f = open(r"C:\Users\chenjin\Desktop\test.txt", "w")
	if predicted == 42:
		f.write("chenjin")
	else:
		f.write("not chenjin")
	f.close()
	print (predicted)
if __name__ == '__main__':
	recognize(faceRead())
	# help(cv2.face.LBPHFaceRecognizer_create())