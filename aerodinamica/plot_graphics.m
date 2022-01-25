savefigs = true;

airbrake = load('AIRBRAKE_2022_01_25.mat');
no_airbrake = load('NO_AIRBRAKE_2022_01_25.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Graph 2                        %
%               Plotting CD vs Mach                %
%                                                  %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dados = airbrake.dados;
M = no_airbrake.M;
M_airbrake = airbrake.M_airbrake;
h2 = figure;
alpha_0 = find(dados.alpha == 0);


phi_0 = 1;
cg_cheio = size(dados.cg, 2);


plot(dados.mach, M.CD(phi_0, :, alpha_0, cg_cheio), 'LineWidth', 1)
hold on
plot(dados.mach, M_airbrake.CD(phi_0, :, alpha_0, cg_cheio), 'LineWidth', 1)

hold off
title('$C_D$ vs Mach ($0^{\circ}$ angle of attack)', 'Interpreter','latex');
ylabel('$C_D$', 'Interpreter','latex');
xlabel('Mach', 'Interpreter','latex');
legend show
legend({'No Airbrake', 'Airbrake'}, 'Location', 'northwest', 'Interpreter','latex')

if savefigs
    file = ['Graphics/CDvsMACH', datestr(clock,'YYYY_mm_dd'), '.png'];
    saveas(gcf, file);
end