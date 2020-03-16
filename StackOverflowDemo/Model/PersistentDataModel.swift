//
//  PersistentDataModel.swift
//  StackOverflowDemo
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import UIKit

class PersistentDataModel: NSObject {
    /* This property is privateShared of type private Static */
    private static var privateShared: PersistentDataModel?
    
    /* Description: Creating Shared instance of this class
     - Returns: returns class itself
     */
    class func shared() -> PersistentDataModel { // change class to final to prevent override
        guard let uwShared = privateShared else {
            privateShared = PersistentDataModel()
            return privateShared!
        }
        return uwShared
    }
    var jsonData : BaseClass?
    var rorHeight = [CGFloat]()
}
