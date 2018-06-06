//: [Previous](@previous)

import TMDbCore
import RxSwift

enum APIError : Error {
    case invalidKey
    case notAnImage
}

let some = Observable.from(["😘", "😄"])
let empty = Observable<Int>.empty()
let error = Observable<Int>.error(APIError.invalidKey)
let single = Observable.just("Hola k ase, programa o k ase")

let hello = Observable<String>.create { observer in
    
}
