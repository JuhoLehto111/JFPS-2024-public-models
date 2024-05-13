max_rpm = 4100; %rpm
min_rpm = 500;
int_5s_power = 157000;%W
int_5s_trq = 600; %Nm
nom_trq = 230;  %Nm
nom_power = 60000; %W
eff_map_max_trq = 650; %Nm

motor_eff_map_lq=[];
motor_eff_map_1q=[
   
    ]; % not presented due to confidentiality reasons

motor_eff_map_2q=[fliplr(motor_eff_map_1q(:,2:7)) motor_eff_map_1q];
motor_eff_map_4q=[flipud(motor_eff_map_2q(2:9,:)); motor_eff_map_2q]; 

ideal_eff_map=[];
ideal_eff_map(1:17,1:13)=100;

motor_loss_map_4q = ideal_eff_map - motor_eff_map_4q


motor_eff_speed_vector=[-max_rpm:(max_rpm/8):max_rpm];
motor_eff_trq_vector=[-eff_map_max_trq:(eff_map_max_trq/6):eff_map_max_trq]; 


ideal_eff_map(1:18,1:14)=100;
