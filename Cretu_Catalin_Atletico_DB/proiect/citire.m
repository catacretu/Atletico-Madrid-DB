function[g,a,meciuri,post]=citire(x)
d=strcat('date/',num2str(x),'.xlsx');
g=xlsread(d,'SHEET1','D2');
a=xlsread(d,'SHEET1','E2');
meciuri=xlsread(d,'SHEET1','B2');
[~,aux]=xlsread(d,'SHEET1','C2');%NOTA:~ are rolul de a ignora citirea unui...
%parametru
post=aux{1};
end