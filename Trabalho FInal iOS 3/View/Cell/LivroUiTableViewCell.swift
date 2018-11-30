//
//  LivroUiTableViewCell.swift
//  Trabalho FInal iOS 3
//
//  Created by Igor Vilar on 30/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import UIKit

class LivroUiTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomeLivro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
