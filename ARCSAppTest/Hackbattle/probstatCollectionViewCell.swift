//
//  probstatCollectionViewCell.swift
//  ARCSAppTest
//
//  Created by RUPAM LAHA on 03/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class probstatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var textView1: UITextView!
    @IBOutlet var textView2: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView1.backgroundColor = .white
        textView2.backgroundColor = .white
        
        

    }
    
}
