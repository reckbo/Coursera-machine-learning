'surface' plot (x J y)@:+."0 (steps _4 6 20) j./ steps _1 2 20
J=. 2 : '-: (% #) (+/) *: n - (y dot 1,:m)'

NB. gradient descent
next=: 4 : 'y - x * (tx J ty) (D. 1) y'
plot (tx J ty)"1 (0.0001&next)^:(a:) 0.5 0.5
