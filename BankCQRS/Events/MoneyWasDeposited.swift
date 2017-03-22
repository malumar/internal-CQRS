//
//  MoneyWasWithdrawn.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

open class MoneyWasDeposited: Event {
    private var amount = 0.0
    
    override func visit(handlers: [EventHandler]) {
        for handler in handlers {
            handler.handle(event: self)
        }
    }
    
    public static func create(rootUUID: String, amount: Double) -> MoneyWasDeposited {
        let event = MoneyWasDeposited()
        event.amount = amount
        event.rootUUID = rootUUID
        event.type = "MoneyWasDeposited"
        
        return event
    }
    
    func getAmount() -> Double {
        return amount
    }
}
