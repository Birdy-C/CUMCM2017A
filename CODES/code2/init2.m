% init2.m
% 该文件为 model2 的初始化代码
clc;
clear;

% depth2 = xlsread('A题附件.xls','附件3');
load depth
load depth2
pic = load('1.dat');

pixel_length = 100 / 256;
deltx_value = 0.277429210100547;
kValue = 1.776812774001533;
% 这一个模型中由于最后的评价也是用透光性，所以不需要通过kValue转为长度信息
% depth2 = depth2 ./ kValue;
% depth = depth ./ kValue;

load theta
theta = theta;
load position
pos_pix = pos/pixel_length;
% 
theta_deg = rad2deg(theta)-90;



