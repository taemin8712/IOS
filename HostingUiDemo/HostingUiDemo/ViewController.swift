//
//  ViewController.swift
//  HostingUiDemo
//
//  Created by taemmy on 2021/01/10.
//  Copyright © 2021 tm. All rights reserved.
//

import UIKit
import MapKit

import SwiftUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTest(_ sender: Any) {
        
//        let alert = UIAlertController(title: "Alert", message: "Message Area", preferredStyle: .alert)
//        let action = UIAlertController(title: "Action Sheet", message: "Message Area", preferredStyle: .actionSheet)
//        self.present(alert, animated: true)
        
        let alert = UIAlertController(title: nil, message: "Check", preferredStyle: .alert)
        let v = UIViewController()
     
        v.view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        v.view.backgroundColor = .green
        
        let okalert = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                        print("Ok Button Click")
        }
        
        alert.addAction(okalert)
//        alert.setValue(v, forKey: "contentViewController")
//        alert.setValue(mapAlert(), forKey: "contentViewController")
        alert.setValue(tableview()
            , forKey: "contentViewController")
        self.present(alert, animated: true)
    }
    
    func mapAlert() -> UIViewController{
        let contentVC = UIViewController()
        
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        contentVC.view = mapkitView
        
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: pos, span: span)
        
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
       
        contentVC.preferredContentSize.height = 500
        contentVC.preferredContentSize.width = 400
        
        return contentVC
    }
    func tableview() -> ListViewController {
        let contentVC = ListViewController()
        contentVC.delegate = self
        return contentVC
    }
    func didSelectedItem(IndexPath: IndexPath)  {
            print("\(IndexPath.row) is selected!")
    }
    
    
 
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touchesEnded Event")
        let bar = self.navigationController?.navigationBar
        let ts = TimeInterval(0.3)
        UIView.animate(withDuration: ts) {
            bar?.alpha =  bar?.alpha == 0 ? 1 : 0
        }
    }
    @IBSegueAction func showSwiftUiView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder,rootView: SwiftUiView())
    }
    
}

