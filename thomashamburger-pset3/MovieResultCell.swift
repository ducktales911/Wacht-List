//
//  MovieResultCell.swift
//  thomashamburger-pset3
//
//  Created by Thomas Hamburger on 30-04-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class MovieResultCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
