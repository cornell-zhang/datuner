#!/bin/sh
rm output/*
./optical_flow_software ../datasets/current/frame1.png ../datasets/current/frame2.png ../datasets/current/frame3.png ../datasets/current/frame4.png ../datasets/current/frame5.png output/out.flo ../datasets/current/ref.flo

../dependencies/sintel_flow_code/C/color_flow output/out.flo output/out.png
