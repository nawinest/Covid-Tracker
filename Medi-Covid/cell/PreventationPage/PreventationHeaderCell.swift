//
//  PreventationHeaderCell.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class PreventationHeaderCell: UITableViewCell {
    @IBOutlet weak var mainBannerView: UIView!
    @IBOutlet weak var subFirstView: UIView!
    @IBOutlet weak var subSecondView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        mainBannerView.dropShadow()
        subFirstView.dropShadow()
        subSecondView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIView {
    func dropShadow() {
//        let radius: CGFloat = 5
        let radius: CGFloat = 5
        let shadowRadius: CGFloat = self.frame.width
        let shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                   y: 0, width: 0.3 * shadowRadius,
                                                   height: self.frame.height))
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowPath = shadowPath.cgPath
    }
}
