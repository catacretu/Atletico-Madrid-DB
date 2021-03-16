clear all;
close all;
clc;
x=7;%numarul jucatorului care va fi afisat
poz=18;%pozitia in fisierul text a jucatorului x
T=4;%perioada de anii 
[G,A,meciuri,post]=citire(x);
[C]=calculeaza(x,T,G,A,meciuri,post);
file=fopen('nume.txt');
aux=textscan(file,'%s');%citirea fisierului text
N=aux{1};%salvarea unei adrese catre vectorul de elemente citit din...
%fisierul text
interfata(G,A,C,N,x,poz,post,T,meciuri);
