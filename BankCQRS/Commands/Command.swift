//
//  File.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

protocol Command {
    func visit(handlers: [CommandHandler])
    func getCommandName() -> String
    func getUUID() -> String
    func getData() -> Data?
}


