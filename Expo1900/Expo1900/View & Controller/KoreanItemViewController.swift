//
//  KoreanItemViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

final class KoreanItemViewController: UIViewController {
    private let koreanItemData: KoreanItem
    
    private let mainScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .white
        scrollview.bounces = true
        return scrollview
    }()
    
    private let stackViewOfMainScrollView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var itemImageView: ExpositionImageView = {
        let imageView = ExpositionImageView(imageName: koreanItemData.imageName)
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 500).isActive = true
        return imageView
    }()
    lazy var itemDescriptionLabel = ExpositionLabel(text: koreanItemData.description, textStyle: .body)
    lazy var contents = [itemImageView, itemDescriptionLabel]
    
    init(data: KoreanItem) {
        koreanItemData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleOfNavigationBar()
        setUpScrollView()
        setStackViewOfMainScrollView()
    }
    
    private func setTitleOfNavigationBar() {
        navigationItem.title = koreanItemData.name
    }
    
    private func setUpScrollView() {
        view.addSubview(mainScrollView)
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainScrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    private func setStackViewOfMainScrollView() {
        mainScrollView.addSubview(stackViewOfMainScrollView)
        NSLayoutConstraint.activate([
            stackViewOfMainScrollView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            stackViewOfMainScrollView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            stackViewOfMainScrollView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            stackViewOfMainScrollView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor)
        ])
        contents.forEach({ stackViewOfMainScrollView.addArrangedSubview($0) })
    }
}
