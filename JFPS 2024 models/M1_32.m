


% Common for all orifices

spool_x_max = 10; %mm
cont_precent_vec = [0,10,20,30,40,50,60,70,80,90,100]; % of spool_x_max
cont_pos_vec = spool_x_max * cont_precent_vec / 100; %mm
coff_of_discharge = 0.7;

% Orifice A->T and B->T

AtoT_BtoT_orif_area_vector = [0.01 ,0.01 ,0.01 ,0.01 ,5.2 ,13.0 ,26.1 ,52.2 ,104.3 ,182.6 ,260.8]; %mm^2

% Orifice P->A and P->B

PtoA_PtoB_orif_area_vector = [0.01 ,0.01 ,0.01 ,0.01 ,4.6 ,11.6 ,23.2 ,46.4 ,92.7 ,162.4 ,232.1]; %mm^2

% Orifice P1->C

P1toC_cont_precent_vector = [0,10,20,30,40,50,60,70,80,90,100]; % of spool_x_max
P1toC_cont_pos_vector = spool_x_max * P1toC_cont_precent_vector /100; %mm
P1toC_orif_area_vector = [440.3, 308.8, 176.1, 88.1, 44.0, 22.0, 8.8, 0.01 ,0.01 ,0.01 ,0.01]; %mm^2

%%% Control parameters

