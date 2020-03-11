//
//  WorkshopesViewController.swift
//  ARCS'20
//
//  Created by RUPAM LAHA on 08/03/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class WorkshopesViewController: UIViewController {
    
    // Calling SlideInTransition from SlideInTransition VC
    let transiton = SlideInTransition()

    @IBOutlet weak var iCarousel: iCarousel!
    
    @IBAction func menu(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(menuViewController, animated: true)
        
    }
    
    var img = [UIImage(named: "dhoni"),UIImage(named: "dhoni"),UIImage(named: "dhoni"),UIImage(named: "dhoni"),UIImage(named: "dhoni")]
    
        var names = ["Event1","Event2","Event3","Event4","Event5"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            iCarousel.type = .rotary
            iCarousel.contentMode = .scaleAspectFill
            iCarousel.isPagingEnabled = true
        }
    
        @IBAction func backCarousel(_ sender: Any) {
            
            print(iCarousel.currentItemIndex)
            iCarousel.currentItemIndex=(iCarousel.currentItemIndex-1)%5
        }
    
        @IBAction func frontCarousel(_ sender: Any) {
            
            print(iCarousel.currentItemIndex)
            iCarousel.currentItemIndex=(iCarousel.currentItemIndex+1)%5
        }

    }

extension WorkshopesViewController: iCarouselDelegate, iCarouselDataSource {
    
        func numberOfItems(in carousel: iCarousel) -> Int {
            return img.count
        }
        
        func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
            
            let tempView=UIView(frame: CGRect(x: 0, y: 0, width: 250 , height: 300))
            tempView.backgroundColor=UIColor.white
            // ImageView
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRect(x: 0, y: 0, width: tempView.frame.size.width-40, height: tempView.frame.size.height-20))
            imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.center = CGPoint(x: tempView.frame.size.width  / 2, y: tempView.frame.size.height / 2)
            imageView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            imageView.layer.shadowRadius = 4
            imageView.layer.shadowOpacity = 1
            imageView.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
            imageView.image = img[index]
            imageView.layer.cornerRadius=10
            tempView.layer.cornerRadius=10
            tempView.addSubview(imageView)
            // Gradient
            let gradView=UIView(frame:CGRect(x: 0, y: 0, width: tempView.frame.size.width-40, height: tempView.frame.size.height-20))
            let gradient = CAGradientLayer()
            gradient.frame = gradView.frame
            gradient.colors = [UIColor.clear.cgColor, UIColor.purple.cgColor]
            gradient.locations = [-0.5, 1.5]
            gradView.layer.insertSublayer(gradient, at: 0)
    
            imageView.addSubview(gradView)
            imageView.bringSubviewToFront(gradView)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: 125, y: 320)
            label.textAlignment = .center
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
            label.isHidden = false
            print(iCarousel.currentItemIndex)
           /* switch iCarousel.currentItemIndex {
            case 0:
                label.text = names[0]
                label.isHidden = false
            case 1:
                label.text = names[1]
                label.isHidden = false
            case 2:
                label.text = names[2]
                label.isHidden = false
            case 3:
                label.text = names[3]
                label.isHidden = false
            case 4:
                label.text = names[4]
                label.isHidden = false
            default:
                print("Default")
            } */
            label.text = names[iCarousel.currentItemIndex]
            tempView.addSubview(label)
            return tempView
            
        }
        
}

extension WorkshopesViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
