//
//  ResultsCollectionViewCell.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 23/04/2019.
//  Copyright © 2019 Martin Lukacs. All rights reserved.
//

import UIKit
import Cards

class ResultsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var displayedCard: CardHighlight!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.masksToBounds = true
        layer.backgroundColor = UIColor.clear.cgColor
        layer.cornerRadius = 20.0
    }
    
    func update(img: String) {
//    func update(isDay: Bool = true) {
        displayedCard.backgroundColor = Style.Color.MainBlue
        displayedCard.backgroundImage = UIImage(named: img)
        displayedCard.title = "Daily statistics"
        displayedCard.itemTitle = "Daytime"
        displayedCard.buttonText = "Learn More"
        displayedCard.itemSubtitle = "Your daytime micturitions"
        displayedCard.textColor = UIColor.white
        displayedCard.hasParallax = true
    }
    
    override func prepareForReuse() {
        <#code#>
    }
}
