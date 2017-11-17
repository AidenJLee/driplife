//
//  AppCoordinator.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 17..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

//var tabSwitchingAction: Action<Int, Void> = { (this: TabViewModel) in
//    return Action { index in
//        this.flowCoordinator.transition(to: Scene.tabSwitching, type: .mainTabbar)
//    }(self)
//}
//
//func actualViewController(for viewController: UIViewController) -> UIViewController {
//    if let navigationController = viewController as? UINavigationController {
//        return SceneCoordinator.actualViewController(for: navigationController.viewControllers.first!)
//    } else if let tabBarController = viewController as? UITabBarController,
//        let selectedViewController = tabBarController.selectedViewController {
//        return SceneCoordinator.actualViewController(for: selectedViewController)
//    } else {
//        return viewController
//    }
//}
//
//func viewControllers() -> [UIViewController] {
//    switch self {
//    case .root(let viewModel):
//        var rootTabBarVC = R.storyboard.main.rootTabBar()!
//        rootTabBarVC.bindViewModel(to: viewModel)
//        return [rootTabBarVC]
//    case .rootTabs(let boxViewModel, let activitiesViewModel, let requirements):
//        let boxNC = R.storyboard.main.boxNavigation()!
//        var boxViewController = boxNC.viewControllers.first as! BoxViewController
//        boxViewController.bindViewModel(to: boxViewModel)
//
//        var activitiesVC = R.storyboard.main.activities()!
//        let activitiesNavigation = UINavigationController(rootViewController: activitiesVC)
//        activitiesVC.bindViewModel(to: activitiesViewModel)
//
//        let requirementPages = RequirementPagesViewController(viewModel: requirements)
//        let requirementsContainer = MaterialsContainerViewController(pages: requirementPages)
//        let navi = UINavigationController(rootViewController: requirementsContainer)
//
//        return [boxNC, activitiesNavigation, navi]
//    case .tabSwitching:
//        return []
//    }
//}

extension UITabBarController {
//    func bindViewModel() {
//        rx.didSelect
//            .map { [weak self] in
//                self?.viewControllers?.index(of: $0) ?? 0
//        }
////        .bind(to: viewModel.tabSwitchingAction.inputs)
//        .disposed(DisposeBag)
//    }
}
