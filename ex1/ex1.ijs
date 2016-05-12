loc=. 3 : '> (4!:4 <''y'') { 4!:3 $0'
SCRIPTDIR=: getpath_j_ jpath loc''
require SCRIPTDIR,'logic.ijs'

ALPHAS=: 0.3 0.1 0.03 0.01
MAXITER=: 1500

saveplot=: 3 : 0
pd 'reset'
pd 'xcaption iterations'
pd 'ycaption Cost function'
pd 'key ', (','&joinstring) ": each ALPHAS
pd y
pd 'show'
pd 'save png ',SCRIPTDIR,'gradientDescentCost'
)

NB.run=: 3 : 0
d=: |: ". every 'b' fread SCRIPTDIR,'ex1data1.txt'
'tx ty'=: d
txn=: normalize tx
txmean=: mean tx
txstd=: stddev tx
txn1=: 1,.txn

learningJs=:(txn1 J ty)"2 learningThetas=:1 2 0|: ALPHAS (txn1 gdupdate ty)^:(<MAXITER) (#ALPHAS)#,: 0 0

NB.)

NB.'dot; ycaption Profit in $10,000s; xcaption Population of City in 10,000s' plot tx;ty
