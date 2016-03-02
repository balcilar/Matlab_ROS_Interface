function mytffunc(msg)
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com
global state2 tftree h1;
state2=0;
 
qq=getTransform(tftree, 'map', 'base_link');
if (size(qq,1)>0)
       size(qq.Transform.Translation);
       qqt = qq.Transform.Translation;
       quat = qq.Transform.Rotation;
       qqr = rad2deg(quat2eul([quat.W quat.X quat.Y quat.Z]));
       ix=800/2+round(qqt.X/0.05);
       iy=800/2+round(qqt.Y/0.05);
       %[ix iy]
       set(h1,'XData',iy);
       set(h1,'YData',ix);
       set(h1,'UData',15*sin(pi/180*qqr(1)));
       set(h1,'VData',15*cos(pi/180*qqr(1)));
end

state2=1;