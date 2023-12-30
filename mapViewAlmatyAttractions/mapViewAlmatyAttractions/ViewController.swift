//
//  ViewController.swift
//  mapViewAlmatyAttractions
//
//  Created by РАХАТ  on 23.12.2023.
//

import UIKit
import MapKit

struct info
{
    var imageName = ""
    var textField = ""
    var textInfo = ""
    var latForAtt = 0.0
    var longForAtt = 0.0
}


class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageViewNews: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mapView2: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    var fullInfo = info()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelText.text = fullInfo.textField
        imageViewNews.image = UIImage(named: fullInfo.imageName)
        textView.text = fullInfo.textInfo
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped))
            mapView2.addGestureRecognizer(tapGesture)
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        let lat:CLLocationDegrees = fullInfo.latForAtt
        let long:CLLocationDegrees = fullInfo.longForAtt
        
        // Создаем координта передавая долготу и широту
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Задаем коортинаты метке
        anotation.coordinate = location
        
        // Задаем название метке
        anotation.title = fullInfo.textField
        
        // Добавляем метку на карту
        mapView2.addAnnotation(anotation)
    }

    
    @objc func mapViewTapped() {

        let detailSecondVc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! SecondViewController
        
        detailSecondVc.fullInfo2 = fullInfo

        navigationController?.show(detailSecondVc, sender: self)
    }
    
    
}
