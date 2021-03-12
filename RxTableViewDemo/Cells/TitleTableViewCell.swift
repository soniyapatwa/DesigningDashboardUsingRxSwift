//
//  TitleTableViewCell.swift
//  RxTableViewDemo


import UIKit
import RxSwift
import RxCocoa

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let bag = DisposeBag()
    var productViewModel: ProductViewModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        myCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func bindCollection() {
        Observable.just(productViewModel?.arrayItems ?? []).bind(to: myCollectionView.rx.items(cellIdentifier: "MyCollectionCell", cellType: MyCollectionCell.self)) { (row,item,cell) in
            cell.myTitleLabel.text = item
        }.disposed(by: bag)
    }
    
}

extension TitleTableViewCell: UICollectionViewDelegate {

}
