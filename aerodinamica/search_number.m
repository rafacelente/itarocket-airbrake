function Number = search_number(linha,Ta,Tb)
% fun��o reposiciona a posi��o do indicador em uma linha ap�s um trecho da
% com caracteres vazias ' '
% a posi��o � indicada em bytes em rela��o ao come�o do arquivo
% sa�da: aqui (struct com linha e coluna)


% par�metros auxiliares
flag=0;  % encontrar o numero
% aqui: localiza a atual posi��o do indicador do arquivo para iniciar an�lise
% a: para percorrer a linha a fim de encontrar o texto
% c: para percorrer a linha a fim de encontrar o caracter '=' ap�s o texto
% encontrado
iNumber = 0;

for a=1:(length(linha))  % percurrendo a linha
    
    % est� em "   " e encontra um caracter
    if strcmp(linha(a),' ')==0&&flag==0
        iNumber = iNumber+1;
        Init= a;
        flag = 1;
    end
    % se um numero imendou com outro
    if strcmp(linha(a),' ')==0&&strcmp(linha(a),'E')==0
        if iNumber==1
            if (a-1)==Ta
                if flag==1
                    End=a-1;
                    Number(iNumber)=str2double(linha(Init:End));
                    EndAnt=End;
                    iNumber=iNumber+1;
                    Init = a;
                    flag=1;
                elseif flag==2
                    EndExp=a-1;
                    Number(iNumber)=str2double(linha(Init:End))^(str2double(linha(InitExp:EndExp)));
                    EndAnt=EndExp;
                    iNumber=iNumber+1;
                    Init = a;
                    flag=1;
                end
            end
        elseif (a-EndAnt-1)==Tb
            if flag==1
                End=a-1;
                Number(iNumber)=str2double(linha(Init:End));
                EndAnt=End;
                iNumber=iNumber+1;
                Init = a;
                flag=1;
            elseif flag==2
                EndExp=a-1;
                Number(iNumber)=str2double(linha(Init:End))^(str2double(linha(InitExp:EndExp)));
                EndAnt=EndExp;
                iNumber=iNumber+1;
                Init = a;
                flag=1;
            end
        end
    end
    
    % se encontrou um exponencial do numero
    if strcmp(linha(a),'E')==1&&flag==1
        End = a-1;
        InitExp = a+1;
        flat=2;
    end
    
    % T�rmino do n�mero inteiro
    if strcmp(linha(a),' ')==1&&flag==1
        End = a-1;
        Number(iNumber)=str2double(linha(Init:End));
        EndAnt=End;
        flag=0;
    end
    
    % T�rmino do n�mero exponencial
    if strcmp(linha(a),' ')==1&&flag==2
        EndExp = a-1;
        Number(iNumber)=str2double(linha(Init:End))^(str2double(linha(InitExp:EndExp)));
        EndAnt=EndExp;
        flag=0;
    end
    
    
    if a==length(linha)
        if flag==1
            End = a;
            Number(iNumber)=str2double(linha(Init:End));
        elseif flag==2
            EndExp = a;
            Number(iNumber)=str2double(linha(Init:End))^(str2double(linha(InitExp:EndExp)));
        end
    end
end
% excluido o alpha
Number = Number(2:end);
end