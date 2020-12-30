#!/usr/bin/env swift

// memoize example:
// source from: https://medium.com/@mvxlr/swift-memoize-walk-through-c5224a558194
func memoize<T: Hashable, U>(work: @escaping ((T)->U, T) -> U) -> (T)->U {
    var memo = Dictionary<T, U>()
    
    func wrap(x: T)->U {
        if let q = memo[x] { return q }
        let r = work(wrap, x)
        memo[x] = r
        return r
    }
    
    return wrap
}

let factorial = memoize { 
    factorial, x in
    x == 0 ? 1 : x * factorial(x-1)
}

print(factorial(15))
