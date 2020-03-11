//
//  HomeViewController.swift
//  ARCSAppTest
//
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    // Calling SlideInTransition from SlideInTransition VC
    let transiton = SlideInTransition()
        
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.white
        
        // Image for Navbar button
        // let imageView = UIImageView(image: UIImage(named: "Menu"))
        // let buttonItem = UIBarButtonItem(customView: imageView)
        // self.navigationItem.leftBarButtonItem = buttonItem
        
        // Constraints for Navbar button
        // buttonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        // buttonItem.customView?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        // buttonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }
    
}

// **************************************************************** //

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 181
    }
    
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

/* extension UIBarButtonItem {
    class func itemWith(colorfulImage: UIImage?, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(colorfulImage, for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 25.0)
        button.addTarget(target, action: action, for: .touchUpInside)

        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
} */
