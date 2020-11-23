//
//  GachaInteractor.swift
//  GachaBet
//
//  Created by SUPANAT WANROJ on 20/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import Foundation

protocol GachaInteractorInterface: class {
  func getDraw(request: Gacha.Draw.Request)
  func getHistory(request: Gacha.GetHistory.Request)
}

class GachaInteractor: GachaInteractorInterface {
  var presenter: GachaPresenterInterface!
  var resultArray: [String] = []
  var currentResultArray: [String] = []
  var garunteeSR: [String] = []
  var garunteeSSR: [String] = []
  
  func getDraw(request: Gacha.Draw.Request) {
    for _ in 1...request.time {
      letDraw()
    }
    presenter.presentDrawResult(response: Gacha.Draw.Response(time: "\(request.time)",result: report(resultArray: currentResultArray)))
    currentResultArray.removeAll()
  }
  
  func getHistory(request: Gacha.GetHistory.Request) {
    let response = Gacha.GetHistory.Response(result: report(resultArray: resultArray), history: resultArray)
    presenter.presentHistory(response: response)
  }
  
  private func checkGarunteeSSR() -> Bool {
    print("GARUNTEESSR\(garunteeSSR)")
    if garunteeSSR.count >= 90 {
      if !garunteeSSR.contains("SSR"){
        resultArray.append("SSR")
        currentResultArray.append("SSR")
        garunteeSSR.removeAll()
        return true
      }
    }
    return false
  }

  private func checkGarunteeSR() -> Bool {
    print("GARUNTEESR\(garunteeSR)")
    if garunteeSR.count >= 9 {
      if !garunteeSR.contains("SR"){
        resultArray.append("SR")
        currentResultArray.append("SR")
        garunteeSR.removeAll()
        return true
      }
    }
    return false
  }

  private func letDraw() {
    let chanceSSR: Float = 0.6
    let chanceSR: Float = 5.1
    let ran = Float.random(in: 0...1)
    if ran*100 < chanceSSR {
      resultArray.append("SSR")
      currentResultArray.append("SSR")
      garunteeSR.append("SSR")
      garunteeSSR.append("SSR")
      garunteeSSR.removeAll()
    }
    else if ran*100 < chanceSR {
      resultArray.append("SR")
      currentResultArray.append("SR")
      garunteeSR.append("SR")
      garunteeSSR.append("SR")
      garunteeSR.removeAll()
    }
      else {
      if checkGarunteeSR() {
        garunteeSSR.append("SR")
        return }
      if checkGarunteeSSR() { return }
      currentResultArray.append("R")
      resultArray.append("R")
      garunteeSR.append("R")
      garunteeSSR.append("R")
    }
  }

  func report(resultArray: [String]) -> String {
    var ssrCount = 0
    var srCount = 0
    var rCount = 0
    for item in resultArray {
      switch item {
      case "SSR":
        ssrCount += 1
      case "SR":
        srCount += 1
      default:
        rCount += 1
      }
    }
    return("SSR:\(ssrCount) SR:\(srCount) R:\(rCount)")
  }
}
