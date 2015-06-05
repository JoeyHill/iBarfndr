//
//  ConnectionTesterClass.swift
//  bfndr
//
//  Created by Joe Hill on 6/5/15.
//  Copyright (c) 2015 ___Arbitrary___. All rights reserved.
//

import Foundation
class ConnectionTest{
    var URLString: String
    var Reachable: Bool
    var timeoutInt: NSTimeInterval = 5.0
    
    init(){
        URLString = ""
        Reachable = false
    }
    
    init(url: String){
        URLString = url
        Reachable = false
    }
    
    func setTimeout(time: NSTimeInterval){
        timeoutInt = time
    }
    
    func Test() -> Bool{
        let url = NSURL(string: URLString)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 5.0
        var response: NSURLResponse?
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
        if let httpResponse = response as? NSHTTPURLResponse{
            if httpResponse.statusCode == 200{
                Reachable = true
            }
        }
        return Reachable
    }
    
    
}