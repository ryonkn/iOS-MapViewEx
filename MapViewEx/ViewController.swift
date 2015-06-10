//
//  ViewController.swift
//  MapViewEx
//
//  Created by Ryo Nakano on 2015/06/10.
//  Copyright (c) 2015年 Peppermint Club. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    var _mapView: MKMapView?
    
//===========================
//UI
//===========================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // マップビューの生成
        _mapView = makeMapView(self.view.frame)
        self.view.addSubview(_mapView!)
        
        // 位置の値の用意
        var coordinate = CLLocationCoordinate2D(
            latitude: 35.707527, longitude: 139.760857)
        
        // ズームの値の用意
        var span = MKCoordinateSpan(
            latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        // 位置とズームの値の指定
        var region = MKCoordinateRegion(center: coordinate, span: span)
        _mapView?.setRegion(region, animated: true)
    }

    // マップビューの生成
    func makeMapView(frame: CGRect) -> MKMapView {
        let mapView = MKMapView()
        mapView.frame = frame
        mapView.mapType = MKMapType.Standard
        mapView.autoresizingMask =
            UIViewAutoresizing.FlexibleRightMargin |
            UIViewAutoresizing.FlexibleTopMargin |
            UIViewAutoresizing.FlexibleLeftMargin |
            UIViewAutoresizing.FlexibleBottomMargin |
            UIViewAutoresizing.FlexibleWidth |
            UIViewAutoresizing.FlexibleHeight
        mapView.delegate = self
        return mapView
    }

//============================
//MKMapViewDelegate
//============================
    // マップロード成功時に呼ばれる
    func mapViewDidFinishLoadingMap(mapView: MKMapView!) {
        println("マップロード成功")
    }
    
    // マップロード失敗時に呼ばれる
    func mapViewDidFailLoadingMap(mapView: MKMapView!, withError error: NSError!) {
        println("マップロード失敗")
    }

}

