//
//  ViewController.swift
//  FindingTheUserLocation
//
//  Created by Ricardo Hui on 27/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
        let userLocation: CLLocation = locations[0]
     
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
            }else{
                if let placemark = placemarks?[0]{
                    print(placemark)
                    var subThroughfare = ""
                    if placemark.subThoroughfare != nil{
                        subThroughfare = placemark.subThoroughfare!
                    }
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil{
                        thoroughfare = placemark.thoroughfare!
                    }
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!
                    }
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea  != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    var postalCode = ""
                    if placemark.postalCode  != nil {
                        postalCode = placemark.postalCode!
                    }
                    var country = ""
                    if placemark.country  != nil {
                        country = placemark.country!
                    }
                    
                    let addressString  = subThroughfare + " " + thoroughfare + "\n" + subLocality + subAdministrativeArea + "\n" + postalCode + "\n" + country
                    print(addressString)
                }
            }
        }
    }

}

