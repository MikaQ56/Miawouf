//
//  Model.swift
//  Miawouf
//
//  Created by Mickael on 31/08/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import Foundation

struct Pet {
    enum Gender {
        case male, female
    }
    
    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}
