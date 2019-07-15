//
//  ViewController.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import UIKit
import Hero


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private var cache: Cache<String, UIImage> = Cache()
    
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
        hero.isEnabled = true
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
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            displayAlert()
        default:
            return
        }
    }
    
    func displayAlert(){
        let alert = UIAlertController(title: "Book title", message: "Enter book title", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Search", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            guard let text = textField.text else {return}
            .searchValue = text
            ReviewViewModel.getReviews { (error) in
                self.reviewCollectionView.reloadData()
            }
            
            print(text)
        }
        alert.addTextField { (textField) in
            textField.placeholder = "E.g Trump, Obama"
        }
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell
        guard let result = cell?.result else { return }
        
        let vc = ReviewViewController()
        vc.result = result
        vc.bookImageView.image = cell?.bookImageView.image
        present(vc, animated: true, completion: nil)
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIElementSizes.segmentedControlWidth, height: 450)
    }
    
}

