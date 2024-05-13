clear all;

open('condition_parameters.m');
run('condition_parameters.m');
open('M1_32.m');
run('M1_32.m');
open('motor_parameters.m');
run('motor_parameters.m');
open('battery_parameters.m');
run('battery_parameters.m');
open('OCDC_parameters.m');
run('OCDC_parameters.m');

sim('hydromech_model.slx');
hydromech_out = simout;


sim('OCDC_model.slx');
advcont_out = simout;



figure;

tiledlayout(2,1)

nexttile;
plot(hydromech_out.time, hydromech_out.signals.values(:,1),':','LineWidth',2,'Color','r');               %boom cyl target pos
ylim([-0.05 0.65])
hold on;
plot(hydromech_out.time, hydromech_out.signals.values(:,2),'LineWidth',2,'Color','r');               %boom cyl position
plot(hydromech_out.time, hydromech_out.signals.values(:,3),':','LineWidth',2,'Color','b');               %bucket cyl target position
plot(hydromech_out.time, hydromech_out.signals.values(:,4),'LineWidth',2,'Color','b');               %bucket cyl position
title('Cylinder Positions: NFC System');
xlabel("Time (s)")
ylabel("Cylinder Position (mm)")
legend('Boom Cyl Target', 'Boom Cyl Realized', 'Bucket Cyl Target', 'Bucket Cyl Realized')
hold off;


nexttile;

plot(advcont_out.time, advcont_out.signals.values(:,1),':','LineWidth',2,'Color','r');               %boom cyl target pos
ylim([-0.05 0.65])
hold on;
plot(advcont_out.time, advcont_out.signals.values(:,2),'LineWidth',2,'Color','r');               %boom cyl position
plot(advcont_out.time, advcont_out.signals.values(:,3),':','LineWidth',2,'Color','b');               %bucket cyl target position
plot(advcont_out.time, advcont_out.signals.values(:,4),'LineWidth',2,'Color','b');               %bucket cyl position
title('Cylinder Positions: OC-DC System');
xlabel("Time (s)")
ylabel("Cylinder Position (mm)")
legend('Boom Cyl Target', 'Boom Cyl Realized', 'Bucket Cyl Target', 'Bucket Cyl Realized')
hold off;
fig=gcf;
fig.Position(3:4)=[800,450];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;

tiledlayout(2,1)

%nexttile
plot(hydromech_out.time, hydromech_out.signals.values(:,11)/1000,':','LineWidth',2,'Color','r');           % 1. NFC system kinematic work      
hold on;
plot(hydromech_out.time, hydromech_out.signals.values(:,15)/1000,'LineWidth',2,'Color','r');           % 2. NFC system battery work 
plot(advcont_out.time, advcont_out.signals.values(:,11)/1000,':','LineWidth',2,'Color','b');               % 3. Presented system kinematic work
plot(advcont_out.time, advcont_out.signals.values(:,15)/1000,'LineWidth',2,'Color','b');               % 4. Presented system battery work
title('Cumulative Works and Energy Efficiencies During Test Cycle');
xlabel("Time (s)")
ylabel("Cumulative Work (kJ)")

yyaxis right
ylabel("Energy Efficiency (%)")
ylim([-5 100])
plot(hydromech_out.time, 100*hydromech_out.signals.values(:,11) ./ hydromech_out.signals.values(:,15),'--','LineWidth',2)
plot(advcont_out.time, 100*advcont_out.signals.values(:,11) ./ advcont_out.signals.values(:,15),'-.','LineWidth',2)

legend('NFC System: Kinematic Work', 'NFC System: Spent Battery Energy', 'OC-DC System: Kinematic Work','OC-DC System: Spent Battery Energy','NFC System: Energy Efficiency', 'OC-DC System: Energy Efficiency')

hold off;

fig=gcf;
fig.Position(3:4)=[800,450];