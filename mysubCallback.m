function mysubCallback(src,msg)
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com
global state5;
if (state5==1)
    myimage(msg.Data); 
end
