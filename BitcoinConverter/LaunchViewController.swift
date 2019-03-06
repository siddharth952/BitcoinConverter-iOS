//
//  LaunchViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 05/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LaunchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Defaults
    let defaults = UserDefaults.standard

    //API
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    //Picker View Data
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Declare instance variables
    let bitcoinDataModel = BitcoinDataModel()
    
    //IBOutlets
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Name Given!
        let Input_Name = defaults.string(forKey: "Name_User_Input")
        //NameLabel.text = namePassedOver
        NameLabel.text = "Hello, " + Input_Name! + "!"
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        //Show Loading Screen
        self.showSpinner(onView: self.view)
    
         //Testing Condition For GET (completion handler)
        getBitcoinData(url: finalURL) { (success) -> Void in
            if success {
                // Do second task if success
                self.removeSpinner()
                self.performSegue(withIdentifier: "goToThird", sender: self)
            }
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
        //MARK: - Picker View
    /***************************************************************/
    
    
    //Determine how many columns we want in our picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    //How many rows this picker should have
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    //Fill the picker row titles with the Strings from our currencyArray
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        finalURL = baseURL + currencyArray[row]
        return currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLabel.text = currencyArray[row]
    }

    
    
    
    
        //MARK: - Networking
        /***************************************************************/
    
    func getBitcoinData(url: String, completion: @escaping (_ success: Bool) -> Void) {

            AF.request(url, method: .get)
                .responseJSON { response in
                    if response.result.isSuccess {

                        print("Sucess! Got the Conversion data")
                        let bitcoinJSON : JSON = JSON(response.result.value!)

                        self.updateBitcoinData(json: bitcoinJSON)
                        print(bitcoinJSON)
                        
                        completion(true)
                        
                    } else {
                        print("Error: \(String(describing: response.result.error))")
                      //  self.bitcoinPriceLabel.text = "Connection Issues"
                    }
                }

        }
    
    
 
    
        //MARK: - JSON Parsing
        /***************************************************************/
    
        func updateBitcoinData(json : JSON) {
    
            if let open_hour = json["open"]["hour"].double {
                
                bitcoinDataModel.hourly = open_hour
                bitcoinDataModel.high = json["high"].doubleValue
                bitcoinDataModel.low = json["low"].doubleValue
                bitcoinDataModel.hourly_percent = json["percent"]["hour"].doubleValue
                bitcoinDataModel.display_symbol = json["display_symbol"].stringValue
                bitcoinDataModel.currencyIconName = bitcoinDataModel.updateCurrencyIcon(condition: bitcoinDataModel.display_symbol)
                
            }else{
                //Print Out To UI That There Was an Error!
                errorLabel.text = "You Seem to be Offline!"
                print("Cannot Fetch Bitcoin Data")
            }
    
    }
    
    
    
    // MARK: - To Pass Data
    /******************************************************************/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "goToThird" {

            let destinationViewController = segue.destination as! ConversionViewController

            destinationViewController.hourlyDataPassedOver = self.bitcoinDataModel.hourly
            destinationViewController.currencyIconName = self.bitcoinDataModel.currencyIconName
        }
    }
    
    
}



// MARK: - /Extension For Loading Screen
/******************************************************************/

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
    
    

    

