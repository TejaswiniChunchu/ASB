//
//  viewModel.swift
//  ASB
//
//  Created by Tejaswini on 17/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class viewModel: NSObject {
    var httpService = HttpService()
    var headerListViewModel = [HeaderListViewModel]()
    func fetchDataFromURL(completion: @escaping() -> () ){
        httpService.fetchDataFromURL { headerListViewModel in
            
            self.headerListViewModel = headerListViewModel
            completion()
        }
    }
}
