//
//  GachaViewController.swift
//  GachaBet
//
//  Created by SUPANAT WANROJ on 20/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import UIKit

protocol GachaViewControllerInterfacr: class {
  func displayDrawResult(viewModel: Gacha.Draw.ViewModel)
  func displayHistory(viewModel: Gacha.GetHistory.ViewModel)
}

class GachaViewController: UIViewController, GachaViewControllerInterfacr {
  var interactor: GachaInteractorInterface!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }
  
  // MARK: - Configuration
  
  func configure(viewController: GachaViewController) {
    let presenter = GachaPresenter()
    presenter.viewController = viewController

    let interactor = GachaInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayDrawResult(viewModel: Gacha.Draw.ViewModel) {
    let alert = UIAlertController(title: viewModel.title, message: viewModel.result, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in }))
    present(alert, animated: true)
  }
  
  func displayHistory(viewModel: Gacha.GetHistory.ViewModel) {
    let alert = UIAlertController(title: viewModel.result, message: viewModel.history.joined(separator: ","), preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in }))
    present(alert, animated: true)
  }
  
  @IBAction func clickDrawOneTime(_ sender: Any) {
    interactor.getDraw(request: Gacha.Draw.Request(time: 1))
  }
  
  @IBAction func clickDrawTenTime(_ sender: Any) {
    interactor.getDraw(request: Gacha.Draw.Request(time: 10))
  }
  @IBAction func clickGetHistory(_ sender: Any) {
    interactor.getHistory(request: Gacha.GetHistory.Request())
  }
}
