//
//  ConversionViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 06/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Checking If App Has Entered Into The Background
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            print("App In Background")
        //Go To Select Currency View Controller
            self.performSegue(withIdentifier: "goToSelect", sender: self)
            
    }
 }
}
