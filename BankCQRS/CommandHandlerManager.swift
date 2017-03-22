//
//  CommandHandlerManager.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class CommandHandlerManager {
    public static func subscribeCommandHandlers () {
        CommandBus.sharedInstance.subscribe(handler: BankAccountCommandHandler())
    }
}
