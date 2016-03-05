//
//  PersonImageHeaderCellViewModel.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/5/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit
import Bond

class PersonImageHeaderCellViewModel: BaseViewModel {

    var header: String
    var subHeader: String
    var imageUrl: NSURL?
    
    override init(model: BaseModel) {
        if let model = model as? PersonModel {
            header = model.firstName + " " + model.lastName
            subHeader = model.occupation
            imageUrl = model.imageUrl
        } else {
            header = ""
            subHeader = ""
        }
        super.init(model: model)
    }
}
