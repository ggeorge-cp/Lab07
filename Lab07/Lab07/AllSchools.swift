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
            let validName = name ?? ""
            let vaidCity = city ?? ""
            let validState = state ?? ""
            let validZip = zip ?? ""
            let validEmail = contact_email ?? ""
            let validLatitude = latitude ?? 0.0
            let validLongitude = longitude ?? 0.0
            
            return [
                "name" : validName,
                "city" :  vaidCity,
                "state" : validState,
                "zip" : validZip,
                "contact_email" : validEmail,
                "latitude" : validLatitude,
                "longitude" : validLongitude
            ]
        }
    }
    
}
