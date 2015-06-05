//
//  TableViewController.swift
//  bfndr
//
//  Created by Joe Hill on 6/3/15.
//  Copyright (c) 2015 ___Arbitrary___. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {



    func do_table_refresh(){
        dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()
            return})
    }
    
    var bars:NSArray = NSArray()
    
    func getJsonData(sampleString: String) -> NSArray {
        let urlString = "http://10.180.62.153:8000/bars/"
        
        let myUrl = NSURL(string: urlString)
        var outputDictionary: NSArray = NSArray()
        
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(myUrl!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            
            if(error == nil){
                let myString = NSString(contentsOfURL: location!, encoding: NSUTF8StringEncoding, error: nil)
                let dataObject = NSData(contentsOfURL: location)
                let barObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil)
                let barDictionary = barObject as! NSArray
                //println(barDictionary)
                outputDictionary = barDictionary
                
                
                
                //              let json = JSON(data: dataObject!)
                
                
            }
        })
        let connectionTest = ConnectionTest(url: urlString)
        println(connectionTest.Test())
        if(connectionTest.Test()){
            downloadTask.resume()
        }
        return outputDictionary
    }
    
    func getJsonAsync(sampleString: String) -> NSArray{
        let myUrl = NSURL(string: sampleString)
        //let myString = NSString(contentsOfURL: myUrl!, encoding: NSUTF8StringEncoding, error: nil)
        let dataObject = NSData(contentsOfURL: myUrl!, options: nil, error: nil)!
        let jsonOb: AnyObject? = NSJSONSerialization.JSONObjectWithData(dataObject, options: NSJSONReadingOptions(), error: nil)
        let valid = NSJSONSerialization.isValidJSONObject(jsonOb!)
        let jsonArray = jsonOb as! NSArray
        return jsonArray
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barUrl: String = "http://10.180.62.214:8000/bars/"
        let conTest = ConnectionTest(url: barUrl)
        
        if(conTest.Test()){
            bars = getJsonAsync(barUrl)
        }
        println(bars.count)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return bars.count
    }

  
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let name = bars[indexPath.row]["name"] as! String
        let address = bars[indexPath.row]["address"] as! String
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = address
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
