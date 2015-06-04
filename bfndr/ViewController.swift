//
//  ViewController.swift
//  bfndr
//
//  Created by Joe Hill on 5/24/15.
//  Copyright (c) 2015 ___Arbitrary___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "http://10.180.62.153:8000/bars/"
        
        let myUrl = NSURL(string: urlString)
        
        
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(myUrl!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in

            
            if(error == nil){
                let myString = NSString(contentsOfURL: location!, encoding: NSUTF8StringEncoding, error: nil)
                let dataObject = NSData(contentsOfURL: location)
                let barObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil)
                let barDictionary = barObject as! NSArray
                println(barDictionary)

                //let json = JSON(data: dataObject!)
                

                

                
            }
        })
        
        downloadTask.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

