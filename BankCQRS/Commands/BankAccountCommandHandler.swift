//
//  BankAccountCommandHandler.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccountCommandHandler: CommandHandler {
    func handle(command: WithdrawCommand) {
        print("handle cmd")
    }
}
