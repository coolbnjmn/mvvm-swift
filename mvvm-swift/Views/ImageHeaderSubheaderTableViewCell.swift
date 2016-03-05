//
//  ImageHeaderSubheaderTableViewCell.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/4/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class ImageHeaderSubheaderTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    
    static var nib: UINib? {
        return UINib(nibName: String(ImageHeaderSubheaderTableViewCell.self), bundle: nil)
    }
    static var reuseIdentifier: String = String(ImageHeaderSubheaderTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellImageView.layer.cornerRadius = self.cellImageView.bounds.size.height / 2
        self.cellImageView.layer.masksToBounds = true
    }
}
