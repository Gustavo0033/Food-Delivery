//
//  TrackFoodViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 15/04/24.
//

import UIKit
import MapKit

class TrackFoodViewController: UIViewController {
    
    @IBOutlet weak var trackMap: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let latitude: CLLocationDegrees = -23.54993
        let longitude: CLLocationDegrees = -46.625283
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizada: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizada)

        
        
        trackMap.setRegion(regiao, animated: true)
        

        // Do any additional setup after loading the view.
    }
    

    
    

}

extension TrackFoodViewController:MKMapViewDelegate, CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse{
            
            let alertController = UIAlertController(title: "Permissão de localização", message: "Necessário permissão para acessar sua localização", preferredStyle: .alert)
            let confiAction = UIAlertAction(title: "Abrir configurações", style: .default) { (alertController) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                    
                }
            }
        }
    }
    
}
