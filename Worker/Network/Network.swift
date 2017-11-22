//
//  Network.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import Alamofire
import RxSwift
import RxAlamofire
import ObjectMapper

final class Network<T: ImmutableMappable> {
    
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String) -> Observable<[T]> {
        let absolutePath = "\(endPoint)/\(path)"
        return RxAlamofire
            .json(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ json -> [T] in
                return try Mapper<T>().mapArray(JSONObject: json)
            })
    }
    
    func getItem(_ path: String, itemId: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return RxAlamofire
            .request(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ json -> T in
                return try Mapper<T>().map(JSONObject: json)
            })
    }
    
    func postItem(_ path: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)"
        return RxAlamofire
            .request(.post, absolutePath, parameters: parameters)
            .debug()
            .observeOn(scheduler)
            .map({ json -> T in
                return try Mapper<T>().map(JSONObject: json)
            })
    }
    
    func updateItem(_ path: String, itemId: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return RxAlamofire
            .request(.put, absolutePath, parameters: parameters)
            .debug()
            .observeOn(scheduler)
            .map({ json -> T in
                return try Mapper<T>().map(JSONObject: json)
            })
    }
    
    func deleteItem(_ path: String, itemId: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return RxAlamofire
            .request(.delete, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ json -> T in
                return try Mapper<T>().map(JSONObject: json)
            })
    }
}
