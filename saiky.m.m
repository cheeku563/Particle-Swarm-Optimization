myfunction = inline('exp(-0.2*sqrt(x1+x2))*sin(x1)*cos(1.2*x2)');
const_g = inline('exp(0.012*(x1^2))-1-x2');
test_h = inline('0');
g_max = const_g(2*pi,0);
np = 50;
maxit=100;
r1 = 0+2*pi.*rand(np,1);
r2 = 0+4*pi.*rand(np,1);
c1 = 2;
c2 = 2;
w = 1;
cost = zeros(np,1);
g    = zeros(np,1);
v1 = 0.25*2*pi.*rand(np,1);
v2 = 0.25*4*pi.*rand(np,1);
for i=1:np;
    cost(i,1)= myfunction(r1(i,1),r2(i,1));
end
Pbest1 = zeros(np,1);
Pbest2 = zeros(np,1);
Bestcost = zeros(np,1);
iterationcosts  = zeros(maxit,1);
Gbest = inf;
for i= 1:np;
    Pbest1(i,1)=r1(i,1);
    Pbest2(i,1)=r2(i,1);
    Bestcost(i,1) = myfunction(Pbest1(i,1),Pbest2(i,1));
  if Bestcost(i,1) < Gbest
      Gbest = Bestcost(i,1);
  end
end


for j=1:maxit
    
    for i=1:np
        
        v1(i,1)=w*v1(i,1)+c1*rand*(Pbest1(i,1)-r1(i,1))+c2*rand*(Gbest-r1(i,1));
        r1(i,1)=r1(i,1)+v1(i,1);
        v2(i,1)=w*v2(i,1)+c1*rand*(Pbest2(i,1)-r2(i,1))+c2*rand*(Gbest-r2(i,1));
        r2(i,1)=r2(i,1)+v2(i,1);     
        r1(i,1) = max(r1(i,1),0);
        r1(i,1) = min(r1(i,1),2*pi);
        r2(i,1) = max(r2(i,1),0);
        r2(i,1) = min(r2(i,1),4*pi);
        
        
        cost(i,1) = myfunction(r1(i,1),r2(i,1));
       
         
             if cost(i,1) < myfunction(r1(i,1),r2(i,1))
                   Pbest1(i,1) = r1(i,1);
                   Pbest2(i,1) = r2(i,1);
                   Bestcost(i,1) = myfunction(Pbest1(i,1),Pbest2(i,1));
            
       
                    
            if Bestcost(i,1) < Gbest
                    Gbest = Bestcost(i,1);
                    
            end
            
          
    end
    
  end  
      iterationcosts(j,1) = Gbest;
      
      X=['the best cost for iteration number :',num2str(j),'is :',num2str(iterationcosts(j,1))];
      disp(X);
      
    
w =w*0.99;

    
end      
        
        
        
        