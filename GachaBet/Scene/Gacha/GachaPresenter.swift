//
//  GachaPresenter.swift
//  GachaBet
//
//  Created by SUPANAT WANROJ on 20/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation
protocol GachaPresenterInterface: class {
  func presentDrawResult(response: Gacha.Draw.Response)
  func presentHistory(response: Gacha.GetHistory.Response)
}

class GachaPresenter: GachaPresenterInterface {
  
    var viewController: GachaViewControllerInterfacr!
  
  func presentHistory(response: Gacha.GetHistory.Response) {
    let viewModel = Gacha.GetHistory.ViewModel(result: response.result, history: response.history)
    viewController.displayHistory(viewModel: viewModel)
  }
  
  func presentDrawResult(response: Gacha.Draw.Response) {
    viewController.displayDrawResult(viewModel: Gacha.Draw.ViewModel(title: "Draw \(response.time)",result: response.result))
  }
}
