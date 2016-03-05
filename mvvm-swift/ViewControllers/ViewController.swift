//
//  ViewController.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    var dataProvider : PersonProvider?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dataProvider = PersonProvider(completion: {
            self.tableView.reloadData()
        })
        if let dataProvider = dataProvider {
            self.tableView.delegate = dataProvider
            self.tableView.dataSource = dataProvider
        }
        tableView.estimatedRowHeight = 100
        tableView.registerReusableCell(ImageHeaderSubheaderTableViewCell.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

