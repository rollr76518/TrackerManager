//
//  EventStore.swift
//  TrackerManager
//
//  Created by hanyu on 2020/8/1.
//  Copyright © 2020 hanyu. All rights reserved.
//

import Foundation

protocol EventStore {

    var events: [Event] { get }
    func add(event: Event)
    func removeEvent(at index: Int)
}
