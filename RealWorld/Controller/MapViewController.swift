//
//  MapViewController.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 26/08/23.
//  Copyright © 2023 ArthTech Solutions. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    var lat = ""
    var long = ""
    var locationManager = CLLocationManager()
    var location : CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
       // locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self

        locationManager.startUpdatingLocation()
     
        let london = MKPointAnnotation()
        london.title = ""
        london.coordinate = CLLocationCoordinate2D(latitude: Double(lat) ??  0.0, longitude: Double(long) ?? 0.0)
        mapKit.addAnnotation(london)
        //mapKit.showsUserLocation = true

      }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard locations.first != nil else { return }

       // let coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude:  0.0)
        let coordinate = CLLocationCoordinate2D(latitude: Double(lat) ?? 0.0, longitude: Double(long) ?? 0.0)
        let span = MKCoordinateSpan(latitudeDelta: 0.030, longitudeDelta: 0.030)

        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapKit.setRegion(region, animated: true)

    }
    

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
 

    @IBAction func backActionBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
