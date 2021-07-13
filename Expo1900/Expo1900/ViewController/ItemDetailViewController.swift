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
//    private var subviewsAreLoaded = false
    private var item: Item?

    override func viewDidLoad() {
//        self.view.backgroundColor = .red
//        itemInit()
    }
 
//    init(item: Item) {
//        self.item = item
//        super.init(nibName: nil, bundle: nil)
//    }
//
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        dump(coder)
//        fatalError("init(coder:) has not been implemented")
    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if self.subviewsAreLoaded {
//            print(item)
//            itemInit()
//        }
//    }

    private func itemInit() {
        guard let item = item else {
            return
        }
        self.navigationItem.title = item.name
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
    
     func setItem(item: Item) {
        self.item = item
    }
}
