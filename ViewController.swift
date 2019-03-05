//
//  ViewController.swift
//  KanjiGo
//
//  Created by Victor Manuel Lagunas Franco on 2/15/19.
//  Copyright © 2019 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapkit: MKMapView!
    var manager = CLLocationManager()
    var updateCount = 0
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
             self.mapkit.showsUserLocation = true
            self.manager.startUpdatingLocation()
        }else{
           self.manager.requestWhenInUseAuthorization()
        }
    }
    
    //Core location manager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if updateCount < 4{
            if let location = self.manager.location{
                let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
                mapkit.setRegion(region, animated: true)
                updateCount += 1
            }
            
        }else{
            self.manager.stopUpdatingLocation()
        }
    }

}

