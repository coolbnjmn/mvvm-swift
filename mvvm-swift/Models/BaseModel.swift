//
//  BaseModel.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var id: Int
    
    init(id: Int) {
        self.id = id
        super.init()
    }
    
}
