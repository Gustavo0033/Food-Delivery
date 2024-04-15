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
    
        

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Pegando e mostrando a localizacao do usuario
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude

        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
        
        trackMap.setRegion(regiao, animated: true)
    }
    

    
    
    //MARK: - Solicitando permissão de acesso à localizacao do user
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
