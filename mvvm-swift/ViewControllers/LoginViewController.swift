//
//  LoginViewController.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let loginProvider : LoginProvider = LoginProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = loginProvider
        tableView.delegate = loginProvider
        loginProvider.delegate = self
        tableView.registerReusableCell(LoginTextFieldTableViewCell.self)
        tableView.registerReusableCell(TwoButtonTableViewCell.self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController : BaseProviderViewControllerDelegate {
    func controlEventHappened(controlEvent: AppControlEvents, sender: AnyObject) {
        switch controlEvent {
        case .LeftButtonTap:
                // Log in
            if let _ = sender as? TwoButtonTableViewCell,
                username = loginProvider.username,
                password = loginProvider.password {
                    FirebaseController.sharedInstance.loginUser(username, password: password, completion: {
                        success in
                    })
            }
            case .RightButtonTap:
                // Sign up
                if let _ = sender as? TwoButtonTableViewCell,
                    username = loginProvider.username,
                    password = loginProvider.password {
                        FirebaseController.sharedInstance.createUser(username, password: password, completion: {
                            success in
                        })
            }
            default:
                // unsupported control event, error
                print("Unsupported event -- ERROR")
        }
    }
}