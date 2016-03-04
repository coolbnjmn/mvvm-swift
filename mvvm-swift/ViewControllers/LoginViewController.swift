//
//  LoginViewController.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let loginProvider : LoginProvider = LoginProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = loginProvider
        tableView.delegate = loginProvider
        tableView.registerReusableCell(LoginTextFieldTableViewCell.self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
