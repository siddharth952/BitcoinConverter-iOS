//
//  ViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 05/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    
    //Outlets
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        if defaults.bool(forKey: "firstRun_Value") == true {
//            print(defaults.bool(forKey: "firstRun_Value") )
//            performSegue(withIdentifier: "goToSecond", sender: self)
//        }
//    }

    
    @IBAction func nextButtonPressed(_ sender: Any) {
        //User Running For First Time?
        let firstRun = true
        //Save User Name
        defaults.set(nameTextField.text, forKey: "Name_User_Input")
        //Save First Run is True Or False
        defaults.set(firstRun, forKey: "firstRun_Value")
        //Go To Second View
        performSegue(withIdentifier: "goToSecond", sender: self)
    }
    
    

}


//Dismiss Keyboard Wehen Return Tapped
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



