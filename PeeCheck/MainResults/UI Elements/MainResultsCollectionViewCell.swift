//
//  MainResultsCollectionViewCell.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 06/11/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

class MainResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblNumMicturitionTitle: UILabel!
    @IBOutlet weak var lblAverageMicturition: UILabel!
    @IBOutlet weak var lblMaxMicturition: UILabel!
    @IBOutlet weak var lblMinMicturition: UILabel!
    
    @IBOutlet weak var lblTimeMicturitionTitle: UILabel!
    @IBOutlet weak var lblAverageTimeMicturition: UILabel!
    @IBOutlet weak var lblMaxTimeMicturition: UILabel!
    @IBOutlet weak var lblMinTimeMicturition: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func update(statistics: MainResults.FetchUserData.ViewModel.DisplayedInformation) {
        lblTitle.text = statistics.title
        lblNumMicturitionTitle.text = "Number of micturition statistics"
        lblAverageMicturition.text = statistics.averageNumberOfMicturition
        lblMaxMicturition.text = statistics.maxNumberOfMicturition
        lblMinMicturition.text = statistics.minNumberOfMicturition
        lblTimeMicturitionTitle.text = "Statics on micturitions time"
        lblAverageTimeMicturition.text = statistics.averageMicturitionTime
        lblMaxTimeMicturition.text = statistics.longestMicturition
        lblMinTimeMicturition.text = statistics.shortestMicturition
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
    
    private func setUp() {
     roundCorner()
     setCellShadow()
    }
    
    func roundCorner() {
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 12
        self.clipsToBounds = false
    }

}
