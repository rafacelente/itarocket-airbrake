function search(texto,file)
% fun��o que localiza a string texto no arquivo file
% e reposiciona a posi��o do indicador do arquivo
% a posi��o � indicada em bytes em rela��o ao come�o do arquivo
% sa�da: aqui (struct com linha e coluna)


% par�metros auxiliares
flag=0;  % encontrar a string
% aqui: localiza a atual posi��o do indicador do arquivo para iniciar an�lise
% a: para percorrer a linha a fim de encontrar o texto
% c: para percorrer a linha a fim de encontrar o caracter '=' ap�s o texto
% encontrado

while flag==0    
    % ftell: retorna a posi��o do atual indicador do arquivo. 
    aqui=ftell(file);  
    % fgetl: retorna a pr�xima linha do arquivo em rela��o a linha do atual indicador
    linha=fgetl(file); 
    for a=1:(length(linha)-length(texto)+1)  % percurrendo a linha
        if strcmp(linha(a:a-1+length(texto)),texto) % se encontra o texto na linha
            flag=1;
            % fseek(file,b+a,-1): reposiciona o indicador de posi��o de byte no arquivo
            % com OFFSET em rela��o ao in�cio do arquivo
            aqui = aqui+a; % posi��o do primeiro caracter do texto
            fseek(file,aqui-1,-1);             
        end
    end
end
 
end