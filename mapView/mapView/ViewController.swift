//
//  ViewController.swift
//  mapView
//
//  Created by РАХАТ  on 21.12.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        let mapDragRecognizer = UIPanGestureRecognizer(target: self, action:
                                                        #selector(self.didDragMap))
        
        mapDragRecognizer.delegate = self
        
        mapView.addGestureRecognizer (mapDragRecognizer)
        
        
        let lat:CLLocationDegrees = 37.957666//43.2374454
        let long:CLLocationDegrees = -122.0323133//76.909891
        
        // Создаем координта передавая долготу и широту
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Задаем коортинаты метке
        anotation.coordinate = location
        
        // Задаем название метке
        anotation.title = "Title"
        
        // Задаем описание метке
        anotation.subtitle = "subtitle"
        
        // Добавляем метку на карту
        mapView.addAnnotation(anotation)
        
        // Настраиваем долгое нажатие - добавляем новые метки на
        let longPress = UILongPressGestureRecognizer(target: self, action:
                                                        #selector(self.longPressAction))
        // минимально 2 секунды
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
        // MKMapViewDelegate - чтоб отслеживать нажатие на метки на карте (метод didSelect)
        
        //        mapView.delegate = self
    }
    @IBAction func showMyLocation(_ sender: Any) {
        followMe = true
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        userLocation = locations[0]
        
        print(userLocation)
        
        if followMe {
            let latDelta:CLLocationDegrees = 0.01
            let longDelta:CLLocationDegrees = 0.01
            
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            // Создаем регион на карте с моими координатоми в центре
            let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
            // Приближаем карту с анимацией в данный регион
            mapView.setRegion(region, animated: true)
        }
    }
    
    @objc func didDragMap(gestureRecognizer: UIGestureRecognizer) {
        // Как только начали двигать карту
        if (gestureRecognizer.state == UIGestureRecognizer.State.began) {
            // Говорим не следовать за пользователем
            followMe = false
            print("Map drag began")
            // Когда закончили двигать карту
            if (gestureRecognizer.state == UIGestureRecognizer.State.ended) {
                print("Map drag ended" )
            }
        }
    }
    
    // Долгое нажатие на карту - добавляем новые метки
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
        
        // Получаем координаты метки
        let location:CLLocation = CLLocation(latitude: (view.annotation?.coordinate.latitude)!,longitude: (view.annotation?.coordinate.longitude)!)
        // Считаем растояние до метки от нашего пользователя
        let meters:CLLocationDistance = location.distance(from: userLocation)
        distanceLabel.text = String(format: "Distance: %.2f m", meters)
        
        // Routing - построение маршрута
        // 1 Координаты начальной точки А и точки В
        let sourceLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let destinationLocation = CLLocationCoordinate2D(latitude:
                                                            (view.annotation?.coordinate.latitude)!, longitude:
                                                            (view.annotation?.coordinate.longitude)!)
        
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
            self.mapView.setRegion (MKCoordinateRegion(rect),
            animated: true)
        }
    }
    func mapViewl (_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        // Настраиваем линию
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        // Цвет красный
        renderer.strokeColor = UIColor.red
        
        // Ширина линии
        renderer.lineWidth = 4.0
        
        return renderer
    }
}
