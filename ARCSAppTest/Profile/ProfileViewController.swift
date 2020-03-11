//
//  ProfileViewController.swift
//  ARCSAppTest
//
//  Created by RUPAM LAHA on 03/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var mobNo: UILabel!
    @IBOutlet weak var regNo: UILabel!
    @IBOutlet weak var registeredEvents: UICollectionView!
    
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

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = registeredEvents.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! registeredCollectionViewCell
        return cell
    }
    
}

extension ProfileViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
