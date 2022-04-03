//
//  User.swift
//  Appetizers
//
//  Created by Connie Waffles on 15/03/2022.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var surname = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false

}
