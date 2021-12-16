//
//  DetailViewController.swift
//  ASB
//
//  Created by Tejaswini on 14/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var trasactionLbl: UILabel!
    @IBOutlet weak var crdDbtView: UIView!
    @IBOutlet weak var TransactionDateLbl: UILabel!
    @IBOutlet weak var amountLBL: UILabel!
    @IBOutlet weak var gstLbl: UILabel!
    var detailList = [ListViewModel]()
    var detailObj = DetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewUpdate()
    }
    func viewUpdate(){
        var  amount : Double
        var color: UIColor
        self.summaryLbl.text = detailList[0].summary
        self.TransactionDateLbl.text = self.detailObj.getdate(_detailList: detailList[0])
        if(detailList[0].debit != 0.0 && detailList[0].credit == 0.0){
            color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            amount = detailList[0].debit
        }else{
            color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            amount = detailList[0].credit
        }
        self.trasactionLbl.textColor = color
        self.trasactionLbl.text = String(amount)
        self.amountLBL.text = String(amount)
        self.gstLbl.text = String(format: "%0.2f", self.detailObj.gSTCalculation(_amount: amount))
        
    }
   
   
}

