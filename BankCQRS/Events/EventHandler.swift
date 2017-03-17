//
//  EventHandler.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

protocol EventHandler {
    func handle(event: Event)
}

extension EventHandler {
    func handle(event: Event) {}
}
