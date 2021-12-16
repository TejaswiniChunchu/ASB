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
    @IBOutlet var viewModel: viewModel!
    
    var sectionHeaderHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        checkInternetConnection()
        sectionHeaderHeight = (ListTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell")?.contentView.bounds.height)!
    }
    
    func setUpTableView(){
        self.ListTableView.delegate = self
        self.ListTableView.dataSource = self
    }
    
    func checkInternetConnection(){
        if NetWorkMonitor.shared.isConnected{
            viewModel.fetchDataFromURL {
                DispatchQueue.main.async {
                    self.ListTableView.reloadData()
                }
            }
        }else{
            let controller = UIAlertController(title: "This page can't be loaded No internet connection", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            controller.addAction(ok)
            present(controller, animated: true, completion: nil)
        }
    }
}

extension ListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.headerListViewModel[section].transaction.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        cell.initialiseOutlet(_listViewModel: viewModel.headerListViewModel[indexPath.section].transaction[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.detailList = [viewModel.headerListViewModel[indexPath.section].transaction[indexPath.row]]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.headerListViewModel.count
        
    }
    
}

extension ListViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return viewModel.headerListViewModel[section].dateName ?? ""
    }
    
}
