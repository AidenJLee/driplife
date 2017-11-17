//
//  FlowCoordinator.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 17..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import RxSwift
import UIKit
import Foundation

protocol FlowCoordinatorProtocol {
    func coordinate<T>(to coordinator: FlowCoordinator<T>) -> Observable<T>
}

class FlowCoordinator<ResultType>: FlowCoordinatorProtocol {
    
    typealias CoordinationResult = ResultType
    
    let disposeBag = DisposeBag()
    let identifier = UUID()
    let mainTabbarController: UITabBarController? = nil
    private var childCoordinators = [UUID: FlowCoordinatorProtocol]()
    
    private func store<T>(coordinator: FlowCoordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free<T>(coordinator: FlowCoordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    // ChileCoordinator가 있을경우 start()함수 호출과 함께 ChildCoordinator관련 정보를 다 지움
    // 보통 present로 네비로 띄웠을 경우 이렇게 제거 함
    func coordinate<T>(to coordinator: FlowCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
    }
    
    /// - Returns: Result of coordinator job.
    func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
    
}
