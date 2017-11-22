//
//  Coordinator.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import RxSwift

protocol CoordinatorProtocol {
    func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T>
}

class Coordinator<ResultType>: CoordinatorProtocol {
    
    typealias CoordinationResult = ResultType
    
    let disposeBag = DisposeBag()
    let identifier = UUID()
    
    private var childCoordinators = [UUID: CoordinatorProtocol]()
    
    private func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    // ChileCoordinator가 있을경우 start()함수 호출과 함께 ChildCoordinator관련 정보를 다 지움
    // 보통 present로 네비로 띄웠을 경우 이렇게 제거 함
    func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
    }
    
    /// - Returns: Result of coordinator job.
    func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
    
}
