//
//  HisoryViewController.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewProtocol {
    
    let tableView = UITableView()
    var presenter: HistoryPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        title = NSLocalizedString("history_view.title", comment: "History view title")
        presenter = HistoryPresenter()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.overrideUserInterfaceStyle = AppColors.styleColor
        tableView.backgroundColor = AppColors.backgroundColor
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let (date, order) = presenter.result(at: indexPath.row)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let dateStr = formatter.string(from: date)
        
        let orderStringMessage = NSLocalizedString("history_view.order_string", comment: "Order string message")
        let orderString = order.map { "\(orderStringMessage) \($0)" }.joined(separator: ", ")
        cell.textLabel?.text = "\(dateStr): \(orderString)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
