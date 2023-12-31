//
//  MapViewController.swift
//  NaverMapPractice
//
//  Created by 정채은 on 12/28/23.
//

import UIKit

import CoreLocation
import NMapsMap
import SnapKit
import Then

class MapViewController: UIViewController {
    
    let mapsView = NMFNaverMapView()
    var locationManager = CLLocationManager()
    let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.3, lng: 127.1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLocationManager()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        mapsView.do {
            $0.showLocationButton = true
            $0.mapView.positionMode = .compass
            $0.mapView.isNightModeEnabled = true
            $0.mapView.mapType = .navi
            $0.mapView.moveCamera(cameraUpdate)
        }
        
        cameraUpdate.do {
            $0.animation = .easeIn
        }
    }
    
    
    private func setLayout() {
        view.addSubview(mapsView)
        mapsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                //현 위치로 카메라 이동
//                let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: self.locationManager.location?.coordinate.latitude ?? 0, lng: self.locationManager.location?.coordinate.longitude ?? 0))
//                cameraUpdate.animation = .easeIn
//                self.mapsView.mapView.moveCamera(cameraUpdate)
//                
//                let marker = NMFMarker()
//                marker.position = NMGLatLng(lat: self.locationManager.location?.coordinate.latitude ?? 0, lng: self.locationManager.location?.coordinate.longitude ?? 0)
//                marker.mapView = self.mapsView.mapView
                self.locationManager.startUpdatingLocation()
            } else {
                print("위치 서비스 허용 off")
            }
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("위치 업데이트!")
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
        }
    }
    
    // 위치 가져오기 실패
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        print("error")
    }
}
