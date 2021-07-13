//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/07/07.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet private weak var itemListTableView: UITableView!
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initItems()
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "itemCell",
                for: indexPath
        ) as? ItemTableViewCell
        else {
            return UITableViewCell()
        }
        cell.transfer(data: items[indexPath.row])
        return cell
    }
}

extension ItemListViewController: JSONDecodable {
    typealias JSONModel = [Item]
    
    private func initItems() {
        do {
            items = try decodeJSON(fileName: .itemsFileName)
        } catch {
            self.navigationItem.title = .pageError
        }
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /// 그냥 push 하는 일반적인 경우
//        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? ItemDetailViewController else {
//            return
//        }
//        detailVC.setItem(item: items[indexPath.row])
//        navigationController?.pushViewController(detailVC, animated: true)
        
        
        /// 생성자로 넘겨주는 부분
        let detailVC = ItemDetailViewController(item: items[indexPath.row])

        navigationController?.pushViewController(detailVC, animated: true)
    }
}
