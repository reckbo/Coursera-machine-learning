require 'lib.ijs'

ALPHAS=: 0.3 0.1 0.03 0.01
MAXITER=: 1500

saveplot=: 3 : 0
pd 'reset'
pd 'xcaption iterations'
pd 'ycaption Cost function'
pd 'key ', (','&joinstring) ": each ALPHAS
pd y
pd 'show'
pd 'save png gradientDescentCost'
)

NB.run=: 3 : 0
d=: |: ". every 'b' fread 'ex1data1.txt'
'tx ty'=: d
tx=: 1,.normalize tx

learningJs=:(tx J ty)"2 learningThetas=:1 2 0|: ALPHAS (tx gdupdate ty)^:(<MAXITER) (#ALPHAS)#,: 0 0

NB. saveplot learningJs

xy=. {. learningThetas
z=. {. learningJs
plot (;/xy),<z