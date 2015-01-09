//
//  HomeViewController.swift
//  WhoisInSpace
//
//  Created by David on 1/8/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var overHeadDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let whosInSpaceApi = WhoIsInSpaceAPI()
    
    var issCurrentLat: Double?
    var issCurrentLon: Double?
    var issCurrentTime: String?
    
    var myLatitude: CLLocationDegrees?
    var myLongitude: CLLocationDegrees?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
   
       
        
        
        self.whosInSpaceApi.getCurrentLoctionOfISS { (location) -> (Void) in
            self.latitudeLabel.text = self.formatDoubleString(location.latitude, precision: 4)
            self.longitudeLabel.text = self.formatDoubleString(location.longitude, precision: 4)
            

        }
        
//        self.whosInSpaceApi.getOverHeadPass("\(self.myLatitude)", longitude: "\(self.myLongitude)") { (dateTime) -> (Void) in
//            println(dateTime)
//        }
        
        self.whosInSpaceApi.getMyLocation { (myCords) -> (Void) in
            println(myCords.latitude)
            println(myCords.longitude)
        }
     

    }

    
    

    
    
//MARK: IBActions
    @IBAction func refreshButtonPressed(sender: AnyObject)
    {
    }
    
    
//MARK: Helpers
    func formatDoubleString(theDouble:Double, precision: Int) -> String
    {
        // Allows you to decide the precision of a double in a string format
        return NSString(format: "%.\(precision)f", theDouble)
    }
    

}
