//
//  Bar.swift
//  bfndr
//
//  Created by Joe Hill on 5/25/15.
//  Copyright (c) 2015 ___Arbitrary___. All rights reserved.
//

import Foundation

protocol ILocatable{
    var latitude: Float {get set}
    var longitude: Float {get set}
}

class Bar: ILocatable{
    var Name: String?
    var Address: String?
    var latitude: Float
    var longitude: Float
    
    init(dataObject: NSData){
        latitude = 123.456
        longitude = 456.789
    }
    
}