Nath�lia Matos
Data:06/09/2021

Sim_completo_RDX_q.m:
c�digo principal da Simula��o 6DOF para RDX2021
% refer�ncia: 
% Sim_completo git hut download feito em 05/05/2021

SIM_6DOF_completo_qnathy.slx:
% simulink SIM_6DOF_completo.slx do github alterado:
% - utiliza quat�rnion
% - Os dados aerodin�micos est�o em uma struct M
% - n�o utiliza a matriz do XCP pois � desnecess�ria
% observa��es:
% - cg � em rela��o a tubeira
% - cga � em rela��o a coifa
% - Mxyz = Maer+Mprop


Sim_completo_RDX_q_comparaPeixoto.m:
% c�digo principal da Simula��o 6DOF para RDX2021
% refer�ncias:
% Sim_completo git hut data 05/05/2021
% TG peixoto
[Recomendo utilizar este para simula��o]


SIM_6DOF_completo_qnathy_comparaPeixoto.slx:
% simulink SIM_6DOF_completo.slx do TG do Peixoto alterado:
% - utiliza quat�rnion
% - Os dados aerodin�micos est�o em uma struct M
%observa��es:
% - n�o utiliza a matriz do XCP
% - cg=cga � em rela��o a coifa
% - In�rcia em rela��o ao CG
% - Mxyz = Maer


novoCortaEmpuxo_nathy.m:
Alterado pois tive que zerar o empuxo ap�s o tempo de queima. Fiz mais coment�rios

plotmissil.m: n�o fiz altera��es

rampa_nathy.m:
[saida] = rampa_nathy(D,rmp,c)

N�o alterei a l�gica. Apenas fiz uma organiza��o de argumentos de acordo com as fun��es principais em rela��o a fun��o original rampa.m. 

Ref Git Hub:
pasta com os arquivos extra�dos do github e utilizados como refer�ncia


LASC_Images:
pasta com imagens salvas do plotmissil.m

ENTRADAS:
pasta com os arquivos de entrada utilizados pelos c�digos principais






