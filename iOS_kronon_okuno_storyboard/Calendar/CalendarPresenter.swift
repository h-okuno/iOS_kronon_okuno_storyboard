//
//  CalendarPresenter.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/10.
//

import Foundation

protocol ResponseForCalendar {
    func responseDateManager(response: [String])
    func responseNumberOfWeeks(response: Int)
}

class CalendarPresenter: ResponseForCalendar {

    var viewLogic: ViewLogic?
    
    func responseDateManager(response: [String]) {
        viewLogic?.daysArray = response
    }
    
    func responseNumberOfWeeks(response: Int) {
        viewLogic?.numberOfWeeks = response
    }
    
}
