from math import comb
def berni( n, k ):
    def bernpoly( x ):
        result = 0
        for i in range(n+1):
            result += comb(n, i) * (x**i) * ((1-x) ** (n-i))
        x =  comb(n, k) * (x**k) * ((1-x) ** (n-k))
        return x
    return bernpoly
