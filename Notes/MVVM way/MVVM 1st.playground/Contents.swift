//: Playground - noun: a place where people can play

import UIKit

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}


let label = UILabel()
let name = Dynamic("Steve")

name.bind {
    label.text = $0
    print("label.text = \(label.text)")
}

print(name.value)
name.value = "Tim"
print(name.value)
name.value = "Bob"


let alive = Dynamic(true)
alive.bindAndFire(listener: {
    print("alive = \($0)")
})
let products = Dynamic(["Macintosh","iPhone"])
products.bindAndFire(listener: {
    print("products = \($0)")
})