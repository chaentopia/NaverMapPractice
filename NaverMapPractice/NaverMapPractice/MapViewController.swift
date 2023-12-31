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
    
    var nowLat: Double = 37.3
    var nowLng: Double = 127.1
    let titleLabel = UILabel()
    let mapsView = NMFNaverMapView()
    var locationManager = CLLocationManager()
    lazy var cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: self.nowLat, lng: self.nowLng))
    let locationButton = NMFLocationButton()
    
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
        titleLabel.do {
            $0.text = "서울특별시 강서구"
            $0.textColor = .white
            $0.font = .boldSystemFont(ofSize: 20)
        }
        
        mapsView.do {
//            $0.showLocationButton = false
            $0.mapView.positionMode = .compass
            $0.mapView.isNightModeEnabled = true
            $0.mapView.mapType = .navi
            $0.mapView.moveCamera(cameraUpdate)
            $0.showScaleBar = false
            $0.showZoomControls = false
        }
        
        locationButton.do {
            // 수정 필요
            $0.backgroundColor = .white
            $0.mapView = mapsView.mapView
            $0.layer.cornerRadius = 25
            $0.clipsToBounds = true
            $0.layer.masksToBounds = true
        }
        
        cameraUpdate.do {
            $0.animation = .easeIn
        }
    }
    
    
    private func setLayout() {
        view.addSubview(mapsView)
        view.addSubview(titleLabel)
        mapsView.addSubview(locationButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.equalToSuperview().inset(20)
        }
        
        mapsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        locationButton.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(82)
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
            nowLat = location.coordinate.latitude
            nowLng = location.coordinate.longitude
            self.mapsView.mapView.moveCamera(cameraUpdate)
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
