//
//  DetailModel.swift
//  ASB
//
//  Created by Tejaswini on 17/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class DetailModel: NSObject {

    func getdate(_detailList: ListViewModel) -> String{
        let date = _detailList.transactionDate.components(separatedBy:"T")
        return date[0]
    }
    func  gSTCalculation(_amount: Double) -> Double{
        let gSTAmount  = _amount*3/23
        return  gSTAmount
    }
}
