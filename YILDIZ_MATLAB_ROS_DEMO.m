function varargout = YILDIZ_MATLAB_ROS_DEMO(varargin)
% YILDIZ_MATLAB_ROS_DEMO MATLAB code for YILDIZ_MATLAB_ROS_DEMO.fig
% This program is written by Yildiz Team (Muhammet Balcilar, Erkan Uslu,
% Furkan Çakmak, Fatih Amasyali, Sirma Yavuz), Any question please contact
% muhammetbalcilar@gmail.com

% Edit the above text to modify the response to help YILDIZ_MATLAB_ROS_DEMO

% Last Modified by GUIDE v2.5 02-Mar-2016 00:06:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @YILDIZ_MATLAB_ROS_DEMO_OpeningFcn, ...
                   'gui_OutputFcn',  @YILDIZ_MATLAB_ROS_DEMO_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% End initialization code - DO NOT EDIT


% --- Executes just before YILDIZ_MATLAB_ROS_DEMO is made visible.
function YILDIZ_MATLAB_ROS_DEMO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to YILDIZ_MATLAB_ROS_DEMO (see VARARGIN)

% Choose default command line output for YILDIZ_MATLAB_ROS_DEMO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global state1 h h1 h2 state2 state3 state4 state5;
state1=0;
state2=1;
state3=1;
state4=0;
state5=1;
colormap(gray);handles.axes1=imagesc(zeros(800,800),[0 255]);
hold on;
h1=quiver(400,400,15*cos(-pi/2),15*sin(-pi/2),'MaxHeadSize',500,'LineWidth',3,'AutoScale','off');
hx=400*ones(10,1);
hy=400*ones(10,1);
h2=plot(hx,hy,'w-');
axis off
zoom on;

h=handles.axes1;

% UIWAIT makes YILDIZ_MATLAB_ROS_DEMO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = YILDIZ_MATLAB_ROS_DEMO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and uhandles.axis1=imshow(zeros(4992,4992),[0 255]);ser data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttohandles.axis1=imshow(zeros(4992,4992),[0 255]);n7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global state1 mapsub tfsub h1 h tftree velpub velmsgs goalpub goalmsgs pathsub 

if (state1==0)    
    rosinit('127.0.0.1'); 
    mapsub = rossubscriber('/map', @mysubCallback,'BufferSize', 2);
    tfsub = rossubscriber('/tf', @mytfCallback,'BufferSize', 2);
    pathsub=rossubscriber('/move_base/NavfnROS/plan',@mypathCallback,'BufferSize', 2);
    handles.pushbutton7.String='Disconect ROS';
    state1=1;
    tftree=rostf;
    velpub = rospublisher('/cmd_vel','geometry_msgs/Twist');
    velmsgs = rosmessage(velpub);
    goalpub = rospublisher('/move_base_simple/goal','geometry_msgs/PoseStamped');
    goalmsgs = rosmessage(goalpub);
else
    state1=0;
    handles.pushbutton7.String='Connect ROS';    
    rosshutdown;  
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velmsgs velpub
velmsgs.Linear.X=1;
velmsgs.Linear.Y=0;
velmsgs.Angular.Z=0;
send(velpub,velmsgs);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velmsgs velpub
velmsgs.Linear.X=-1;
velmsgs.Linear.Y=0;
velmsgs.Angular.Z=0;
send(velpub,velmsgs);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velmsgs velpub
velmsgs.Linear.X=0;
velmsgs.Linear.Y=0;
velmsgs.Angular.Z=-0.5;
send(velpub,velmsgs);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velmsgs velpub
velmsgs.Linear.X=0;
velmsgs.Linear.Y=0;
velmsgs.Angular.Z=0;
send(velpub,velmsgs);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velmsgs velpub
velmsgs.Linear.X=0;
velmsgs.Linear.Y=0;
velmsgs.Angular.Z=0.5;
send(velpub,velmsgs);



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global goalpub goalmsgs
zoom off;
[X Y]=ginput(1);
X=(X-400)*0.05;
Y=(Y-400)*0.05;
goalmsgs.Pose.Position.X=Y;
goalmsgs.Pose.Position.Y=X;
goalmsgs.Pose.Position.Z=0;
goalmsgs.Pose.Orientation.X=0;
goalmsgs.Pose.Orientation.Y=0;
goalmsgs.Pose.Orientation.Z=0;%.478468854606;
goalmsgs.Pose.Orientation.W=1;%.878104524059;
goalmsgs.Header.FrameId='map';
send(goalpub,goalmsgs);
zoom on;



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global state4 h2;
if (handles.checkbox1.Value==1)
    state4=1;
else
    state4=0;
    set(h2,'Color','w');
end
