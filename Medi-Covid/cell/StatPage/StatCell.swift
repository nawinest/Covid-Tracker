//
//  StatCell.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class StatCell: UICollectionViewCell {

    @IBOutlet weak var deathCaseLabel: UILabel!
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var contryLabel: UILabel!
    @IBOutlet weak var recoveredCaseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
