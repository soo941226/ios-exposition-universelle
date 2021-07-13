//
//  ItemViewController.swift
//  Expo1900
//
//  Created by 홍정아 on 2021/07/09.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    private let item: Item
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        itemInit()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemInit()
    }
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func itemInit() {
        self.navigationItem.title = item.name
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
    
//    func setItem(item: Item) {
//        self.item = item
//    }
}
//
//extension ItemDetailViewController: ItemDetailDelegate {
//    func setItem(item: Item) {
//        self.item = item
//    }
//}
