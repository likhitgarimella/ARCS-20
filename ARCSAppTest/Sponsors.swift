//
//  Sponsors.swift
//  ARCSAppTest
//
//  Created by Likhit Garimella on 24/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class Sponsors: UIViewController {
    
    // Calling SlideInTransition from SlideInTransition VC
    let transiton = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }

}

extension Sponsors: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
