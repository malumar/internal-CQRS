//
//  MoneyWasWithdrawn.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

open class MoneyWasWithdrawn: Event {
    private var amount = 0.0
    
    public static func create(rootUUID: String, amount: Double) -> MoneyWasWithdrawn {
        let event = MoneyWasWithdrawn()
        event.type = "MoneyWasWithdrawn"
        event.amount = amount
        event.rootUUID = rootUUID
        event.uuid = UUID().uuidString
        
        return event
    }
    
    func getAmount() -> Double {
        return amount
    }
}
