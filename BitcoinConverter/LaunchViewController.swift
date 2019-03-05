//
//  LaunchViewController.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 05/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    var namePassedOver : String?
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""
    
    //IBOutlets
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Name Given!
        NameLabel.text = namePassedOver
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToThird", sender: self)
    }
    
    //Picker View
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLabel.text = currencyArray[row]
    }
    
    
    
    
    //TODO: Place your 3 UIPickerView delegate methods here
   

    //
    //    //MARK: - Networking
    //    /***************************************************************/
    //
    //    func getWeatherData(url: String, parameters: [String : String]) {
    //
    //        Alamofire.request(url, method: .get, parameters: parameters)
    //            .responseJSON { response in
    //                if response.result.isSuccess {
    //
    //                    print("Sucess! Got the weather data")
    //                    let weatherJSON : JSON = JSON(response.result.value!)
    //
    //                    self.updateWeatherData(json: weatherJSON)
    //
    //                } else {
    //                    print("Error: \(String(describing: response.result.error))")
    //                    self.bitcoinPriceLabel.text = "Connection Issues"
    //                }
    //            }
    //
    //    }
    //
    //
    //
    //
    //
    //    //MARK: - JSON Parsing
    //    /***************************************************************/
    //
    //    func updateWeatherData(json : JSON) {
    //
    //        if let tempResult = json["main"]["temp"].double {
    //
    //        weatherData.temperature = Int(round(tempResult!) - 273.15)
    //        weatherData.city = json["name"].stringValue
    //        weatherData.condition = json["weather"][0]["id"].intValue
    //        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
    //        }
    //
    //        updateUIWithWeatherData()

}



    
    

    
    
  
    
    
    

    

