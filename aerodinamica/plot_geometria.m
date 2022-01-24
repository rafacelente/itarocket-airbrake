function plot_geometria(for005,InputEmpenas,OutEmpenas)
%--------------------------------------------------------------------------
%--- VISUALIZAR O DESENHO COM EMPENAS.---------
%--------------------------------------------------------------------------
if for005.FINSET1.has == 1

xe1 = linspace(0,OutEmpenas.x1,7)+for005.FINSET1.XLE(1);
ye1 = tand(OutEmpenas.AlphaAT)*(xe1-for005.FINSET1.XLE(1))+InputEmpenas.R;

pemp = ye1(end); % ponta da empena

% desenho reto da secao na ponta.
xe2 = linspace(0,OutEmpenas.Ctip,6)+xe1(end);
ye2 = linspace(pemp,pemp,6);


if(OutEmpenas.BetaSaida==90)
    xe3 = linspace(xe2(end),xe2(end),6);
    ye3a = linspace(InputEmpenas.R,pemp,6);
    ye3 = wrev(ye3a);
elseif (OutEmpenas.BetaSaida<90)
    xe3 = linspace(0,InputEmpenas.SPAN/(tand(InputEmpenas.BetaSaida)),6)+empenas.XLE(1)+OutEmpenas.CordaRaiz;
    ye3 = (xe3-empenas.XLE(1)-OutEmpenas.CordaRaiz)*tand(InputEmpenas.BetaSaida)+InputEmpenas.R;
else
    xe3 = linspace(0,-InputEmpenas.SPAN/(tand(InputEmpenas.BetaSaida)),6)+empenas.XLE(2)+OutEmpenas.Ctip;
    ye3 = (xe3-empenas.XLE(2)-OutEmpenas.Ctip)*tand(InputEmpenas.BetaSaida)+InputEmpenas.R+InputEmpenas.SPAN;
end
    
XEMP = [xe1 xe2 xe3];
YEMP = [ye1 ye2 ye3];
end

%% Desenho do airbrake

if (for005.AIRBRAKE.hasAirbrake && for005.AIRBRAKE.nBrakes == 4)
    L = for005.AXIBOD.X(length(for005.AXIBOD.X)); % Comprimento do foguete
    R = for005.AXIBOD.R(length(for005.AXIBOD.R) - 1); % Maior raio do foguete (Segundo o gera_BodyRocket é o de index 49);
    xa1 = for005.AIRBRAKE.positionBrakes;
    xa2 = for005.AIRBRAKE.positionBrakes + for005.AIRBRAKE.lBrakes;
    ya1 = R;
    ya2 = R + for005.AIRBRAKE.hBrakes;
    
    XAIR = [xa1 xa1 xa2 xa2];
    YAIR = [ya1 ya2 ya2 ya1];
end


%%

if for005.AXIBOD.option == 2
    h = figure(1); % Creating a figure
    plot(for005.AXIBOD.X, for005.AXIBOD.R ,'-k', 'LineWidth', 3);
    hold on;
    grid on;
    plot(for005.AXIBOD.X,-for005.AXIBOD.R,'-k', 'LineWidth', 3);
    plot(XEMP,YEMP,'-r', 'LineWidth', 2);
    plot(XEMP,-YEMP,'-r', 'LineWidth', 2);
    
    if (for005.AIRBRAKE.hasAirbrake)
        plot(XAIR,YAIR,'-g', 'LineWidth', 2);
        plot(XAIR,-YAIR,'-g', 'LineWidth', 2);
        legend('Body', '', 'Fins', '', 'Airbrake', '');
    else
        legend('Body', '', 'Fins', '');
    end
    
    title('Rocket Side View');
    axis equal;
    axis([0 4 -0.5 0.5]);
    hold off;
end
end