//
//  ListViewController.swift
//  ASB
//
//  Created by Tejaswini on 10/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var ListTableView: UITableView!
    var listViewModel = [ListViewModel]()
   
    
    override func viewDidLoad() {
         super.viewDidLoad()
        setUpTableView()
       
    }
    func setUpTableView(){
        self.ListTableView.delegate = self
        self.ListTableView.dataSource = self
        let  url = "https://60220907ae8f8700177dee68.mockapi.io/api/v1/transactions"
        fetchDataFromURL(seturl: url)
    }
    
    func fetchDataFromURL(seturl: String){
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
                for dic in jsonArray{
                   self.listViewModel.append(ListViewModel(dic))
                }
                
                DispatchQueue.main.async {
                    self.ListTableView.reloadData()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}

extension ListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        cell.initialiseOutlet(_listViewModel: self.listViewModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.listViewModel[indexPath.row])
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //        vc.PostId = selectedrow.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
