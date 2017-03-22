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
    
    func save(uncommittedEvents: [Event]) {
        events.append(contentsOf: uncommittedEvents)
    }
    
    func getEvents() -> [Event] {
        return events
    }
}
