Refer�ncias: 
AED-TO-MVO
Local: Ita Rocket Design/Mec�nica de Voo/RDX/AED

AED-TO-MVO_V3
Local: Ita Rocket Design/Aerodin�mica/AED-TO-MVO-NEW

Gera��o dos dados aerodin�micos para o foguete da Rocket

Passo a passo para obter os dados de aerodin�micos de um foguete:

c�digo Principal: 
gera_coef.m
ou sua fun��o: gera_coef

entradas: 
dref: di�metro do foguete
L: comprimento total
Alt0: Altitude Inicial
delta: 
phif0: 
cg: 

1) gerar Entradas para o FOR005: inputs_for005_RDX2021.m
entradas:
dref:  Di�metro do foguete (m)
L: Comprimento do foguete
Alt0: Altitude inicial do foguete
dados: Struct com as vari�veis para obten��o dos coeficientes (delta,phi,alpha,mach,cg)

fun��es:
[OutputBody] = Gera_BodyRocket(InputBody,Body)
[X,R]=Gera_geom_Coifa( Tipo,npontos,Diametro,fineness )
[empenas, Out] = Gera_Empenas(body,empenas,Inputs)

sa�da: 
for005


2) Gerar coeficientes para diferentes dados: [M]=DATCOM_TO_MVO_RDX2021(dados,for005);

entradas:
dados: diferentes condi��es como rodar o Datcom
for005: entradas para gerar o for005

fun��es: 
gera_for005(for005)
[CN,CM,CA,CY,CLN,CLL,CL,CD,XCP,CNA,CMA,CYB,CLNB,CLLB,CNQ, CMQ, CAQ, CNAD, CMAD, CYR, CLNR, CLLR, CYP, CLNP ,CLLP, hinge] = DATCOMreader_nathy(caso,FINSET1,FINSET2,dados) % completo
ou 
[CN,CM,CA,CY,CLN,CLL,CD,CNQ, CMQ, CAQ, CNAD, CMAD, CYR, CLNR, CLLR,CYP,CLNP,CLLP]=DATCOMreader_nathy_reduzido('for006.dat',for005.FINSET1,for005.FINSET2,dados); % na din�mica s� usa esses coeficientes

sa�da:
M: struct com todas as matrizes de coeficientes para diferentes dados



