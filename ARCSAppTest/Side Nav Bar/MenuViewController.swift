//
//  MenuViewController.swift
//  ARCSAppTest
//
//  Created by Likhit Garimella on 18/02/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

enum MenuType: Int {
    case A
}

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("Dismissing: \(menuType)")
        }
    }
    
}
