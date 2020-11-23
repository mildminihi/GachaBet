//
//  GachaModel.swift
//  GachaBet
//
//  Created by SUPANAT WANROJ on 20/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation

struct Gacha {
  struct Draw {
    struct Request {
      let time: Int
    }
    struct Response {
      let time: String
      let result: String
    }
    struct ViewModel {
      let title: String
      let result: String
    }
  }
  
  struct GetHistory {
    struct Request {}
    struct Response {
      let result: String
      let history: [String]
    }
    struct ViewModel {
      let result: String
      let history: [String]
    }
  }
}
