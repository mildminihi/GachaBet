//
//  HistoryModel.swift
//  GachaBet
//
//  Created by Supanat Wanroj on 23/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation

struct History {
    
    struct HistoryTableCell {
        var rarity: String
        var name: String
      init(rarity: String, name: String) {
        rarity = rarity
        name = name
      }
    }
    
    struct ShowHistoryTable {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }
}
