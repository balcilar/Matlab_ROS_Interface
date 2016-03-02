function mypathCallback(src,msg)
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com
global state3 state4
if state3==1 && state4==1
    mypathfunc(msg)
elseif state3==50
    state3=1;
elseif state3>1
     state3=state3+1;
end
    


