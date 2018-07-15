//
//  BannerView.swift
//  AdvertismentApp
//
//  Created by Chhaileng Peng on 7/15/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class BannerView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configureView(ads: Ads) {
        nameLabel.text = ads.name
        descriptionLabel.text = ads.description
        imageView.image = UIImage(named: ads.image!)
    }

}
