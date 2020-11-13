//
//  Object.swift
//  sonnt.training2
//
//  Created by Nero on 11/13/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import Foundation
import ObjectMapper

class PersonStatus: Mappable {
    var dangChoVayData: [Person] = []
    var dangVayData: [Person] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dangChoVayData <- map["dangChoVay"]
        dangVayData <- map["dangVay"]
    }
}

class Person:Mappable{
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        reason <- map["content"]
        money <- map["money"]
        date <- map["time"]
    }
    
    var name: String = ""
    var reason: String = ""
    var money:String = ""
    var date: String = ""
    
}
