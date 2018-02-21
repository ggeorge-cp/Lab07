//
//  ViewController.swift
//  Lab07
//
//  Created by CheckoutUser on 2/18/18.
//  Copyright © 2018 ggeorge. All rights reserved.
//

import UIKit
import GeoFire
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    var databaseRef : DatabaseReference?
    var geoFire : GeoFire?
    var schools : AllSchools?
    let schoolDataLink = "https://code.org/schools.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = Database.database().reference().child("schools")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: schoolDataLink)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let allSchools = try decoder.decode(AllSchools.self, from: data)
                    
                    for school in allSchools.schools {
                        if let zip_code = school.zip {
                            if zip_code.count == 5 {
                                if (Array(zip_code)[0] == "9") && (Array(zip_code)[1] == "3") {
                                    
                                    
                                    self.databaseRef?.child(school.name!).setValue(school.toAnyObject())
                                }
                                
                            }
                        }
                    }
                    
                    self.schools = allSchools
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

