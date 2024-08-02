//
//  BestCatsViewController.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

class BestCatsViewController: UIViewController {
    private let tableView = UITableView()
    private var suggestions: [Cat]

    init(suggestions: [Cat]) {
        self.suggestions = suggestions
        super.init(nibName: nil, bundle: nil)
        Logger.shared.log("BestCatsViewController initialized with \(suggestions.count) suggestions", level: .info)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor =  UIColor(red: 244/255, green: 232/255, blue: 238/255, alpha: 1)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
          return false
      }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BestCatsTableViewCell.self, forCellReuseIdentifier: "BestCatsTableViewCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension BestCatsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestCatsTableViewCell", for: indexPath) as! BestCatsTableViewCell
        let cat = suggestions[indexPath.row]
        cell.configure(with: cat)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cat = suggestions[indexPath.row]
        let detailVC = DetailViewController(cat: cat)
        navigationController?.pushViewController(detailVC, animated: true)
        Logger.shared.log("Selected cat: \(cat.name ?? "Unknown"). Navigating to DetailViewController", level: .info)

    }
}
