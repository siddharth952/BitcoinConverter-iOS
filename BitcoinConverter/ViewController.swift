//
//  ViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 05/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        defaults.set(nameTextField.text, forKey: "Name_User_Input")
        
        
        performSegue(withIdentifier: "goToSecond", sender: self)
    }
    
    
    // To Pass Data
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToSecond" {
//
//            let destinationViewController = segue.destination as! LaunchViewController
//
//            destinationViewController.namePassedOver = "Hello, " + nameTextField.text! + "!"
//        }
//    }
    
    
    
    

}



