//
//  CommandHandler.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

protocol CommandHandler {
    func handle(command:WithdrawCommand)
}

extension CommandHandler {
    func handle(command:WithdrawCommand) {}

}
