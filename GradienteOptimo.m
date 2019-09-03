%Método del gradiente en varias variables

it = 0;
flag = true;
syms t;
%Función original
f=@(x1, x2, x3) x1^2+x2^2+2*x3^2-x1*x2-x2*x3-x1*x3;
%Tolerancia al error
e=0.001;
%Condiciones iniciales
x11 = 10; 
x12 = 10; 
x13 = 10;
%Derivadas parciales
dx1 =@(x1, x2, x3) 2*x1-x2-x3; 
aux_dx1 = 0;
dx2 =@(x1, x2, x3) 2*x2-x1-x3; 
aux_dx2 = 0;
dx3 =@(x1, x2, x3) 4*x3-x1-x2; 
aux_dx3 = 0;

while(flag) 
    %Para (10, 10, 10)
    aux_dx1 = 2*(x11)-(x12)-(x13);
    aux_dx2 = 2*x12-x11-x13;
    aux_dx3 = 4*x13-x11-x12;

    %Se hallan los valores de x1, x2, x3
    x1 = x11 + t*(-aux_dx1);
    x2 = x12 + t*(-aux_dx2);
    x3 = x13 + t*(-aux_dx3);
    
    %Dichos valores se reemplazan en la función
    f=x1^2+x2^2+2*x3^2-x1*x2-x2*x3-x1*x3;
    f11=diff(f, t);
    t_aux = solve(f11, t);
    
    %Nueva solución 
    x1=x11 + t_aux*(-aux_dx1);
    x2=x12 + t_aux*(-aux_dx2);
    x3=x13 + t_aux*(-aux_dx3);
    x11 = x1;
    x12 = x2;
    x13 = x3;
    %Evaluando en las derivadas la nueva solución
    aux_dx1 = 2*(x1)-(x1)-(x3);
    aux_dx2 = 2*x2-x1-x3;
    aux_dx3 = 4*x3-x1-x2;
    
    %Condicional de e
    if(aux_dx1 > e || aux_dx2 > e || aux_dx3 > e)
        it = it + 1;
    else
        it = it + 1;
        flag = false;
    end    
    [it, x1, x2, x3]
end 

