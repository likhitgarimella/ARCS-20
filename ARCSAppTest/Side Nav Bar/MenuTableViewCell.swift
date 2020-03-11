//
//  MenuTableViewCell.swift
//  ARCSAppTest
//
//  Created by Likhit Garimella on 07/03/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
