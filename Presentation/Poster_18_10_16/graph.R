library(igraph)
library(ggplot2)
require(reshape2)

####################################################################################
## GraphFamily : Function that produces an adjacency matrix for a graph           ##
## disjoint union of N +1 graph, with binomial law of parameter p, starting with  ##
## the first graph having k vertices, adding 1 vertices for the following graph   ##
####################################################################################

GraphFamily <- function(k,N,p){
    A= matrix(rbinom(k**2,1,p),nrow=k);
  for (i in (k+1):(k+N)){
    AA = matrix(rbinom(i**2,1,p),nrow=i);
    m=(i-k)*(k+i-1)/2
    A= rbind(cbind(AA, matrix(0,i, m ) ),cbind(matrix(0,m,i ),A ))}
  return(A-diag(dim(A)[1]));}

###################################################################
##  Example : disjoint union of 3 graphs of 4, 5 and 6 vertices, ##
##  all of three being completely connected                      ##
###################################################################

# Adjacency matrix
A=GraphFamily(6,7,0.7)
x11()
G=graph.adjacency(A)
G= as.undirected(G, mode='collapse')

# Plotting the adjacency matrix with ggplot 2 as a heatmap on a grid
# Require pakages ggplot2 and reshape2 

A1=melt(A) #reshape data to look like xy coordinate
names(A1)=c("x","y","color")
A1$color=factor(A1$color>0) # make the cuttof into a factor
levels(A1$color)=c("0","1")
qplot(x, y, fill=color, data=A1,geom='tile') # calling ggplot

# Plottng the graph

plot(G,
     #layout = layout_with_dh,
     vertex.label = NA,
     vertex.size = 1,
     #vertex.color= V(G)$color,
     vertex.frame.color= "white",
     edge.arrow.size = 1,
     edge.color='blue')


