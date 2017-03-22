//
//  Event.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

open class Event: NSObject {
    dynamic var rootUUID: String = ""
    dynamic var playhead: NSNumber = 0
    dynamic var type: String = ""
    dynamic var data: Data? = nil
    
    func visit(handlers: [EventHandler]) {
        for handler in handlers {
            handler.handle(event: self)
        }
    }
}
