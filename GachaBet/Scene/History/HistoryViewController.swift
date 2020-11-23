//
//  HistoryViewController.swift
//  GachaBet
//
//  Created by Supanat Wanroj on 23/11/2563 BE.
//  Copyright © 2563 SUPANAT WANROJ. All rights reserved.
//

import UIKit

protocol HistoryViewControllerInterface: class {
    func displayHistory(viewModel: History.ShowHistoryTable.ViewModel)
}

class HistoryViewController: UIViewController, HistoryViewControllerInterface {
    var interactor: HistoryInteractorInterface!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      configure(viewController: self)
    }
    
    // MARK: - Configuration
    
    func configure(viewController: HistoryViewController) {
      let presenter = HistoryPresenter()
      presenter.viewController = viewController

      let interactor = HistoryInteractor()
      interactor.presenter = presenter

      viewController.interactor = interactor
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    func displayHistory(viewModel: History.ShowHistoryTable.ViewModel) {
        <#code#>
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "test")
        return cell
    }
}
