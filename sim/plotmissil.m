save_plots = 0;
end_plot = 0;
while ~end_plot
    imenu = menu('Plot 3D','Vel/Mach','Position x time','Trajectory', ...
        'Angles of Attack','Angular Velocities (p,q,r)', ...
        'Accelerations','Euler Angles','Aero Forces , CG(t)','Prop Forces',...
        'Aero Moments','Propulsive Moments','Wind Param.','End');
    %close all
    switch imenu
        case 1 % Velocities and Mach
            subplot(221);
            plot(Vb.Time,Vb.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('Vx (m/s)');
            
            subplot(222); 
            plot(Vb.Time,Vb.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('Vy');
            
            subplot(223); 
            plot(Vb.Time,Vb.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('Vz');
            
            subplot(224); 
            plot(Mach.Time,Mach.Data); grid;
            xlabel ('t (s)');
            ylabel ('Mach');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/velocities.png');
            end

        case 2  % Position x time
            subplot(221);
            plot(Xe.Time,Xe.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('Xe (m)');
            
            subplot(222);
            plot(Xe.Time,Xe.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('Ye (m)');
            
            subplot(223);
            plot(Xe.Time,-Xe.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('Ze Sea Level (m)');
            
            subplot(224);
            plot(Xe.Time,-Xe.Data(:,3)-D.Alt0); grid;
            xlabel ('t (s)');
            ylabel ('Ze Ground Level (m)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/position.png');
            end
            
        case 3  % Trajectory
            subplot(221);
            plot(Xe.Data(:,1),-Xe.Data(:,3)); grid;
            xlabel ('Xe (m)');
            ylabel ('Ze (m)');
            axis('equal');
            
            subplot(222);
            plot(Xe.Data(:,1),Xe.Data(:,2)); grid;
            xlabel ('Xe (m)');
            ylabel ('Ye (m)');
            axis('equal');
            
            subplot(223);
            plot(Xe.Data(:,2),-Xe.Data(:,3)); grid;
            xlabel ('Ye (m)');
            ylabel ('Ze (m)');
            axis('equal');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/trajectory.png');
            end
            
        case 4  % Angles of Attack
            subplot(221);
            plot(Alfa.Time,Alfa.Data/D2R); grid;
            xlabel ('t (s)');
            ylabel ('Alfa (graus)');
            
            subplot(222);
            plot(Beta.Time,Beta.Data/D2R); grid;
            xlabel ('t (s)');
            ylabel ('Beta (graus)');
            
            subplot(223);
            plot(Phi.Time,Phi.Data/D2R); grid;
            xlabel ('t (s)');
            ylabel ('Phi (graus)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/aoa.png');
            end
         
        case 5  % p, q, r 
            subplot(221);
            plot(wb.Time,wb.Data(:,1)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('p (graus/s)');
            
            subplot(222);
            plot(wb.Time,wb.Data(:,2)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('q (graus/s)');
            
            subplot(223);
            plot(wb.Time,wb.Data(:,3)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('r (graus/s)');
            
             subplot(224);
            plot(CGa.Time,CGa.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('CG ref :coifa');
                 
            if (save_plots)
                saveas(gcf, 'LASC_Images/pqr.png');
            end
            
        case 6  % Ax, Ay, Az
            subplot(221);
            plot(Ab.Time,Ab.Data(:,1)/g); grid;
            xlabel ('t (s)');
            ylabel ('A (g)'); %x (m/s2)
            
            subplot(222);
            plot(Ab.Time,Ab.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('Ay (m/s2)');
            
            subplot(223);
            plot(Ab.Time,Ab.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('Az (m/s2)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/acceleration.png');
            end
            
        case 7  % Euler Angles
            subplot(221);
            plot(Euler.Time,Euler.Data(:,3)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('psi (graus)');
            
            subplot(222);
            plot(Euler.Time,Euler.Data(:,2)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('teta (graus)');
             
            subplot(223);
            plot(Euler.Time,Euler.Data(:,1)/D2R); grid;
            xlabel ('t (s)');
            ylabel ('phi (graus)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/euler_angles.png');
            end
            
        case 8  % Aero Forces
            subplot(221);
            plot(FAer.Time,FAer.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('FAer_x (N)');
            
            subplot(222);
            plot(FAer.Time,FAer.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('FAer_y (N)');
            
            subplot(223);
            plot(FAer.Time,FAer.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('FAer_z (N)');
            
            
            subplot(224);
            plot(XCPefe.Time,-XCPefe.Data); grid;
            %plot(XCP.Time,(-XCP.Data+XCG.data(:,1))/D.L); grid;
            xlabel ('t (s)');
            ylabel ('Margem est�tica');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/aero_forces.png');
            end
            
        case 9  % Propulsive Forces
            subplot(221);
            plot(FProp.Time,FProp.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('FProp_x (N)');
            
            subplot(222);
            plot(FProp.Time,FProp.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('FProp_y (N)');
            
            subplot(223);
            plot(FProp.Time,FProp.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('FProp_z (N)');
            
            

            subplot(224);
            plot(FProp.Time,FProp.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('FProp (N)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/prop_forces.png');
            end
            
        case 10  % Aero Moments
            subplot(221);
            plot(MAer.Time,MAer.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('MAer_x (Nm)');
            
            subplot(222);
            plot(MAer.Time,MAer.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('MAer_y (Nm)');
            
            subplot(223);
            plot(MAer.Time,MAer.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('MAer_z (Nm)');
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/aero_moments.png');
            end
            
            
        case 11  % Propulsive Moments
            subplot(221);
            plot(TorqProp.Time,TorqProp.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('TorqProp_x (Nm)');
            
            subplot(222);
            plot(TorqProp.Time,TorqProp.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('TorqProp_y (Nm)');
            
            subplot(223);
            plot(TorqProp.Time,TorqProp.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('TorqProp_z (Nm)');

            if (save_plots)
                saveas(gcf, 'LASC_Images/prop_moments.png');
            end
           
            
        case 12  % Wind Parameters
            subplot(231);
            plot(Vbwind.Time,Vbwind.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('Vb_wind_N');
            
            subplot(232);
            plot(Vbwind.Time,Vbwind.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('Vb_wind_E');
            
            subplot(233);
            plot(Vbwind.Time,Vbwind.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('Vb_wind_D');
            
            subplot(234);
            plot(wbwind.Time,wbwind.Data(:,1)); grid;
            xlabel ('t (s)');
            ylabel ('wb_wind_eixoN');
            
            subplot(235);
            plot(wbwind.Time,wbwind.Data(:,2)); grid;
            xlabel ('t (s)');
            ylabel ('wb_wind_eixoE');
            aerodinamica
            subplot(236);
            plot(wbwind.Time,wbwind.Data(:,3)); grid;
            xlabel ('t (s)');
            ylabel ('wb_wind_eixoD');
            
            
            if (save_plots)
                saveas(gcf, 'LASC_Images/wind_param.png');
            end
        case 13 % End
            end_plot = 1;
    end
end