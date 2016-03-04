//
//  LoginProvider.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class LoginProvider: BaseProvider {
    
}

extension LoginProvider : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        switch indexPath.row {
            case 0:
                cell = UITableViewCell()
                return cell
            case 1:
                let loginCell = tableView.dequeueReusableCell(indexPath: indexPath) as LoginTextFieldTableViewCell
                loginCell.textField.placeholder = "USERNAME"
                cell = loginCell
                return cell
            case 2:
                let loginCell = tableView.dequeueReusableCell(indexPath: indexPath) as LoginTextFieldTableViewCell
                loginCell.textField.placeholder = "PASSWORD"
                loginCell.textField.secureTextEntry = true
                cell = loginCell
                return cell
            case 4:
                cell = UITableViewCell()
                return cell
            default:
                cell = UITableViewCell()
                print("ERROR, too many rows")
                return cell
                break
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension LoginProvider : UITableViewDelegate {
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}