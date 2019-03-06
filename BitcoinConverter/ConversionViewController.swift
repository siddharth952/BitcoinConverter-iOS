//
//  ConversionViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 06/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit
import Alamofire

class ConversionViewController: UIViewController {

    //Outlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    
    @IBOutlet weak var currencyUIView: UIImageView!
    
    
    //Variables
    var hourlyDataPassedOver : Double?
    var currencyIconName : String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIWithBitcoinData()
 
        
        //Checking If App Has Entered Into The Background
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            print("App In Background")
        //Go To Select Currency View Controller
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - To Update UI
    /******************************************************************/
    
    func updateUIWithBitcoinData(){
        bitcoinPriceLabel.text = "\(hourlyDataPassedOver ?? 0)"
        currencyUIView.image = UIImage(named: currencyIconName ?? "None")
    }
    
    
 
    
    
    
    
    
    
    
}
