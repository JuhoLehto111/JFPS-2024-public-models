% boom cylinder parameters

boom_cylinder_stroke = 9999;
boom_cylinder_cyl_diam = 140;
boom_cylinder_rod_diam = 9999;

boom_cylinder_A_area = pi * (boom_cylinder_cyl_diam / 2) ^2;
boom_cylinder_B_area = boom_cylinder_A_area - (boom_cylinder_rod_diam / 2) ^2;

% bucket cylinder parameters

bucket_cylinder_stroke = 9999;
bucket_cylinder_cyl_diam = 200;
bucket_cylinder_rod_diam = 9999;

bucket_cylinder_A_area = pi * (bucket_cylinder_cyl_diam / 2) ^2;
bucket_cylinder_B_area = bucket_cylinder_A_area - (bucket_cylinder_rod_diam / 2) ^2;

% cylinder forces

boom_mass_force = 100000; %N
bucket_mass_force = 100000; %N

% cylinder initial conditions

boom_cylinder_init_lenght = 30; %mm
bucket_cylinder_init_lenght = 170; %mm

if boom_mass_force > 0
    boom_A_init_press = (boom_mass_force / 2) / (boom_cylinder_A_area / 10) + 1 %bar
    boom_B_init_press = 1 %bar
elseif boom_mass_force < 0
    boom_A_init_press = 1 %bar
    boom_B_init_press = (boom_mass_force / 2) / (boom_cylinder_B_area / 10) + 1 %bar
else
    boom_A_init_press = 1 %bar
    boom_B_init_press = 1 %bar
end

if bucket_mass_force > 0
    bucket_A_init_press = bucket_mass_force / (bucket_cylinder_A_area / 10) + 1 %bar
    bucket_B_init_press = 1 %bar
elseif bucket_mass_force < 0
    bucket_A_init_press = 1 %bar
    bucket_B_init_press = bucket_mass_force / (bucket_cylinder_B_area / 10) + 1 %bar
else
    bucket_A_init_press = 1 %bar
    bucket_B_init_press = 1 %bar
end