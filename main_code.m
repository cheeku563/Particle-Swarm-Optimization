clc;
clear;
myfunction = inline('exp(-0.2*sqrt(x1+x2))*sin(x1)*cos(1.2*x2)');
gfunc = inline('exp(0.012*(x1^2))-1-x2');
g_max = gfunc(4*pi,0);
np = 50;
maxit=100;
r1 = 0+4*pi.*rand(np,1);
r2 = 0+2*pi.*rand(np,1);
%disp(r1(6,1));
%disp(r2(6,1));
c1 = 2;
c2 = 2;
w = 1;
cost = zeros(np,1);
g    = zeros(np,1);
v1 = 0.25*4*pi.*rand(np,1);
v2 = 0.25*2*pi.*rand(np,1);
 MaxVelocity1 = 0.2*(4*pi);
 MinVelocity1 = -MaxVelocity1;
 
 MaxVelocity2 = 0.2*(2*pi);
 MinVelocity2= -MaxVelocity2;
 

for i=1:np;
    cost(i,1)= myfunction(r1(i,1),r2(i,1));
    g(i,1)=gfunc(r1(i,1),r2(i,1))/g_max;
end
Pbest1 = zeros(np,1);
Pbest2 = zeros(np,1);
Bestcost = zeros(np,1);
iterationcosts  = zeros(maxit,1);
Gbest = inf;
for i= 1:np;
    Pbest1(i,1)=r1(i,1);
    Pbest2(i,1)=r2(i,1);
    Bestcost(i,1) = gfunc(Pbest1(i,1),Pbest2(i,1));
     if Bestcost(i,1) < Gbest
       Gbest = Bestcost(i,1);
     end
end



for j=1:maxit
      w = w*(0.5+(1/2*(ln(j)+1));
    for i=1:np
        
        v1(i,1)=w*v1(i,1)+c1*rand*(Pbest1(i,1)-r1(i,1))+c2*rand*(Gbest-r1(i,1));
        v2(i,1)=w*v2(i,1)+c1*rand*(Pbest2(i,1)-r2(i,1))+c2*rand*(Gbest-r2(i,1));
            v1(i,1) =  max(v1(i,1), MinVelocity1);
            v1(i,1) =  min(v1(i,1), MaxVelocity1);
            v2(i,1) =  max(v2(i,1), MinVelocity2);
            v2(i,1) =  min(v2(i,1), MaxVelocity2);
            
       % if i==6
        %    disp([v1(6,1),v2(6,1)]);
        %end
            
        r1(i,1)=r1(i,1)+v1(i,1);
        r2(i,1)=r2(i,1)+v2(i,1);  
        
        r1(i,1) = max(r1(i,1),0);
        r1(i,1) = min(r1(i,1),4*pi);
        r2(i,1) = max(r2(i,1),0);
        r2(i,1) = min(r2(i,1),2*pi);
        %if i ==6
        %disp([r1(6,1),r2(6,1)]);
        %end
        
       
        cost(i,1) = myfunction(r1(i,1),r2(i,1));
        g(i,1) = gfunc(r1(i,1),r2(i,1))/g_max;
        if g(i,1) > 0
             if  g(i,1) <= gfunc(Pbest1(i,1),Pbest2(i,1))/g_max
              
                Pbest1(i,1) = r1(i,1);
                Pbest2(i,1) = r2(i,1);
                Bestcost(i,1) = gfunc(r1(i,1),r2(i,1));
             end
             if  g(i,1) == gfunc(Pbest1(i,1),Pbest2(i,1))
                 if cost(i,1) <= myfunction(Pbest1(i,1),Pbest2(i,1))
                   Pbest1(i,1) = r1(i,1);
                   Pbest2(i,1) = r2(i,1);
                   Bestcost(i,1) = gfunc(r1(i,1),r2(i,1));
                 end
             end
        else
             if cost(i,1) <= myfunction(Pbest1(i,1),Pbest2(i,1))
                   Pbest1(i,1) = r1(i,1);
                   Pbest2(i,1) = r2(i,1);
                   Bestcost(i,1) = gfunc(r1(i,1),r2(i,1));
             end 
        end
    end
    counter = 0
    for i=1:np-1
          if  gfunc(Pbest1(i,1),Pbest2(i,1)) == gfunc(Pbest1(i+1,1),Pbest2(i+1,1))
              counter++;
          end
    
    end
    if counter!=0
    for i=1:np
        
        if gfunc(Pbest1(i,1),Pbest2(i,1)) < Gbest
    
           Gbest = gfunc(Pbest1(i,1),Pbest2(i,1))
        end
    end
    else 
        for i=1:np
       if cost(i,1) <= myfunction(Pbest1(i,1),Pbest2(i,1))
            
           Gbest = gfunc(Pbest1(i,1),Pbest2(i,1));
        
       end
    end
    
       
  
    

    
      iterationcosts(j,1) = Gbest;
      
      X=['the best cost for iteration number :',num2str(j),'is :',num2str(iterationcosts(j,1))];
      disp(X);
    
      
end
