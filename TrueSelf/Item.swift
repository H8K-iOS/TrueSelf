//
//  Item.swift
//  TrueSelf
//
//  Created by Oleksandr Alimov on 21/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
