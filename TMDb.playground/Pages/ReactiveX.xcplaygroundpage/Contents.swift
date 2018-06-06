//: [Previous](@previous)

import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError : Error {
    case invalidKey
    case notAnImage
}

let some = Observable.from(["😘", "😄"])
let empty = Observable<Int>.empty()
let error = Observable<Int>.error(APIError.invalidKey)
let single = Observable.just("Hola k ase, programa o k ase")

let hello = Observable<String>.create { observer in
    observer.onNext("Hello")
    observer.onNext("World")
    oberver.onCompleted()
    return Disposables.create()
}

let promise = Observable.create { observer in
    observer.onNext("Hello")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        observer.onNext("Five second later")
        observer.onCompleted()
    }
    
    return Disposables.create()
}

promise.subscribe { event in
    switch event {
    case .next(let value):
        print("next(\(value)")
    case .error(let error):
        print("next(\(error)")
    default:
        print("completed")
    }
    
}
