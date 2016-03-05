//
//  PersonModel.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/4/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

enum PersonModelKeys : String {
    case firstName = "firstName"
    case lastName = "lastName"
    case imageUrl = "imageUrl"
    case occupation = "occupation"
}

class PersonModel: BaseModel {
    var firstName: String
    var lastName: String
    var imageUrl: NSURL?
    var occupation: String
    
    convenience init?(modelJSON: Dictionary<String, AnyObject>) {
        if let firstName = modelJSON[PersonModelKeys.firstName.rawValue] as? String,
             lastName = modelJSON[PersonModelKeys.lastName.rawValue] as? String,
        occupation = modelJSON[PersonModelKeys.occupation.rawValue] as? String,
            imageUrlString = modelJSON[PersonModelKeys.imageUrl.rawValue] as? String,
                idString = modelJSON[BaseModelKeys.id.rawValue] as? String,
                id = Int(idString) {
                    self.init(id: id, firstName: firstName, lastName: lastName, imageUrlString: imageUrlString, occupation: occupation)
        } else {
            return nil
        }
    }
    
    init(id: Int, firstName: String, lastName: String, imageUrlString: String, occupation: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.imageUrl = NSURL(string: imageUrlString)
        self.occupation = occupation
        super.init(id: id)
    }
}
