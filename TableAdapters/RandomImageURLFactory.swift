//
//  RandomImageURLFactory.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 02/12/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import Foundation

enum RandomImageURLFactory {
    
    private static let base = "http://via.placeholder.com/"
    
    static func make() -> URL {
        let size: UInt32 = arc4random() % 300 + 100
        return URL(string: base + "\(size)x\(size)")!
    }
}
