//
//  HistoryInteractor.swift
//  GachaBet
//
//  Created by Supanat Wanroj on 23/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation

import Foundation

protocol HistoryInteractorInterface: class {
    func getHistoryTable(request: History.ShowHistoryTable.Request)
}

class HistoryInteractor: HistoryInteractorInterface {
    var presenter: HistoryPresenterInterface!
    
    func getHistoryTable(request: History.ShowHistoryTable.Request) {
        <#code#>
    }
}
