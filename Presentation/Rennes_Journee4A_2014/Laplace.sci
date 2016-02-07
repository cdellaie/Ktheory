t=(-10):0.1:10;
spi=sqrt(%pi);

//Loi de Laplace

scf()
for m=1:10
    plot2d(t,((m/5)/2)*exp(-(m/5)*abs(t)),style=2);
end

//Loi Gaussienne
scf()
for h=1:10
    plot2d(t,((h/10)/spi)*exp(-((h/10)**2)*(t**2)),style=2);
end

//Lois stables
scf()
for alpha=1.1:0.1:2
    plot2d(t,(1/(%pi*alpha))*(1+(t/alpha)**2)^(-1),style=2);
end

scf()
for alpha=1.1:0.1:2
    plot2d(t,exp(abs(t)^(alpha)),style=2);
end