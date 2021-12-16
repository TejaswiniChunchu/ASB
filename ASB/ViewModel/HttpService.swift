//
//  HttpService.swift
//  ASB
//
//  Created by Tejaswini on 17/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class HttpService: NSObject {
    var headerListViewModel = [HeaderListViewModel]()
    func fetchDataFromURL(completion: @escaping ([HeaderListViewModel]) -> () ){
         let  seturl = "https://60220907ae8f8700177dee68.mockapi.io/api/v1/transactions"
        guard let url = URL(string: seturl) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                var dateArray = [String]()
                var listViewModel = [ListViewModel]()
                for dic in jsonArray{
                    
                    listViewModel.append(ListViewModel(dic))
                    let date = ListViewModel(dic).transactionDate.components(separatedBy:"T")
                    if !dateArray.contains(date[0]){
                        dateArray.append(date[0])
                    }
                }
                dateArray.sort { (lhs: String, rhs: String) -> Bool in
                    return lhs > rhs
                }
                for value in dateArray{
                    var assigntolist = [ListViewModel]()
                    for data in listViewModel{
                        let date = data.transactionDate.components(separatedBy:"T")
                        if(value == date[0]){
                            assigntolist.append(data)
                        }
                    }
                    self.headerListViewModel.append(HeaderListViewModel (dateName: value, transaction: assigntolist))
                    assigntolist.removeAll()
                }
               completion(self.headerListViewModel)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
