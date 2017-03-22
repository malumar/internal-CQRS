//
//  WithdrawCommand.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class DepositCommand: Command {
    private var rootUUID = ""
    private var amount = 0.0
    
    init(rootUUID: String, amount: Double) {
        self.rootUUID = rootUUID
        self.amount = amount
    }
    
    func visit(handlers: [CommandHandler]) {
        for handler in handlers {
            handler.handle(command: self)
        }
    }
    
    func getRootUUID() -> String {
        return rootUUID
    }
    
    func getAmount() -> Double {
        return amount
    }
}
