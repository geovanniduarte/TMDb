//: [Previous](@previous)

import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct RandomUserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        struct Picture: Decodable {
            let imageURL: URL
            
            private enum CodingKeys: CodingKeys {
                case imageURL = "large"
            }
        }
        
        let name: Name
        let picture: Picture
    }
    
    let results: [User]
}

let randomUserApiUrl = URL(string: "https://randomuser.me/api")!
let session = URLSession(configuration: .default)
let decoder = JSONDecoder()

func data(with url: URL) -> Observable<Data> {
    return Observable.create { observer in
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                observer.onError(error)
            } else {
                observer.onNext(dada ?? Data())
                observer.onCompleted()
            }
        }
        
        task.resume()
        
        // TODO: do something here
        return Disposables.create {
            task.cancel()
        }
    }
}

func getRandomUserResponse(completion: @escaping (RandomUserResponse?, Error?) -> Void) {
    let task = session.dataTask(with: randomUserApiUrl) { data, response, error in
        if let data = data,
            let result = try? decoder.decode(RandomUserResponse.self, from: data) {
            completion(result, nil)
        } else {
            completion(nil, error)
        }
        //let randomUserResponse = decoder.decode(RandomUserResponse.self, from: data)
        //print(randomUserResponse)
    }
    
    task.resume()
}

func getImage(for url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    let task = session.dataTask(with: url) { data, response, error in
        if let data = data, let image = UIImage(data: data) {
            completion(image, nil)
        } else {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func getRandomUserImage(completion: @escaping (UIImage?, Error?) -> Void) {
    getRandomUserResponse { response, error in
        guard let response = response else {
            completion(nil, error)
            return
        }
        
        getImage(for: response.results[0].picture.imageURL completion: completion)
    }
}

getRandomUserImage { image, error in
    if let image = image  {
        let stupidXcode = image
        print(image)
    } else {
        print(error)
    }
}


let randomUserImage = data(with: randomUserApiUrl) .m


/*
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
 */

