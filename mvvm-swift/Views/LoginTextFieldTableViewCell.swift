//
//  LoginTextFieldTableViewCell.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class LoginTextFieldTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var textField: PaddedTextField!
    static var nib: UINib? {
        return UINib(nibName: String(LoginTextFieldTableViewCell.self), bundle: nil)
    }
    static var reuseIdentifier: String = String(LoginTextFieldTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
