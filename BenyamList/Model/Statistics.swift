//
//  Statistics.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 10.11.2022.
//

import Foundation

struct Statictics{
    var totalNumberOfTasks:Int
    var completedNumberOfTasks:Int
    let type:StaticticType
    
    enum StaticticType: String{
        case overall, today
    }
}
