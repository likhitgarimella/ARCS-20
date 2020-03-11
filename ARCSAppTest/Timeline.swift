//
//  ViewController.swift
//  Timeline
//
//  Created by Likhit Garimella on 09/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class Timeline: UIViewController {
    
    @IBOutlet var uiux: UIView!
    @IBOutlet var convoke: UIView!
    @IBOutlet var ml: UIView!
    @IBOutlet var uiux2: UIView!
    @IBOutlet var convoke2: UIView!
    @IBOutlet var ml2: UIView!
    @IBOutlet var uiux3: UIView!
    @IBOutlet var convoke3: UIView!
    @IBOutlet var ml3: UIView!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var image5: UIImageView!
    @IBOutlet var image6: UIImageView!
    @IBOutlet var image7: UIImageView!
    @IBOutlet var image8: UIImageView!
    @IBOutlet var image9: UIImageView!
    
    
    // Calling SlideInTransition from SlideInTransition VC
    let transiton = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // uiux.roundCorners([.topRight], radius: 10)
//        uiux.layer.shadowColor = UIColor.gray.cgColor
//        uiux.layer.shadowOpacity = 0.6
//        uiux.layer.shadowOffset = .zero
//        uiux.layer.shadowRadius = 8
//        uiux.layer.shadowPath = UIBezierPath(rect: uiux.bounds).cgPath
//        uiux.layer.shouldRasterize = true
//        uiux.layer.rasterizationScale = UIScreen.main.scale
        
        uiux.layer.masksToBounds = false
        uiux.layer.shadowRadius = 4
        uiux.layer.shadowOpacity = 1
        uiux.layer.shadowColor = UIColor.gray.cgColor
        uiux.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image1.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        convoke.layer.masksToBounds = false
        convoke.layer.shadowRadius = 4
        convoke.layer.shadowOpacity = 1
        convoke.layer.shadowColor = UIColor.gray.cgColor
        convoke.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image2.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        ml.layer.masksToBounds = false
        ml.layer.shadowRadius = 4
        ml.layer.shadowOpacity = 1
        ml.layer.shadowColor = UIColor.gray.cgColor
        ml.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image3.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        uiux2.layer.masksToBounds = false
        uiux2.layer.shadowRadius = 4
        uiux2.layer.shadowOpacity = 1
        uiux2.layer.shadowColor = UIColor.gray.cgColor
        uiux2.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image4.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        convoke2.layer.masksToBounds = false
        convoke2.layer.shadowRadius = 4
        convoke2.layer.shadowOpacity = 1
        convoke2.layer.shadowColor = UIColor.gray.cgColor
        convoke2.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image5.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        ml2.layer.masksToBounds = false
        ml2.layer.shadowRadius = 4
        ml2.layer.shadowOpacity = 1
        ml2.layer.shadowColor = UIColor.gray.cgColor
        ml2.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image6.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        uiux3.layer.masksToBounds = false
        uiux3.layer.shadowRadius = 4
        uiux3.layer.shadowOpacity = 1
        uiux3.layer.shadowColor = UIColor.gray.cgColor
        uiux3.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image7.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        convoke3.layer.masksToBounds = false
        convoke3.layer.shadowRadius = 4
        convoke3.layer.shadowOpacity = 1
        convoke3.layer.shadowColor = UIColor.gray.cgColor
        convoke3.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image8.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        ml3.layer.masksToBounds = false
        ml3.layer.shadowRadius = 4
        ml3.layer.shadowOpacity = 1
        ml3.layer.shadowColor = UIColor.gray.cgColor
        ml3.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.image9.cornerRadius(usingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }
    
}

extension Timeline: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

extension UIImageView
{
    func cornerRadius(usingCorners corners: UIRectCorner, cornerRadii: CGSize)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
