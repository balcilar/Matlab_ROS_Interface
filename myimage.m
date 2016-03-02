function myimage(Y)
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com
global state5 h;
state5=0;
Y(Y==0)=250;
Y(Y==1)=250;
Y(Y==60)=250;
Y(Y==100)=0;
Y(Y==-1)=50;
set(h,'CDataMapping','direct');
set(h,'CData',reshape(Y,800,800));
state5=1;