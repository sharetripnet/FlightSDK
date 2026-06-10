//
//  HostingVC.swift
//  STExample
//
//  Created by ShareTrip on 10/6/26.
//

import UIKit
import FlightSDK

class HostingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        
        if let navigationController {
            STFlightSDK.shared.openFlightSearch(navigationController)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
