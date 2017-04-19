//
//  ViewController.swift
//  learningUnitTests
//
//  Created by Storm on 13/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

import UIKit

class ConvertionController: UIViewController, Settable {

    // MARK: Outlets
    
    @IBOutlet weak var valueToConvert: UITextField!
    @IBOutlet weak var valueConverted: UILabel!
    @IBOutlet weak var coinFrom: UILabel!
    @IBOutlet weak var coinTo: UILabel!
    
    
    // MARK: Vars
    
    lazy var settingsModal: SettingsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
    var baseCoin = CoinModel.Coin.dollar
    var convertedCoin = CoinModel.Coin.bitcoin
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAttributesFromCoins()
    }
    
    func setAttributesFromCoins() {
        
        self.coinFrom.text = baseCoin.name
        self.coinTo.text = convertedCoin.name
        self.valueToConvert.text = removeSpecialChars(from: self.valueToConvert.text)
    }
    
    func convertStringValueToDouble(value: String?) -> Double {
        
        guard let stringValue = value else { return 0 }
        guard let coinFromDouble = Double(stringValue) else { return 0 }
        
        return coinFromDouble
    }
    
    func removeSpecialChars(from: String?) -> String? {
        
        var stringValue = from
        let chars = [",", ".", "*", "[", "]", "_", "-", "(", ")", "^", "$", "/", "\\", "|"]
        
        for char in chars {
            stringValue = stringValue?.replacingOccurrences(of: char, with: "")
        }
        
        return stringValue
    }
    
    func getConvertedCoinValue(from: Double) -> String {
        
        let coinToConvert = CoinModel(value: from, type: self.baseCoin)
        let newCoin = CoinModel(value: coinToConvert.convert(to: convertedCoin), type: convertedCoin)
        
        return newCoin.valueFormated().replacingOccurrences(of: ".", with: ",")
    }
    
    
    // MARK: Settable Protocol
    
    func settingBaseCoin(type: CoinModel.Coin) {
        baseCoin = type
        setAttributesFromCoins()
    }
    
    func settingConvertedCoin(type: CoinModel.Coin) {
        convertedCoin = type
        setAttributesFromCoins()
    }
    
    // MARK: UIPopoverPresentationDelegate
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    // MARK: Actions
    
    @IBAction func showSettings(_ sender: UIButton) {
        settingsModal.delegate = self
        settingsModal.configModal(sender);
        self.present(settingsModal, animated: true, completion: nil)
    }
    
    @IBAction func convert(_ sender: UIButton) {
        
        self.valueConverted.text = getConvertedCoinValue(from: convertStringValueToDouble(value: self.valueToConvert.text))
        setAttributesFromCoins()
    }
    
}

