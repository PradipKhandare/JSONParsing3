//
//  JsonDataModel.swift
//  JSONParsing3
//
//  Created by NTS on 08/01/24.
//

import Foundation

struct JsonDataModel: Codable
{
    let userId :  Int
    let id : Int
    let title : String
    let completed : Bool
    
    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
