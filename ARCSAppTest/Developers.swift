//
//  ViewController.swift
//  Developers
//
//  Created by Likhit Garimella on 09/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI


class Developers: UIViewController {
    
    @IBOutlet var dev1: UIView!
    @IBOutlet var dev2: UIView!
    @IBOutlet var dev3: UIView!
    @IBOutlet var dev4: UIView!
    @IBOutlet var dev5: UIView!
    @IBOutlet var dev6: UIView!
    
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
        
        dev1.layer.masksToBounds = false
        dev1.layer.shadowRadius = 4
        dev1.layer.shadowOpacity = 1
        dev1.layer.shadowColor = UIColor.gray.cgColor
        dev1.layer.shadowOffset = CGSize(width: 0, height:2)
        
        dev2.layer.masksToBounds = false
        dev2.layer.shadowRadius = 4
        dev2.layer.shadowOpacity = 1
        dev2.layer.shadowColor = UIColor.gray.cgColor
        dev2.layer.shadowOffset = CGSize(width: 0, height:2)
        
        dev3.layer.masksToBounds = false
        dev3.layer.shadowRadius = 4
        dev3.layer.shadowOpacity = 1
        dev3.layer.shadowColor = UIColor.gray.cgColor
        dev3.layer.shadowOffset = CGSize(width: 0, height:2)
        
        dev4.layer.masksToBounds = false
        dev4.layer.shadowRadius = 4
        dev4.layer.shadowOpacity = 1
        dev4.layer.shadowColor = UIColor.gray.cgColor
        dev4.layer.shadowOffset = CGSize(width: 0, height:2)
        
        dev5.layer.masksToBounds = false
        dev5.layer.shadowRadius = 4
        dev5.layer.shadowOpacity = 1
        dev5.layer.shadowColor = UIColor.gray.cgColor
        dev5.layer.shadowOffset = CGSize(width: 0, height:2)
        
        dev6.layer.masksToBounds = false
        dev6.layer.shadowRadius = 4
        dev6.layer.shadowOpacity = 1
        dev6.layer.shadowColor = UIColor.gray.cgColor
        dev6.layer.shadowOffset = CGSize(width: 0, height:2)
        
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }
    
}

extension Developers: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
