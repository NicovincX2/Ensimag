# Principes et M�thodes Statistiques
# Fiche 2 - Exercice 1

# Cr�ation du vecteur des donn�es
bruit<-c(54.8, 55.4, 57.7, 59.6, 60.1, 61.2, 62.0, 63.1, 63.5, 64.2, 65.2, 65.4, 65.9, 66.0, 67.6, 68.1, 69.5, 70.6, 71.5, 73.4)
n<-length(bruit)

# Indicateurs statistiques
summary(bruit)

# Variance et �cart-type empiriques (sans biais)
var(bruit)
sd(bruit)

# Coefficient de variation empirique
sqrt((n-1)/n)*sd(bruit)/mean(bruit)

# Histogramme � classes de m�me largeur
a0<-min(bruit)-0.025*(max(bruit)-min(bruit))
a5<-max(bruit)+0.025*(max(bruit)-min(bruit))
bornes<-seq(a0,a5,(a5-a0)/5)
hist(bruit, prob=T, breaks=bornes)

# ou en utilisant la fonction histolarg d�finie dans l'exercice 2 de la fiche 1
histolarg(bruit) 

# Histogramme � classes de m�me effectif, en utilisant la commande quantiles
borneseff<-c(a0,quantile(bruit,seq(1/5,4/5,1/5)),a5)
hist(bruit, prob=T, breaks=borneseff)

# ou en utilisant la fonction histoleff d�finie dans l'exercice 2 de la fiche 1
histoeff(bruit) 


# Graphe de probabilit�s pour la loi normale, avec la commande 
# qqnorm
qqnorm(bruit)

# Graphe de probabilit�s pour la loi normale, avec la m�thode du # cours
plot(bruit[1:(n-1)], qnorm(seq(1:(n-1))/n))

# Estimation de m et sigma^2 par moments ou maximum de 
# vraisemblance
mean(bruit)
var(bruit)

# Estimation de m et sigma^2 par le graphe de probabilit�s
reg<-lm(qnorm(seq(1:(n-1))/n)~bruit[1:(n-1)])
(1/reg$coefficients[2])^2
-reg$coefficients[1]/reg$coefficients[2]
abline(reg)

# Estimation de la probabilit� que le niveau de bruit d�passe 70 
# ou 74 db
1-pnorm(70,mean(bruit),sd(bruit))
1-pnorm(74,mean(bruit),sd(bruit))

# Quantile d�ordre 90%
qnorm(0.9,mean(bruit),sd(bruit))

# Avec l�hypoth�se de loi exponentielle�
lambda<-1/mean(bruit)
lambda
1-pexp(70,lambda)
1-pexp(74,lambda)
qexp(0.9,lambda)
plot(bruit[1:(n-1)],log(1-seq(1:(n-1))/n))

# Sans supposer la loi connue : approche non param�trique
1-ecdf(bruit)(70)
1-ecdf(bruit)(74)
quantile(bruit,0.9)
