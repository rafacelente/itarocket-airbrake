Refer�ncias: 
AED-TO-MVO
Local: Ita Rocket Design/Mec�nica de Voo/RDX/AED

AED-TO-MVO_V3
Local: Ita Rocket Design/Aerodin�mica/AED-TO-MVO-NEW

Gera��o dos dados aerodin�micos para o foguete da Rocket

Gerar coeficientes para diferentes dados: [M]=DATCOM_TO_MVO_M(dados,for005);

entradas:
dados: diferentes condi��es como rodar o Datcom
for005: entradas para gerar o for005

fun��es: 
gera_for005(for005): gera o arquivo for005 com as entradas em for005
!Misdat.exe: executa o datcom atrav�s do for005
[Mach,Alpha,CN,CM,CA,CY,CLN,CLL,CL,...                                CD,XCP,CNA,CMA,CYB,CLNB,CLLB,CNQ,...
CMQ, CAQ, CNAD, CMAD,CYR,CLNR,CLLR,...
CYP, CLNP, CLLP,hinge]=
DATCOMreader('for006.dat',for005.FINSET1,for005.FINSET2): leitura do arquivo for006 para obten��o das informa��es da simula��o do datcom

sa�da: 
M: struct com os coeficientes aerodin�micos de acordo com a varia��o dos dados






sa�da:
M: struct com todas as matrizes de coeficientes para diferentes dados



