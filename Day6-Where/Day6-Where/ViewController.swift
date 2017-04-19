//
//  ViewController.swift
//  Day6-Where
//
//  Created by 刘乙灏 on 2017/4/19.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!

    @IBAction func myLocationButtonDidTouch(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = error.localizedDescription
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.last!) { (placemarks, error) in
            if (error != nil) {
                self.locationLabel.text = error?.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks?[0]
                self.locationLabel.text = (pm?.country!)! + (pm?.administrativeArea!)! + (pm?.locality!)!
            } else {
                self.locationLabel.text = "error"
            }
        }
    }
}

