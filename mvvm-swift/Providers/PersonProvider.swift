//
//  PersonProvider.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/4/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit
import Alamofire
import OHHTTPStubs
import SDWebImage

class PersonProvider: BaseProvider {
    
    var dataSource : Array<Dictionary<String, AnyObject>> = []
    init(completion: (()->())?) {
        super.init()
        let urlString = "http://www.linkedin.com"
        guard let url = NSURL(string: urlString) else {
            return
        }
        let nsUrlRequest = NSURLRequest(URL: url)
        guard let host = nsUrlRequest.URL?.host,
                path = nsUrlRequest.URL?.path else {
            return
        }
        stub(isHost(host) && isPath(path)) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            if let stubPath = OHPathForFile("people.json", self.dynamicType) {
                return fixture(stubPath, headers: ["Content-Type":"application/json"])
            } else { return fixture("", headers: [:]) } // error
        }
        
        
        
        Alamofire.request(.GET, urlString).responseJSON(completionHandler: {
            data in
            switch data.result {
            case .Success(let value):
                print(value)
                if let people = value as? Dictionary<String, AnyObject>,
                    peopleArray = people["people"] as? Array<Dictionary<String, AnyObject>> {
                        self.dataSource = peopleArray
                }
                
                completion?()
            case .Failure(let error):
                print(error)
            }
        })
    }
}

extension PersonProvider : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.dataSource.count)
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ImageHeaderSubheaderTableViewCell
        if let person = PersonModel(modelJSON: self.dataSource[indexPath.row]) {
            let personViewModel = PersonImageHeaderCellViewModel(model: person)
            cell.headerLabel.text = personViewModel.header
            cell.subHeaderLabel.text = personViewModel.subHeader
            cell.cellImageView.sd_setImageWithURL(personViewModel.imageUrl, completed: {
                _,_,_,_ in
                print(self)
            })
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension PersonProvider : UITableViewDelegate {
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}
