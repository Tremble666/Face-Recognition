import csv
import cv2
import numpy as np


def faceTrain():
	message = csv.reader(open(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\upload\uploadPicture\afterTrain.txt"))
	imgs = []
	labels = []

	recognizer = cv2.face.LBPHFaceRecognizer_create()
	recognizer.read(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\python\recognizer.xml")
	for item in message:
		if item == []:
			pass
		else:
			s = "".join(item).split(';')
			path = s[0]
			label = s[1]
			labels.append(int(label))
			imgs.append(cv2.imread((path),cv2.IMREAD_GRAYSCALE))

	recognizer.update(imgs, np.array(labels))
	recognizer.write(r"D:\APP_Project\java_4_ee_kepler\FaceRecognize\webapp\python\recognizer.xml")
	# f = open(r"C:\Users\chenjin\Desktop\test.txt", "w")
	# f.write("not chenjin")

if __name__ == '__main__':
	faceTrain()
	# help(cv2.face.LBPHFaceRecognizer_create().update)