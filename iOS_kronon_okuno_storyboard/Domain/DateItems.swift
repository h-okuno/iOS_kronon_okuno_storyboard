//
//  DateItems.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/10.
//

import Foundation

enum DateItems {
    
    enum ThisMonth {
        struct Request {
            
            var year: Int
            var month: Int
            var day: Int
            
            init() {
                let calendar = Calendar(identifier: .gregorian)
                let date = calendar.dateComponents([.year, .month, .day], from: Date())
                year = date.year!
                month = date.month!
                day = date.day!
            }
        }
    }
    
    enum MoveMonth {
        struct Request {
            
            var year: Int
            var month: Int
            
            init(_ monthCounter: Int) {
                let calendar = Calendar(identifier: .gregorian)
                let date = calendar.date(byAdding: .month, value: monthCounter, to: Date())
                let newDate = calendar.dateComponents([.year, .month], from: date!)
                year = newDate.year!
                month = newDate.month!
            }
        }
    }
    
}
