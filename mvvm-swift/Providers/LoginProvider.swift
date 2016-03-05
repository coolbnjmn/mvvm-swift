//
//  LoginProvider.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class LoginProvider: BaseProvider {
    var username: String? {
        get {
            if let username = usernameTextField?.text {
                return username
            }
            return nil
        }
    }
    
    var password : String? {
        get {
            if let password = passwordTextField?.text {
                return password
            }
            return nil
        }
    }
    
    var usernameTextField : PaddedTextField?
    var passwordTextField : PaddedTextField?
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
                cell.backgroundColor = UIColor.clearColor()
                return cell
            case 1:
                let loginCell = tableView.dequeueReusableCell(indexPath: indexPath) as LoginTextFieldTableViewCell
                loginCell.textField.placeholder = "USERNAME"
                usernameTextField = loginCell.textField
                cell = loginCell
                return cell
            case 2:
                let loginCell = tableView.dequeueReusableCell(indexPath: indexPath) as LoginTextFieldTableViewCell
                loginCell.textField.placeholder = "PASSWORD"
                loginCell.textField.secureTextEntry = true
                passwordTextField = loginCell.textField
                cell = loginCell
                return cell
            case 3:
                let buttonCell = tableView.dequeueReusableCell(indexPath: indexPath) as TwoButtonTableViewCell
                buttonCell.leftButton.setTitle("LOGIN", forState: .Normal)
                buttonCell.rightButton.setTitle("SIGN UP", forState: .Normal)
                buttonCell.delegate = self
                buttonCell.tag = 0
                cell = buttonCell
                return cell
            default:
                cell = UITableViewCell()
                print("ERROR, too many rows")
                return cell
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

extension LoginProvider : TwoButtonCellDelegate {
    func leftButtonPressed(cell: TwoButtonTableViewCell) {
        if cell.tag == 0 {
            delegate?.controlEventHappened(.LeftButtonTap, sender: cell)
        }
    }
    
    func rightButtonPressed(cell: TwoButtonTableViewCell) {
        if cell.tag == 0 {
            delegate?.controlEventHappened(.RightButtonTap, sender: cell)
        }
    }
}