function plot_graphics(airbrake_files, no_airbrake_file)

savefigs = true;

no_airbrake = load(no_airbrake_file);
airbrake = [];
M = no_airbrake.M;


dados = no_airbrake.dados;
alpha_0 = find(dados.alpha == 0);
phi_0 = 1;
cg_cheio = size(dados.cg, 2);
h2 = figure;
plot(dados.mach, M.CD(phi_0, :, alpha_0, cg_cheio), 'LineWidth', 1)
hold on


airbrake = [];
for i = 1:4%length(airbrake_files)
    file = strcat('AIRBRAKE_POS_', num2str(i), '_2022_01_26.mat');
    airbrake = [airbrake, load(file)];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Graph 1                        %
%               Plotting CD vs Mach                %
%                                                  %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for caso = 1:length(airbrake)
    M_airbrake = airbrake(caso).M_airbrake;
    plot(dados.mach, M_airbrake.CD(phi_0, :, alpha_0, cg_cheio), 'LineWidth', 1)
    hold on
end
    hold off
    title('$C_D$ vs Mach ($0^{\circ}$ angle of attack) for different airbrake axial positions', 'Interpreter','latex');
    ylabel('$C_D$', 'Interpreter','latex');
    xlabel('Mach', 'Interpreter','latex');
    legend show
    legend({'No Airbrake', 'X = 0.5 m', 'X = 1.0 m','X = 1.5 m','X = 2 m'}, 'Location', 'northwest', 'Interpreter','latex')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Graph 2                        %
%               Plotting CM vs AoA                 %
%                                                  %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
mach_06 = find(dados.mach == 0.6);
data = reshape(M.CM(phi_0, mach_06, :, cg_cheio), 1, length(M.CM(phi_0, mach_06, :, cg_cheio)));
plot(dados.alpha, data, 'LineWidth', 1)
hold on
for caso = 1:length(airbrake)
    M_airbrake = airbrake(caso).M_airbrake;
    data = reshape(M_airbrake.CM(phi_0, mach_06, :, cg_cheio), 1, length(M_airbrake.CM(phi_0, mach_06, :, cg_cheio)));
    plot(dados.alpha, data, 'LineWidth', 1)
    hold on
end
    hold off
    title('$C_M$ vs AoA ($Mach = 0.6$) for different airbrake axial positions', 'Interpreter','latex');
    ylabel('$C_M$', 'Interpreter','latex');
    xlabel('Angle of Attack', 'Interpreter','latex');
    legend show
    legend({'No Airbrake', 'X = 0.5 m', 'X = 1.0 m','X = 1.5 m','X = 2 m'}, 'Location', 'northwest', 'Interpreter','latex')

if savefigs
    file = ['Graphics/CMvsAoA_position_test_', datestr(clock,'YYYY_mm_dd'), '.png'];
    saveas(gcf, file);
end