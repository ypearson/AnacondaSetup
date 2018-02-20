#!/usr/bin/env python
import cv2

some_img = cv2.imread('opencv.png',0)

print("OpenCV version %s"%(cv2.__version__))
cv2.imshow('img', some_img)
cv2.waitKey(0)
cv2.destroyAllWindows()

