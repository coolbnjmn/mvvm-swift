//
//  TwoButtonTableViewCell.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/4/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

protocol TwoButtonCellDelegate {
    func leftButtonPressed(cell : TwoButtonTableViewCell)
    func rightButtonPressed(cell : TwoButtonTableViewCell)
}

class TwoButtonTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    static var nib: UINib? {
        return UINib(nibName: String(TwoButtonTableViewCell.self), bundle: nil)
    }
    static var reuseIdentifier: String = String(TwoButtonTableViewCell.self)
    var delegate : TwoButtonCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization co
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func leftButtonPressed(sender: AnyObject) {
        delegate?.leftButtonPressed(self)
    }
    
    @IBAction func rightButtonPressed(sender: AnyObject) {
        delegate?.rightButtonPressed(self)
    }
    
}

