//
//  WithdrawCommand.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class DepositCommand: Command {
    private var uuid = ""
    private var amount = 0.0
    
    init(amount: Double) {
        self.amount = amount
        uuid = UUID().uuidString
    }
    
    func visit(handlers: [CommandHandler]) {
        for handler in handlers {
            handler.handle(command: self)
        }
    }
    
    func getCommandName() -> String {
        return "DepositCommand"
    }
    
    func getUUID() -> String {
        return uuid
    }
    
    func getData() -> Data? {
        let data: [String: Any] = [
            "UUID": uuid,
            "amount": amount
        ]
        
        return NSKeyedArchiver.archivedData(withRootObject: data)
    }
}
