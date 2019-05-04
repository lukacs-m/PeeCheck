//
//  MainConclusionCollectionViewCell.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 10/03/2019.
//  Copyright © 2019 Martin Lukacs. All rights reserved.
//

import UIKit
import MaterialComponents

class MainConclusionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblHelpDescription: UILabel!
    @IBOutlet weak var lblConclusion: UILabel!
    private var inkTouchController: MDCInkTouchController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        shadowLayer?.elevation = .cardResting
        
        // 2
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        // 3
        
        clipsToBounds = false
        inkTouchController = MDCInkTouchController(view: self)
        inkTouchController?.addInkView()
    }
    
    func update(conclusions: MainResults.FetchUserData.ViewModel.DisplayedConclusion) {
        lblTitle.text = conclusions.title
        lblHelpDescription.text = conclusions.helper
        lblConclusion.text = conclusions.conclusion
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }

    private func setUp() {
        roundCorner()
//        setCellShadow()
    }
    
    override class var layerClass: AnyClass {
        return MDCShadowLayer.self
    }
    
    var shadowLayer: MDCShadowLayer? {
        return self.layer as? MDCShadowLayer
    }
    
    func roundCorner() {
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
    }
    
//    func setCellShadow() {
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 2, height: 2)
//        self.layer.shadowOpacity = 0.2
//        self.layer.shadowRadius = 1.0
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = 12
//        self.clipsToBounds = false
//    }
}
