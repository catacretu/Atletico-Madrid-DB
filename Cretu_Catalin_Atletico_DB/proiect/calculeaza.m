function [m] =calculeaza(x,T,g,a,meciuri,post)
%inceput citire
d=strcat('date/',num2str(x),'.xlsx');

trofee=xlsread(d,'SHEET1','F2');
[~,nat]=xlsread(d,'SHEET1','G2');
[~,campionat]=xlsread(d,'SHEET1','H2');
 if(campionat{1}=='La Liga')
   c=1;
 end
competitii=xlsread(d,'SHEET1','I2');
varsta=xlsread(d,'SHEET1','J2');
%sfarsit citire
%atribuirea unui valori in functie de nationalitate
switch nat{1}
    case 'Sloven'
        n=0.2;
    case 'Ghanez'
        n=0.25;
    case 'Muntenegrean'
        n=0.3;
    case 'Columbian'
        n=0.75;
    case 'Argentinian'
        n=0.75;
    otherwise
        n=1;
end
%sfarsit nationalitate
%calcularea recursiva a parametriilor unui jucator raportata la o durata de
%timp T
ok=0;        
for i=1:T
    if(ok==0)
  meciuriv(i)=meciuri;
  gv(i)=g;
  av(i)=a;
  ok=1;
  i=i+1;
   end
if(varsta<20) 
    ev=1;
    meciuriv(i)=meciuriv(i-1)+3;
    gv(i)=gv(i-1)+3;
    av(i)=av(i-1)+3;
    varsta=varsta+1;
else
    if(varsta<28)
    ev=0.9;
    meciuriv(i)=meciuriv(i-1)+2;
    gv(i)=gv(i-1)+2;
    av(i)=av(i-1)+2;
    varsta=varsta+1;
    else
    if(varsta<30)
    ev=0.8;
    meciuriv(i)=meciuriv(i-1)+1;
    gv(i)=gv(i-1)+1;
    av(i)=av(i-1)+1;
    varsta=varsta+1;
    else
     if(varsta<33)
    ev=0.6;
    meciuriv(i)=meciuriv(i-1)-1;
    if(g>=1)
      gv(i)=g-1;
      g=g-1;
    else gv(i)=0;
    end
    if(a>=1)
      av(i)=a-1;
      a=a-1;
    else av(i)=0;
    end
    varsta=varsta+1;
     else
     if(varsta<35)
         meciuriv(i)=meciuriv(i-1)-2;
         if(g>=1)
      gv(i)=g-1;
      g=g-1;
    else gv(i)=0;
    end
    if(a>=1)
      av(i)=a-1;
      a=a-1;
    else av(i)=0;
    end
    ev=0.2;
    varsta=varsta+1;
     else
         if(varsta>=35)
             meciuriv(i)=0;
             gv(i)=0;
             av(i)=0;
             varsta=varsta+1;
         end
     end
    end
    end
    end
end
end
%calcularea unei valori intermediare ce contine procente din fiecare
%parametru a unui jucator
switch post
    case'Portar'
 m=(30/100)*meciuriv+(30/100)*gv-(15/100)*av+(10/100)*trofee+(5/100)*competitii...
    +c+ev+n;     
    otherwise
m=(30/100)*meciuriv+(30/100)*gv+(15/100)*av+(10/100)*trofee+(5/100)*competitii...
    +c+ev+n;
end
end
%sfarsit calcul valoare intermediara
