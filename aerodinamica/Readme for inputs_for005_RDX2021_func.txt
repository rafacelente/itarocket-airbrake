Refer�ncias: 
AED-TO-MVO
Local: Ita Rocket Design/Mec�nica de Voo/RDX/AED

AED-TO-MVO_V3
Local: Ita Rocket Design/Aerodin�mica/AED-TO-MVO-NEW

Obten��o das entradas para a obten��o do arquivo for005

entradas:
dref:  Di�metro do foguete (m)
L: Comprimento do foguete
Alt0: Altitude inicial do foguete

Defini��es necess�rias: 
1. Inputfor005.CARD: Control Card
2. Inputfor005.REFQ: Reference Quantities
InputBody
3. Inputfor005.AXIBOD: Axisymmetric Body Geometry
InputBody
InputTransicao
InputBocalMotor
4. Inputfor005.FINSETN: Fin descriptions by fin set N
InputEmpenas
5. InputDEFLCT: Panel incidence (deflection) values
6. InputFLTCON: Flight Conditions (Angles of attack, Altitudes, etc.)

Ltotal: comprimento total
Tipo: tipo de coifa
fineness: raz�o entre comprimento e di�metro da coifa
Transicao: h� transi��o?
BocalMotor: h� bocal de sa�da do motor?
Se houver transi��o:
	- DiametroDepois: o novo diametro (mm)
	- XIniTransicao: o ponto de in�cio de transi��o (mm)
	- ComprimentoTransicao: comprimento transicao no eixo X (mm)

fun��es:
[OutputBody] = Gera_BodyRocket(InputBody,Body)
[X,R]=Gera_geom_Coifa( Tipo,npontos,Diametro,fineness )
empenas = Gera_Empenas(body,empenas,Inputs)


sa�da: 
for005
