//
//  FavoriteCell.swift
//  TableFavorite
//
//  Created by Werik on 7/12/16.
//  Copyright © 2016 Orbis Ventures. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var lblFavorite: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
