//
//  Coin.swift
//  learningUnitTests
//
//  Created by Storm on 13/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

struct CoinModel {
    
    //MARK: Vars
    
    var value: Double
    var type: Coin
    
    public enum Coin {
        case dollar
        case euro
        case bitcoin
        case real
        
        var name: String {
            switch self {
                case .dollar: return "Dollar"
                case .euro: return "Euro"
                case .bitcoin: return "Bitcoin"
                case .real: return "Real"
            }
        }
        
        var value: Double {
            //values based in dollar
            switch self {
                case .real: return 0.32
                case .euro: return 1.06
                case .bitcoin: return 1178.77
                default: return 1
            }
        }
    }
    
    //MARK: Initializers
    
    init(value: Double, type: Coin = .dollar) {
        self.value = value
        self.type = type
    }
    
    //MARK: Methods
    
    func convert(to: Coin) -> Double {
        let valueInBaseCoin = self.value * self.type.value
        return valueInBaseCoin / to.value
    }
    
    func valueFormated() -> String {
        return String(format: "%.02f", arguments: [self.value])
    }
}
