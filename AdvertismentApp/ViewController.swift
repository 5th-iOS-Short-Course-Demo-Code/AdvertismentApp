//
//  ViewController.swift
//  AdvertismentApp
//
//  Created by Chhaileng Peng on 7/15/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerScrollView: UIScrollView!
    
    var bannerAds =
    [
    Ads(name: "Coca Cola", description: "Coca Cola Cambodia", image: "1"),
    Ads(name: "Grab Discount", description: "Grab Coupon Code", image: "2"),
    Ads(name: "Wing", description: "Wing Cambodia", image: "3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.currentPage = 0
        pageControl.numberOfPages = bannerAds.count
        configScrollView()
    }
    
    func configScrollView() {
        bannerScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: bannerScrollView.frame.height)
        bannerScrollView.showsHorizontalScrollIndicator = false
        bannerScrollView.isPagingEnabled = true
        bannerScrollView.delegate = self
        
        for (index, ads) in bannerAds.enumerated() {
            if let banner = Bundle.main.loadNibNamed("Banner", owner: self, options: nil)?.first as? BannerView {
                banner.configureView(ads: ads)
                banner.frame = CGRect(x: CGFloat(index) * self.view.frame.width, y: 0, width: self.view.frame.width, height: bannerScrollView.frame.height)
                self.bannerScrollView.addSubview(banner)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / self.view.frame.width
        pageControl.currentPage = Int(page)
    }

}










