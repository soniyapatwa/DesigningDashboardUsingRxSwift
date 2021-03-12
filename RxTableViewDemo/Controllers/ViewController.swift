//
//  ViewController.swift
//  RxTableViewDemo


import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
        productViewModel.fetchProductList()
    }
    
    private func bindTableView() {
        //To use Publish Subject
//        productViewModel.items.bind(to: tableView.rx.items(cellIdentifier: "TitleTableViewCell", cellType: TitleTableViewCell.self)) { (row,item,cell) in
//            cell.titleLabel.text = item.name
//            cell.selectionStyle = .none
//        }.disposed(by: bag)
        //To use Relay
        /*
         productViewModel.places.bind(to: tableView.rx.items(cellIdentifier: "TitleTableViewCell", cellType: TitleTableViewCell.self)) { (row,item,cell) in
         cell.titleLabel.text = item
         cell.selectionStyle = .none
         }.disposed(by: bag)
         */
        //To use Swift Array
        
         Observable.just(productViewModel.arrayItems).bind(to: tableView.rx.items(cellIdentifier: "TitleTableViewCell", cellType: TitleTableViewCell.self)) { (row,item,cell) in
            //cell.titleLabel.text = item
            cell.selectionStyle = .none
            cell.productViewModel = self.productViewModel
            cell.bindCollection()
         }.disposed(by: bag)
         
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}



