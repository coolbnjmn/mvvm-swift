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
import Bond

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
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ImageHeaderSubheaderTableViewCell
        if let person = PersonModel(modelJSON: self.dataSource[indexPath.row]) {
            let personViewModel = PersonImageHeaderCellViewModel(model: person)
            personViewModel.header
                .map { $0 }
                .bindTo(cell.headerLabel.bnd_text)
            personViewModel.subHeader
                .map { $0 }
                .bindTo(cell.subHeaderLabel.bnd_text)
            
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
