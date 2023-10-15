//
//  CitiesTableViewController.swift
//  Fin Lock technology
//
//  Created by Sneh on 15/10/23.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global(qos: .background).async {
            self.longProcess()
        }
    }
    
    func longProcess() {
        for i in 0...100000000{
            print(i)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
}
