//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol CoinsManage{
    
    func didFailWithError(error : Error)
    func didiUpdateCurrency(Currency : Double)
    
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinsManage!
    

    
    func getCoinsPrice(for currency: String){
        
        let url = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=3C538A27-6EEF-481E-89A4-250325D2D4D2"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String){
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, Response, erroe in
                if erroe != nil{
                    
                    self.delegate?.didFailWithError(error: erroe!)
                    return
                }
                if let safedata = data{
                    
                    if let currency = self.paeseJSON(currencydata: safedata){
                        self.delegate.didiUpdateCurrency(Currency: currency.rate)
                    }
                }
            }
            task.resume()
        }
    }
    
    func paeseJSON(currencydata : Data)-> CurrencyModel?{
        
        let decode = JSONDecoder()
        do{
            let decodedata = try decode.decode(CurrencyModel.self, from: currencydata)
            let rate = decodedata.rate
            let curetret = CurrencyModel.init(rate: rate)
            return curetret
        }
        catch{
            delegate.didFailWithError(error: error)
            return nil
        }
    }
}
