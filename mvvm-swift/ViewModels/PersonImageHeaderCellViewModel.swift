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

    var header: Observable<String> = Observable<String>("")
    var subHeader: Observable<String> = Observable<String>("")
    var imageUrl: Observable<NSURL?> = Observable<NSURL?>(nil)
    
    override init(model: BaseModel) {
        if let model = model as? PersonModel {
            header.startWith(model.firstName + " " + model.lastName)
            subHeader.startWith(model.occupation)
            imageUrl.startWith(model.imageUrl)
        }
        super.init(model: model)
    }
}
