%%
clc
clear
w(1) = 1;
e = .05;
for i = 1:499
    w(i+1) = w(i) + e*(0-w(i));
end



figure('WindowState','maximized')
plot(w,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Extinction','Interpreter','latex')
xticks(0:50:500)
grid on
grid minor
saveas(gcf,'Fig1.png')


clear w;

w1(1)=0;
w2(1)=0;
w3(1)=0;
r1=rand(1,500) < 0.5;
r2=rand(1,500) < 0.25;
r3=rand(1,500) < 0.75;
for i=1:499
    w1(i+1)=w1(i)+e*(r1(i)-w1(i));
    w2(i+1)=w2(i)+e*(r2(i)-w2(i));
    w3(i+1)=w3(i)+e*(r3(i)-w3(i));
end
figure('WindowState','maximized')
subplot(3,1,1)
plot(w1,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Partial with $\alpha$ = 0.5','Interpreter','latex')
xticks(0:50:500)
yticks(0:.25:1)
hold on
yline(0.5,'r--')
grid on
grid minor
ylim([0 1])
yticks(0:.25:1)
subplot(3,1,2)
plot(w2,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Partial with $\alpha$ = 0.25','Interpreter','latex')
yticks(0:.25:1)
xticks(0:50:500)
hold on
yline(0.25,'r--')
grid on
grid minor
ylim([0 1])

subplot(3,1,3)
plot(w3,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Partial with $\alpha$ = 0.75','Interpreter','latex')
xticks(0:50:500)
hold on
yline(0.75,'r--')
yticks(0:.25:1)
grid on
grid minor
ylim([0 1])
saveas(gcf,'Fig2.png')
%%
clear w1 w2;
w1=zeros(1,700);
w2=zeros(1,700);
% w1(1:101) =1;
w2(1)=0;
e = .05;
for i = 1:199
    w1(i+1) = w1(i) + e*(1-w1(i));
end


for i = 200:699
    w1(i+1) = w1(i) + e*(1-w1(i)-w2(i));
    w2(i+1) = w2(i) + e*(1-w1(i)-w2(i));
end
w2(1:200)=NaN;
% t=-99:500;
figure('WindowState','maximized')
plot(w1,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Blocking','Interpreter','latex')
xticks(0:50:700)
hold on
plot(w2,'.','Markersize',10)
grid on
grid minor
hold on
xline(200,'g--','LineWidth',1)
legend('$W_1$','$W_2$','Start of Training','Interpreter','latex')
text(202,0.45,'$\Rightarrow$ Training','Interpreter','latex')
text(145,0.45,'Pre Training $\Leftarrow$','Interpreter','latex')
saveas(gcf,'Fig3.png')
%%
clear w1 w2;
w1(1) = 0;
w2(1)=0;
for i = 1:499
    w1(i+1) = w1(i) + e*(0-w1(i)-w2(i));
    w2(i+1) = w2(i) + e*(0-w1(i)-w2(i));
    w1(i+1) = w1(i) + e*(1-w1(i));
end

figure('WindowState','maximized')
plot(w1,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Inhibitory','Interpreter','latex')
xticks(0:50:500)
hold on
plot(w2,'.','Markersize',10)
legend('$W_1$','$W_2$','Interpreter','latex')
grid on
grid minor
saveas(gcf,'Fig4.png')
%%

clear w1 w2;
w1(1) = 0;
w2(1)=0;
for i = 1:499
    w1(i+1) = w1(i) + e*(1-w1(i)-w2(i));
    w2(i+1) = w2(i) + e*(1-w1(i)-w2(i));
end
figure('WindowState','maximized')
plot(w1,'.','Markersize',15)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Over Shadow with Same Learning Rate','Interpreter','latex')
xticks(0:50:500)
hold on
plot(w2,'.','Markersize',10)
legend('$W_1$','$W_2$','Interpreter','latex')
grid on
grid minor
ylim([0 1])
saveas(gcf,'Fig5.png')
%%
clear w1 w2;
w1(1) = 0;
w2(1)=0;
for i = 1:499
    w1(i+1) = w1(i) + 2*e*(1-w1(i)-w2(i));
    w2(i+1) = w2(i) + e*(1-w1(i)-w2(i));
end
figure('WindowState','maximized')
plot(w1,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Over Shadow wih Learning Rate for $S_1$ twice the Learning Rate for $S_2$','Interpreter','latex')
xticks(0:50:500)
hold on
plot(w2,'.','Markersize',10)
legend('$W_1$','$W_2$','Interpreter','latex')
grid on
grid minor
ylim([0 1])
saveas(gcf,'Fig6.png')
%%
clear w1 w2;
w1(1) = 0;
w2(1)=0;
for i = 1:499
    w1(i+1) = w1(i) + e*(1-w1(i)-w2(i));
    w2(i+1) = w2(i) + 3*e*(1-w1(i)-w2(i));
end
figure('WindowState','maximized')
plot(w1,'.','Markersize',10)
xlabel('Trial number','Interpreter','latex')
ylabel('w','Interpreter','latex')
title('Over Shadow wih Learning Rate for $S_1$ One Third the Learning Rate for $S_2$','Interpreter','latex')
xticks(0:50:500)
hold on
plot(w2,'.','Markersize',10)
legend('$W_1$','$W_2$','Interpreter','latex')
grid on
grid minor
ylim([0 1])
yticks(0:.25:1)
saveas(gcf,'Fig7.png')