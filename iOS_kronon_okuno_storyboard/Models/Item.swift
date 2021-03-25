//
//  Item.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/23.
//

import Foundation

struct Item: Codable {
    var success: Bool
    var code: Int
    var data: Array<String>
}

struct error: Codable {
    var success: Bool
    var code: Int
    var data: String
}
