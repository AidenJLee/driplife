//
//  GradientView.swift
//  a1minton
//
//  Created by HoJun Lee on 2016. 3. 22..
//  Copyright © 2016년 a1minton. All rights reserved.
//

import UIKit

/**
 A gradient to lay behind any view that will also be rendered in Interface Builder.
 */
//@IBDesignable
class GradientView: UIView {
    
    /**
     One of the two colors of the gradient
     */
    @IBInspectable var startColor : UIColor = UIColor.white  {
        didSet {
            updateTheView()
        }
    }
    /**
     One of the two colors of the gradient
     */
    @IBInspectable var endColor : UIColor = UIColor.orange  {
        didSet {
            updateTheView()
        }
    }
    
    /**
     X value of start coordinate. Between 0 and 1.
     Will contruct a CGPoint together with the Y variable.
     */
    @IBInspectable var startX : CGFloat = 0.5  {
        didSet {
            updateTheView()
        }
    }
    /**
     Y value of start coordinate. Between 0 and 1.
     Will contruct a CGPoint together with the X variable.
     */
    @IBInspectable var startY : CGFloat = 0.0  {
        didSet {
            updateTheView()
        }
    }
    /**
     X value of end coordinate. Between 0 and 1.
     Will contruct a CGPoint together with the Y variable.
     */
    @IBInspectable var endX : CGFloat = 0.5  {
        didSet {
            updateTheView()
        }
    }
    /**
     Y value of end coordinate. Between 0 and 1.
     Will contruct a CGPoint together with the X variable.
     */
    @IBInspectable var endY : CGFloat = 1.0  {
        didSet {
            updateTheView()
        }
    }
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUp()
    }
    
    //MARK: - Updating the View
    
    ///The private gradient layer.
    private var gradientLayer = CAGradientLayer()
    
    ///Ensures that the view will have its desired (and in IB specified) bounds.
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setUp() {
        layer.insertSublayer(gradientLayer, at: 0)
        updateTheView()
    }
    
    ///Applies the given attributes to the view.
    func updateTheView() {
        
        let colors = [startColor.cgColor, endColor.cgColor]
        
        gradientLayer.colors = colors
        clipsToBounds = true
        gradientLayer.startPoint = CGPoint(x: startX, y: startY)
        gradientLayer.endPoint = CGPoint(x: endX, y: endY)
        self.setNeedsDisplay()
        
    }
}

