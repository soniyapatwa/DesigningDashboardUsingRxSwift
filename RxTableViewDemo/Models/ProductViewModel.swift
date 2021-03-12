//
//  ProductViewModel.swift
//  RxTableViewDemo

import Foundation
import RxSwift
import RxCocoa

struct Product {
    let name: String
}

class ProductViewModel {
    let items = PublishSubject<[Product]>()
    let places: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    let arrayItems = ["SwiftUI", "RxSwift", "Widgets"]
    
    func fetchProductList() {
        let productArray = [
            Product(name: "MacBook"),
            Product(name: "iPhone Xs"),
            Product(name: "iWatch"),
            Product(name: "iPad"),
            Product(name: "iPhone X")
        ]
        items.onNext(productArray)
        places.accept(["Mumbai", "Navi Mumbai", "Pune"])
    }
    
}
