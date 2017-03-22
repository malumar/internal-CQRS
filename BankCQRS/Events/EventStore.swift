//
//  EventStore.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class EventStore {
    static let sharedInstance = EventStore()
    private var events : [Event] = []
    
    private init(){}
    
    func save(event: Event) {
        self.events.append(event)
    }
    
    func getEvents() -> [Event] {
        return self.events
    }
}
