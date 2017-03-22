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
    
    override func visit(handlers: [EventHandler]) {
        for handler in handlers {
            handler.handle(event: self)
        }
    }
    
    public static func create(rootUUID: String, amount: Double) -> MoneyWasWithdrawn {
        let event = MoneyWasWithdrawn()
        event.amount = amount
        event.rootUUID = rootUUID
        event.type = "MoneyWasWithdrawn"
        
        return event
    }
    
    func getAmount() -> Double {
        return amount
    }
}
