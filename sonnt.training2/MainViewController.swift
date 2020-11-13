//
//  MainViewController.swift
//  sonnt.training2
//
//  Created by Nero on 11/13/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var expandSwitch: UISwitch!
    @IBOutlet weak var listPersonTableView: UITableView!
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    var isOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listPersonTableView.register(UINib(nibName: "NotExpandTableViewCell", bundle: nil), forCellReuseIdentifier: "NotExpandTableViewCell")
        listPersonTableView.register(UINib(nibName: "ExpandTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandTableViewCell")
        
        setupBindingsDangChoVay()
        viewModel.getDangChoVayData()
    }
    
    //MARK: Action
    @IBAction func segmentAction(_ sender: Any) {
        if self.segment.selectedSegmentIndex == 0 {
            setupBindingsDangChoVay()
            viewModel.getDangChoVayData()
        } else {
            setupBindingsDangVay()
            viewModel.getDangVayData()
        }
    }
    
    @IBAction func expandAction(_ sender: Any) {
        self.isOpened = !isOpened
        self.listPersonTableView.reloadData()
    }
    
    func setupBindingsDangChoVay(){
        viewModel.listObjectDangChoVay.subscribe({ [weak self] _ in
            DispatchQueue.main.async {
                self?.listPersonTableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    func setupBindingsDangVay(){
        
        viewModel.listObjectDangVay.subscribe({ [weak self] _ in
            DispatchQueue.main.async {
                self?.listPersonTableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if segment.selectedSegmentIndex == 0 {
            return viewModel.listObjectDangChoVay.value.count
        } else {
            return viewModel.listObjectDangVay.value.count
        }
    }

    //MARK:TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isOpened {
            return 2
        } else {
            return 1
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segment.selectedSegmentIndex == 0{
            if indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "NotExpandTableViewCell") as! NotExpandTableViewCell
                    cell.nameLabel?.text = viewModel.listObjectDangChoVay.value[indexPath.section].name
                    cell.moneyLabel?.text = viewModel.listDangChoVay.value[indexPath.section].money
                    cell.backgroundColor = .green
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandTableViewCell") as! ExpandTableViewCell
                cell.desLabel?.text = viewModel.listObjectDangChoVay.value[indexPath.section].reason
                cell.moneyLabel?.text = viewModel.listObjectDangChoVay.value[indexPath.section].money
                cell.dateLabel?.text = viewModel.listObjectDangChoVay.value[indexPath.section].date
                cell.backgroundColor = .white
                return cell
                }
        } else {
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotExpandTableViewCell") as! NotExpandTableViewCell
                cell.nameLabel?.text = viewModel.listObjectDangVay.value[indexPath.section].name
                cell.moneyLabel?.text = viewModel.listObjectDangVay.value[indexPath.section].money
                cell.backgroundColor = .green
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandTableViewCell") as! ExpandTableViewCell
                cell.desLabel?.text = viewModel.listObjectDangVay.value[indexPath.section].reason
                cell.moneyLabel?.text = viewModel.listObjectDangVay.value[indexPath.section].money
                cell.dateLabel?.text = viewModel.listObjectDangVay.value[indexPath.section].date
                cell.backgroundColor = .white
                return cell
            }
        }
    }
}
