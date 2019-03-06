//
//  BitcoinDataModel.swift
//  BitcoinConverter
//
//  Created by Siddharth Sen on 06/03/19.
//  Copyright © 2019 Siddharth Sen. All rights reserved.
//

//For Data

import UIKit

class BitcoinDataModel {

    //Declare model variables
    
    var hourly : Double = 0.0
    var high : Double = 0.0
    var low : Double = 0.0
    var hourly_percent : Double = 0.0
    var display_symbol : String = ""
    var currencyIconName : String = ""
 
    //This method turns a condition code into the name of the weather condition image
    
        func updateCurrencyIcon(condition: String) -> String {
    
        switch (condition) {
    
            case "BTC-INR" :
                return "INR"
    
            case "BTC-USD" :
                return "USD"
    
            case "BTC-EUR" :
                return "EUR"
    
            default :
                return "dunno"
            }
    
        }
}
