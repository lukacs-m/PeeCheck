//
//  ChartsTableViewCell.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 29/07/2018.
//  Copyright © 2018 Martin Lukacs. All rights reserved.
//

import UIKit

class ChartsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = Style.Color.White
        lblTitle.textColor = Style.Color.MainGreen
        self.selectionStyle = .none
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        if highlighted {
            backgroundColor = Style.Color.MainBlue
            lblTitle.textColor = Style.Color.White
        } else {
            backgroundColor = Style.Color.White
            lblTitle.textColor = Style.Color.MainGreen
        }
    }

    func updateUI(_ name: String) {
        lblTitle.text = name
    }
}
