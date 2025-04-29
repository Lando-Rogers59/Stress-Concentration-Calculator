format compact; clc; clear; close all;
%This Function is designed to find the static stress concentration
%factor, kts, for a round shaft with shoulder fillet in torsion or in
%bending
choice=input('Torsion or Bending: ','s');
if strcmpi(choice,'Torsion')
    A=input('Enter the r/d ratio:');
    if (A>0.3)
        disp('Invalid r/d ratio')
        return
elseif (A<0)
        disp('Invalid r/d ratio')
        return
end
B=input('Enter the D/d ratio:');
if (B<1)
    disp('Invalid D/d ratio')
    return
elseif (B>3)
    disp('Invalid D/d ratio')
    return
end
hr=.5*(B-1)/A;
hD=1-1/B;
if (0.25<=hr) && (hr<=4.0)
    C1=0.953+0.680*sqrt(hr)-0.053*hr;
    C2=-.493-1.820*sqrt(hr)+0.517*hr;
    C3=1.621+.908*sqrt(hr)-.529*hr;
    C4=-1.081+.232*sqrt(hr)+.065*hr;
elseif (hr<0.25)
        disp('Out of Valid Range')
        return
elseif (hr>4.0)
    disp('Out of Valid Range')
    return
end
elseif strcmpi(choice, 'Bending')
    A=input('Enter the r/d ratio: ');
    if (A>0.3)
        disp('Invalid r/d ratio')
        return
elseif (A<0)
        disp('Invalid r/d ratio')
        return
end
B=input('Enter the D/d ratio: ');
if (B<1)
    disp('Invalid D/d ratio')
    return
elseif (B>3)
    disp('Invalid D/d ratio')
    return
end
hr=.5*(B-1)/A;
hD=1-1/B;
if (0.25<=hr) && (hr<2.0)
    C1=0.927+1.149*sqrt(hr)-0.086*hr;
    C2=0.015-3.281*sqrt(hr)+0.837*hr;
    C3=0.847+1.716*sqrt(hr)-.506*hr;
    C4=-.790+0.417*sqrt(hr)-0.246*hr;
elseif (2.0<hr) && (hr<=20)
    C1=1.225+0.831*sqrt(hr)-0.010*hr;
    C2=-3.790+0.958*sqrt(hr)-0.257*hr;
    C3=7.374-4.834*sqrt(hr)+0.862*hr;
    C4=-3.809+3.046*sqrt(hr)-0.595*hr;
elseif (hr==2.0)
        C1=(0.927+1.149*sqrt(hr)-0.086*hr+1.225+0.831*sqrt(hr)-0.010*hr)/2;
        C2=(0.015-3.281*sqrt(hr)+0.837*hr-3.790+0.958*sqrt(hr)-0.257*hr)/2;
        C3=(0.847+1.716*sqrt(hr)-.506*hr+7.374-4.834*sqrt(hr)+0.862*hr)/2;
        C4=(-.790+0.417*sqrt(hr)-0.246*hr-3.809+3.046*sqrt(hr)-0.595*hr)/2;
elseif (hr<0.25)
        disp('Out of Valid Range')
        return
elseif (hr>20)
    disp('Out of Valid Range')
    return
end
else
    disp('Invalid Entry: Type "Torsion" or "Bending"')
    return
end
Stress_Concentration_Factor=C1+C2*hD+C3*(hD)^2+C4*(hD)^3



        
