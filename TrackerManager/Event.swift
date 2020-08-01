//
//  Event.swift
//  TrackerManager
//
//  Created by hanyu on 2020/8/1.
//  Copyright © 2020 hanyu. All rights reserved.
//

import Foundation

protocol Event {
    
    var name: String { get }
    var type: String { get }
    var properties: [String: Any]? { get }
}
