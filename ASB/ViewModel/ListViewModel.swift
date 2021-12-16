//
//  ListViewModel.swift
//  ASB
//
//  Created by Tejaswini on 15/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import Foundation
struct HeaderListViewModel {
    let dateName: String?
    var transaction: [ListViewModel]
//    init(_ dictionary: [String: Any]) {
//        self.dateName = dictionary["dateName"] as? String ?? ""
//        self.articles = dictionary["articles"]as! [String: Any]
//    }
}

struct ListViewModel {
    
    var id: String
    var debit: Double
    var credit: Double
    var summary: String
    var transactionDate: String
    
    
    init(_ dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.debit = dictionary["debit"] as? Double ?? 0.0
        self.credit = dictionary["credit"] as? Double ?? 0.0
        self.summary = dictionary["summary"] as? String ?? ""
        self.transactionDate = dictionary["transactionDate"] as? String ?? ""
    }
}
