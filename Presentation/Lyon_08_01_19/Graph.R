# Graph

# A finite propagation operator
# 

k=100;
r=20;

rdiag=1*(abs((1:k)%*%(0*t(1:k)+1) -(0*(1:k)+1)%*%(t(1:k)))<r); #characteristic function of {x,y | d(xy)<r}
A= rdiag*(matrix(runif(k**2,-10,10),nrow=k)); 
#Multiplying a matrix of iid uniform on (-10,10) by rdiag yields the cuttoff to the r-diag 

x11()
heatmap(A, Colv = NA, Rowv = NA, scale="column",labRow = FALSE,labCol = FALSE)

# Simple heatmap
# Colv and Rowv are set to NA so that the function doesn't permut rows and columns 
# (automaticly regroup similar col and rows)
# Possible change of colors with library(RColorBrewer) 
# and the option col= colorRampPalette(brewer.pal(8, "Blues"))(25) in the heatmap



