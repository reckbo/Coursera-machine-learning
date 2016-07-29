require'stats'
NB. ===================================================== 
NB. Logic

NB. Normalizes a feature
NB.   normalize tx
normalize=: (%&.|: stddev)@:(-&.|: mean)

NB. matrix multiplication
dot=: +/ .*

NB. Cost function 
NB. Usage:
NB.   (tx J ty) theta
J=: 2 : '-: (+/) (% #) *: (m dot y) - n'

NB. Derivative of linear regression cost function
NB. Usage:
NB.   (tx gradJ ty) theta
gradJ=: 2 : '+/ (% #) m * (m dot y) - n'

NB. Linear regression gradient descent update function
NB. Usage:
NB.   alpha (tx gdupdate ty) theta
NB. e.g. 0.001 (tx gdnext ty) 1 1
gdupdate=: 2 : '] - [*(m gradJ n)@]"0 1'
