//
//  MapViewController.swift
//  NaverMapPractice
//
//  Created by 정채은 on 12/28/23.
//

import UIKit

import NMapsMap
import SnapKit

class MapViewController: UIViewController {
    
    let mapView = NMFMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

