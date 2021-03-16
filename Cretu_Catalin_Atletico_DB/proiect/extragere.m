function [y]=extragere(i,poz)
b=char(i(poz));%algoritm de extragere a numarului unui jucator in momentul in 
%care acesta este selectat
if(b(2)>='0'||b(2)<='9')
    aux=strcat(b(1),b(2));
else 
    aux=b(1);
end
y=str2num(aux);
end
