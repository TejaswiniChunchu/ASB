//
//  ListTableViewCell.swift
//  ASB
//
//  Created by Tejaswini on 10/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var spendMoneyLbl: UILabel!
    
func initialiseOutlet(_listViewModel: ListViewModel) {
    self.textLbl.text = _listViewModel.summary
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
