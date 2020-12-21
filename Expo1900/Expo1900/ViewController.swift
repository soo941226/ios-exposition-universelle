//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var visitLocationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var koreaItemsView: UIView!

    // MARK: - data property
    private var expositionData: Exposition? = nil
    
    private var visitLocationPrefix = "방문지 : "
    private var durationPrefix = "개최 기간 : "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try initExpositionData()
            try setUpUI()
            addKoreaItemsGesture()
        } catch {
            let alert = self.errorAlert(error: ExpositionError.getExpositionData, handler: nil)
            self.showErrorAlert(alert)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - init data
    private func initExpositionData() throws {
        let jsonDecoder = JSONDecoder()
        guard let expositionJsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            throw ExpositionError.getExpositionData
        }
        self.expositionData = try jsonDecoder.decode(Exposition.self, from: expositionJsonData.data)
    }
    
    private func setUpUI() throws {
        guard let data = expositionData else {
            throw ExpositionError.getExpositionData
        }
        titleLabel.text = data.title
        let commaVisitors = try getCommaNumber(data.visitors)
        visitorsLabel.text = getVisitorFormat(commaVisitors)
        visitLocationLabel.text = getExpositionFormat(prefix: visitLocationPrefix, content: data.location)
        durationLabel.text = getExpositionFormat(prefix: durationPrefix, content: data.duration)
        descriptionLabel.text = data.description
    }
    
    private func addKoreaItemsGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goKoreaItems(sender:)))
        koreaItemsView.addGestureRecognizer(gesture)
    }
    
    @objc func goKoreaItems(sender: UITapGestureRecognizer) {
        
    }
    
    // MARK: - get data match format
    private func getCommaNumber(_ number: UInt) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let commaNumber = numberFormatter.string(from: NSNumber(value: number)) else {
            throw ExpositionError.convertNumber
        }
        return commaNumber
    }
    
    private func getVisitorFormat(_ visitor: String) -> String {
        let visitorFormat = NSString(format: "%@%@%@", "방문객 : ", visitor, " 명")
        return String(visitorFormat)
    }
    
    private func getExpositionFormat(prefix: String, content: String) -> String {
        let contentFormat = NSString(format: "%@%@", prefix, content)
        return String(contentFormat)
    }
}

// MARK: - extensions
extension ViewController {
    func showErrorAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}

