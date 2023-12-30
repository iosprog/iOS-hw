//
//  ViewController.swift
//  mapView
//
//  Created by РАХАТ on 21.12.2023.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var zoomInButton: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    var fullInfo2 = info()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        let lat:CLLocationDegrees = fullInfo2.latForAtt
        let long:CLLocationDegrees = fullInfo2.longForAtt
        
        // Создаем координта передавая долготу и широту
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Задаем коортинаты метке
        anotation.coordinate = location
        
        // Задаем название метке
        
        anotation.title = fullInfo2.textField
        
        // Добавляем метку на карту
        mapView.addAnnotation(anotation)
    
         //Настраиваем долгое нажатие - добавляем новые метки на
        let longPress = UILongPressGestureRecognizer(target: self, action:
                                                        #selector(self.longPressAction))
        longPress.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPress)
        
    }

    @IBAction func zoomInButtonTapped(_ sender: UIButton) {
        zoomMapView(zoomFactor: 4)
    }

    @IBAction func zoomOutButtonTapped(_ sender: UIButton) {
        zoomMapView(zoomFactor: 0.4)
    }

    @objc func stepperValueChanged(_ stepper: UIStepper) {
        zoomMapView(zoomFactor: stepper.value)
    }

    func zoomMapView(zoomFactor: Double) {
        var region = mapView.region

        // Ensure the span values are within a valid range
        let minDelta: CLLocationDegrees = 0.0005
        let maxDelta: CLLocationDegrees = 150.0
        region.span.latitudeDelta /= zoomFactor
        region.span.longitudeDelta /= zoomFactor
        region.span.latitudeDelta = min(max(minDelta, region.span.latitudeDelta), maxDelta)
        region.span.longitudeDelta = min(max(minDelta, region.span.longitudeDelta), maxDelta)

        mapView.setRegion(region, animated: true)
    }
    
     //Долгое нажатие на карту - добавляем новые метки
    @objc func longPressAction(gestureRecognizer: UIGestureRecognizer) {
        print ("gestureRecognizer")
        
        // Получаем точку нажатия на экране
        let touchPoint = gestureRecognizer.location(in: mapView)
        
        // Конвертируем точку нажатия на экране в координаты пользователя
        let newCoor: CLLocationCoordinate2D = mapView.convert(touchPoint, toCoordinateFrom:mapView)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        anotation.coordinate = newCoor
        
        anotation.title = "Title"
        anotation.subtitle = "subtitle"
        
        mapView.addAnnotation(anotation)
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        print(view.annotation?.title!! as Any)
        
        // Routing - построение маршрута
        // 1 Координаты начальной точки А и точки В
        let sourceLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        
        // 2 упаковка в Placemark
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation,
                                               addressDictionary: nil)
        
        // 3 упаковка в MapItem
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 4 Запрос на построение маршрута
        let directionRequest = MKDirections.Request()
        
        // указываем точку А, то есть нашего пользователя
        directionRequest.source = sourceMapItem
        // указываем точку В, то есть метку на карте
        directionRequest.destination = destinationMapItem
        
        // выбираем на чем будем ехать
        directionRequest.transportType = .automobile
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            // Если будет ошибка с маршрутом
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
        let route = response.routes[0]
            
        // Рисуем на карте линию маршрута (polyline)
        self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
        // Приближаем карту с анимацией в регион всего маршрута
        let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    func mapViewl (_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        // Настраиваем линию
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        // Цвет красный
        renderer.strokeColor = UIColor.blue
        
        // Ширина линии
        renderer.lineWidth = 4.0
        
        return renderer
    }
}
