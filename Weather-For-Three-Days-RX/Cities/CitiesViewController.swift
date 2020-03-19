//
//  CitiesViewController.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CitiesViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!

    private var viewModel = CitiesViewModel()
    private let disposeBag = DisposeBag()
    private let dataSource = CitiesDataSource()

    private let selectedCityPublishSubject = PublishSubject<City>()
    var selectedCityObservable: Observable<City> {
        return selectedCityPublishSubject.asObserver()
    }

    override func loadView() {
        super.loadView()
        title = "Weather Rx App"
        viewModel.requestCities()

        viewModel.citiesObservable
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        dataSource.titleForHeaderInSection = { dataSource, index in
            dataSource.sectionModels[index].header
        }

        tableView.rx
            .modelSelected(City.self)
            .subscribe(onNext: { [weak self] city in
                self?.selectedCityPublishSubject.onNext(city) })
            .disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityTableViewCell.nib(), forCellReuseIdentifier: CityTableViewCell.identifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

}

// MARK: - Table view delegate

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CityTableViewCell.height
    }

}
