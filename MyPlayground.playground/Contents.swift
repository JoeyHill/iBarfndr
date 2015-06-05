//: Playground - noun: a place where people can play

import UIKit





var str = "Hello, playground"

let urlString = "http://10.180.62.153:8000/bars/"
let newURLString = "http://agile-plateau-7755.herokuapp.com/tg/"

let url = NSURL(string: newURLString)

let myString = NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding, error: nil)


let dataObject = NSData(contentsOfURL: url!, options: nil, error: nil)!



let jsonOb: AnyObject? = NSJSONSerialization.JSONObjectWithData(dataObject, options: NSJSONReadingOptions(), error: nil)
let valid = NSJSONSerialization.isValidJSONObject(jsonOb!)

let jsonArray = jsonOb as! NSArray
let first = jsonArray[1]["name"]
jsonArray.count


struct BarTest {
    var Name: String
    var locx: Float?
    var locy: Float?
    var Address: String
    
    init(dataObject: NSData){
        Name = ""
        Address = ""
    }
    init(){
        Name = ""
        Address = ""
    }
}

var bars: Array<BarTest> = Array<BarTest>()

for bar in jsonArray{
    var tempBar = BarTest()
    tempBar.Name = bar["name"] as! String
    tempBar.Address = bar["address"] as! String
    bars.append(tempBar)
}


