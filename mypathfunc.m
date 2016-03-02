function mypathfunc(msg)
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com
global state3 h2
state3=state3+1;
tmp=msg.Poses;

n=length(tmp);
nx=10;
nn=round(linspace(1,n,nx));
hx=zeros(nx,1);
hy=zeros(nx,1);
for i=1:nx
    hx(i)=tmp(nn(i)).Pose.Position.X;
    hy(i)=tmp(nn(i)).Pose.Position.Y;
end
hx=400+round(hx/0.05);
hy=400+round(hy/0.05);

set(h2,'XData',hy);
set(h2,'YData',hx);
set(h2,'Color','r');
