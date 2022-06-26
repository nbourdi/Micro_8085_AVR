clear all;
close all;

T = 300:1:30000

#K1 = 15000./T + 20;
#K2 = 7000./T + 60;
K3 = 47000./T + 4;
K4 = 61000./T + 2;

#figure(1);
#plot(T, K1, color = 'm', "linewidth", 2.2);
#xlabel("Units")
#ylabel("Cost per unit")
#figure(2);
#plot(T, K2, color = 'r', "linewidth", 2.2);
#xlabel("Units")
#ylabel("Cost per unit")
figure(3);
plot(T, K3, color = 'b', "linewidth", 2.2);
xlabel("Units")
ylabel("Cost per unit")
figure(4);
plot(T, K4, color = 'k', "linewidth", 2.2);

xlabel("Units")
ylabel("Cost per unit")