//
//  WithdrawCommand.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class WithdrawCommand: Command {
    private var uuid = ""
    private var amount = 0.0
    
    init(amount: Double) {
        self.amount = amount
        uuid = UUID().uuidString
    }
    
    func visit(handlers: [CommandHandler]) {
        for _ in handlers { // replace _ with handler var
            // TO DO: handler
        }
    }
    
    func getCommandName() -> String {
        return "WithdrawCommand"
    }
    
    func getUUID() -> String {
        return uuid
    }
    
    func getData() -> Data? {
        let data : [String: Any] = [
            "UUID": uuid,
            "amount": amount
        ]
        
        return NSKeyedArchiver.archivedData(withRootObject: data)
    }
}
