//
//  BaseNavigationController.swift
//  driplife
//
//  Created by HoJun Lee on 2017. 11. 11..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    @IBInspectable var clearNavStyle: Bool = false
    @IBInspectable var statusBarStyle: Bool = true
    @IBInspectable var navTintColor: UIColor = UIColor.white
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.statusBarStyle ? .lightContent : .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor  = self.navTintColor
        if self.navTintColor.isEqual(UIColor.white) {
            self.navigationBar.tintColor = UIColor.white
        }
        if self.clearNavStyle {
            hideNavigationBar()
        }
    }
    fileprivate func hideNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isHidden = true
    }
}
