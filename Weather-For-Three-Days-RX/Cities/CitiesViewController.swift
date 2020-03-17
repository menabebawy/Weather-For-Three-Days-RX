//
//  CitiesViewController.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

final class CitiesViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!

    private var cities: [City] = []
    private var viewModel = CitiesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestCities()
    }

}

// MARK: - Table view data source

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
