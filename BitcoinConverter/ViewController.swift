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
        
        if defaults.bool(forKey: "firstRun_Value") == true {
            performSegue(withIdentifier: "goToSecond", sender: self)
        }
    }

    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let firstRun = true
        defaults.set(nameTextField.text, forKey: "Name_User_Input")
        defaults.set(firstRun, forKey: "firstRun_Value")
        
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



