//
//  ViewController.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        ReviewViewModel.getReviews { (error) in
            self.reviewCollectionView.reloadData()
        }
        
    }
    
    var reviewCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.register(ReviewCell.self, forCellWithReuseIdentifier: .reviewCollectionViewCellID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setupView(){
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        view.addSubviews(reviewCollectionView)
        NSLayoutConstraint.activate([
            reviewCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }

}

private typealias CollectionViewDataSource = ViewController
extension CollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return ReviewViewModel.result.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .reviewCollectionViewCellID, for: indexPath) as? ReviewCell else { return UICollectionViewCell() }
            let result = ReviewViewModel.result[indexPath.row]
            cell.result = result
            
            return cell
      
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIElementSizes.segmentedControlWidth, height: 450)
    }

}

