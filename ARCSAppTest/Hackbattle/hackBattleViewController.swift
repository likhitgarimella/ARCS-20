//
//  hackBattleViewController.swift
//  ARCSAppTest
//
//  Created by RUPAM LAHA on 03/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class hackBattleViewController: UIViewController {
    
    // Calling SlideInTransition from SlideInTransition VC
    let transiton = SlideInTransition()

    @IBOutlet weak var probCollectionView: UICollectionView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var timelineCollection: UICollectionView!
    
    @IBOutlet var textView0: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            registerButtonGrad()
        
        textView0.backgroundColor = .white
        }

    
    @IBAction func menuButton(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }
    
       // Register Button
       func registerButtonGrad()
       {
           registerButton.layer.cornerRadius = registerButton.frame.size.height/2
           registerButton.layer.masksToBounds = true
       }
}

extension hackBattleViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

extension hackBattleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case probCollectionView:
            return 5
        case timelineCollection:
            return 5
        default:
            print("Wrong")
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        switch collectionView {
        case probCollectionView:
            
        cell = probCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! probstatCollectionViewCell
            
        case timelineCollection:
        cell = timelineCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! hackTimelineCollectionViewCell
            
        default:
            print("Wrong")
        }

       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = timelineCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }

}
