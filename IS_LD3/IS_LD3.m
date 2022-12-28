clc; clear all; close all;

% Sugeneruojamos iejimo(x) ir  isejimo(d) reiksmes
x = 0.1:1/22:1;
d = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;



% Surandami lokalus maksimumai
[p,n1] = findpeaks(d);
for i = 1 : length(n1)
    c(i)= x(n1(i));
end

% Pagal grafika nustatomi r1 ir r2
r1 = 0.36 - 0.19;
r2 = 0.89 - 0.73;
%Sugeneruojami svoriai
w1 = randn(1);
w2 = randn(1);
w0 = randn(1);

% Tinklas apmokomas
eta = 0.1;
for j=1:100000
    for n=1:length(x)     
        F_1=exp(-(((x(n)-c(1))^2)/(2*r1^2)));
        F_2=exp(-(((x(n)-c(2))^2)/(2*r2^2)));
        y=F_1*w1+F_2*w2+w0;
        e=d(n)-y;
        
        w1=w1+eta*e*F_1;
        w2=w2+eta*e*F_2;
        w0=w0+eta*e;
    end
end

% Tinklas isbandomas
    for n=1:length(x)     
        F_1=exp(-(((x(n)-c(1))^2)/(2*r1^2)));
        F_2=exp(-(((x(n)-c(2))^2)/(2*r2^2)));
		
        y(n)=F_1*w1+F_2*w2+w0;
       
    end
	
% Originalios funkcijos ir funkcijos aproksimacijos atvaizdavimas
plot(x,d,x,y);
legend("Originali funkcija", "Funkcijos aproksimacija");
   



