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
        if(_listViewModel.debit != 0.0 && _listViewModel.credit == 0.0){
            self.spendMoneyLbl.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            self.spendMoneyLbl.text = String(_listViewModel.debit)
        }else{
            self.spendMoneyLbl.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            self.spendMoneyLbl.text = String(_listViewModel.credit)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
