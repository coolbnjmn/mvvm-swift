//
//  UserModel.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

class UserModel: BaseModel {
    var username : String
    var password : String
    
    init(id: Int, username: String, password: String) {
        self.username = username
        self.password = password
        super.init(id: id)
    }
}
