//
//  AllSchools.swift
//  Lab07
//
//  Created by CheckoutUser on 2/19/18.
//  Copyright © 2018 ggeorge. All rights reserved.
//

import Foundation
import MapKit

struct AllSchools : Codable {

    let schools : [Schools]

    struct Schools : Codable {
        var name : String?
        var city : String?
        var state : String?
        var zip : String?
        var contact_email : String?
        var latitude : Double?
        var longitude : Double?
    
        func toAnyObject() -> Any {
            return [
                "name" : name ?? "",
                "city" : city ?? "",
                "state" : state ?? "",
                "zip" : zip ?? "",
                "contact_email" : contact_email ?? "",
                "latitude" : latitude ?? 0.0,
                "longitude" : longitude ?? 0.0
            ]
        }
    }
    
}
