//
//  HourlyTableViewCell.swift
//  Weather-For-Three-Days-RX
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

final class HourlyTableViewCell: UITableViewCell {
    @IBOutlet weak private var collectionView: UICollectionView!

    private var forecasts: [Forecast] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    static let identifier = "HourlyCell"
    static let height: CGFloat = 100

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(HourCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: HourCollectionViewCell.identifier)
    }

    func configure(forecasts: [Forecast]) {
        self.forecasts = forecasts
    }

}

// MARK: - Collection view data source

extension HourlyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HourCollectionViewCell.identifier, for: indexPath) as? HourCollectionViewCell else {
                return UICollectionViewCell()
        }

        cell.configure(forecasts[indexPath.row])
        return cell
    }

}

// MARK: - Collection view delegate flow layout

extension HourlyTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HourCollectionViewCell.width,
                      height: HourCollectionViewCell.width)
    }

}
