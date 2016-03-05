//
//  BaseViewModel.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/5/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {

    var model : BaseModel
    init(model: BaseModel) {
        self.model = model
        super.init()
    }
}
