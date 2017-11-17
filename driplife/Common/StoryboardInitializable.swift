//
//  StoryboardInitializable.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 17..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

protocol StoryboardInitializableProtocol {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitializableProtocol where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
    static func initFromStoryboard(name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
