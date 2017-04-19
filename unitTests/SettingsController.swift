//
//  SettingsController.swift
//  unitTests
//
//  Created by Storm on 18/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var baseCoinCheckList: [UISwitch]!
    @IBOutlet var convertedCoinCheckList: [UISwitch]!
    
    
    // MARK: - Vars
    
    var delegate: Settable?
    let coinTupleList = [(type: CoinModel.Coin.dollar, tag: 1), (type: CoinModel.Coin.euro, tag: 2), (type: CoinModel.Coin.real, tag: 3), (type: CoinModel.Coin.bitcoin, tag: 4)]
    
    
    // MARK: - Methods
    
    func configModal(_ sender: UIButton) {
        
        guard let delegate = delegate else { return print("delegate not setted") }
        
        self.modalPresentationStyle = .popover
        self.popoverPresentationController?.sourceRect = CGRect(x: sender.bounds.width / 2, y: sender.bounds.height, width: 0, height: 0)
        self.preferredContentSize = CGSize(width: 320, height: 450)
        self.popoverPresentationController?.permittedArrowDirections = .up
        self.popoverPresentationController?.delegate = delegate
        self.popoverPresentationController?.sourceView = sender
    }
    
    func getCoinFromList(tag: Int) -> CoinModel.Coin? {
        
        return coinTupleList.filter({ $0.tag == tag }).first?.type
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    
    // MARK: - Actions
    
    @IBAction func changeBaseCoin(_ sender: UISwitch) {
        
        for check in baseCoinCheckList {
            check.isOn = false
        }
        
        sender.isOn = true
        
        guard let coinType = getCoinFromList(tag: sender.tag) else { return }
        
        delegate?.settingBaseCoin(type: coinType)
    }
    
    @IBAction func changeConvertedCoin(_ sender: UISwitch) {
        
        for check in convertedCoinCheckList {
            check.isOn = false
        }
        
        sender.isOn = true
        
        guard let coinType = getCoinFromList(tag: sender.tag) else { return }
        
        delegate?.settingConvertedCoin(type: coinType)
    }
}
