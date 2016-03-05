//
//  BaseProvider.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit

protocol BaseProviderViewControllerDelegate {
    func controlEventHappened(controlEvent: AppControlEvents, sender: AnyObject)
}

class BaseProvider: NSObject {
    var delegate : BaseProviderViewControllerDelegate?
}
