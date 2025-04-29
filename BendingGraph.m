format compact; clc; clear; close all;
%This code is designed to graph the static stress concentration
%factor, kt, for a round shaft with shoulder fillet in Bending
A=linspace(0.01,0.3,1000);
B=[1.02,1.05,1.1,1.5,3];
figure;
hold on;
grid on;
for B=B
    hr=0.5*(B-1)./A;
    hD =1-1/B;
    C1=zeros(size(hr));
    C2=zeros(size(hr));
    C3=zeros(size(hr));
    C4=zeros(size(hr));
    for i=1:length(hr)
        if (0.25<=hr(i)) && (hr(i)<2.0)
            C1(i)=0.927+1.149*sqrt(hr(i))-0.086*hr(i);
            C2(i)=0.015-3.281*sqrt(hr(i))+0.837*hr(i);
            C3(i)=0.847+1.716*sqrt(hr(i))-0.506*hr(i);
            C4(i)=-0.790+0.417*sqrt(hr(i))-0.246*hr(i);
        elseif (2.0<hr(i)) && (hr(i)<=20)
            C1(i)=1.225+0.831*sqrt(hr(i))-0.010*hr(i);
            C2(i)=-3.790+0.958*sqrt(hr(i))-0.257*hr(i);
            C3(i)=7.374-4.834*sqrt(hr(i))+0.862*hr(i);
            C4(i)=-3.809+3.046*sqrt(hr(i))-0.595*hr(i);
        elseif (hr(i)==2.0)
            C1a(i)=0.927+1.149*sqrt(hr(i))-0.086*hr(i);
            C2a(i)=0.015-3.281*sqrt(hr(i))+0.837*hr(i);
            C3a(i)=0.847+1.716*sqrt(hr(i))-0.506*hr(i);
            C4a(i)=-0.790+0.417*sqrt(hr(i))-0.246*hr(i);
            C1b(i)=1.225+0.831*sqrt(hr(i))-0.010*hr(i);
            C2b(i)=-3.790+0.958*sqrt(hr(i))-0.257*hr(i);
            C3b(i)=7.374-4.834*sqrt(hr(i))+0.862*hr(i);
            C4b(i)=-3.809+3.046*sqrt(hr(i))-0.595*hr(i);
        else
            C1(i)=NaN;
            C2(i)=NaN;
            C3(i)=NaN;
            C4(i)=NaN;
        end
    end
%Stress Concentration
if (hr(i)~=2.0)
    kt=C1+C2.*hD+C3.*(hD).^2+C4.*(hD).^3;
else
    kta=C1a+C2a.*hD+C3a.*(hD).^2+C4a.*(hD).^3;
    ktb=C1b+C2b.*hD+C3b.*(hD).^2+C4b.*(hD).^3;
    kt=(kta+ktb)/2;
end
    plot(A, kt, 'DisplayName', sprintf('B = %.2f', B));
end
xlabel('r/d');
ylabel('kt');
title('Bending Stress Concentration Factor');
legend;
hold off;
