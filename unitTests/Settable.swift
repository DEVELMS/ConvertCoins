//
//  Settable.swift
//  unitTests
//
//  Created by Storm on 18/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

import UIKit

protocol Settable: UIPopoverPresentationControllerDelegate {
    
    func settingBaseCoin(type: CoinModel.Coin)
    func settingConvertedCoin(type: CoinModel.Coin)
}
