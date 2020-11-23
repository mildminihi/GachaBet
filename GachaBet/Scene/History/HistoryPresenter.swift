//
//  HistoryPresenter.swift
//  GachaBet
//
//  Created by Supanat Wanroj on 23/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation

protocol HistoryPresenterInterface: class {
    func presentHistoryTable(response: History.ShowHistoryTable.Response)
}

class HistoryPresenter: HistoryPresenterInterface {
    var viewController: HistoryViewControllerInterface!
    
    func presentHistoryTable(response: History.ShowHistoryTable.Response) {
        <#code#>
    }
}
