format compact; clc; clear; close all;
%This code is designed to graph the static stress concentration
%factor, kts, for a round shaft with shoulder fillet in Torsion
A=linspace(0.01,0.3,1000);
B=[1.09,1.2,1.33,2];
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
        if (0.25<=hr(i)) && (hr(i)<=4.0)
    C1(i)=0.953+0.680*sqrt(hr(i))-0.053*hr(i);
    C2(i)=-.493-1.820*sqrt(hr(i))+0.517*hr(i);
    C3(i)=1.621+.908*sqrt(hr(i))-.529*hr(i);
    C4(i)=-1.081+.232*sqrt(hr(i))+.065*hr(i);
        else
            C1(i)=NaN;
            C2(i)=NaN;
            C3(i)=NaN;
            C4(i)=NaN;
        end
    end
%Stress Concentration
    % Compute kt
    kts = C1 + C2 .* hD + C3 .* (hD).^2 + C4 .* (hD).^3;
    
    % Plot A vs. kt
    plot(A, kts, 'DisplayName', sprintf('B = %.2f', B));
end

% Label the axes
xlabel('r/d');
ylabel('kts');
%title('Torsion Stress Concentration Factor');
legend;
hold off;

