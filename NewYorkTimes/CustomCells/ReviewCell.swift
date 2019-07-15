//
//  ReviewCell.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit

class ReviewCell: UICollectionViewCell {
    
    
    var result: Results? {
        didSet {
            guard let result = result else { return }
            displayTitleLabel.text = result.display_title
            summaryLabel.text = result.summary_short
            bookImageView.image = #imageLiteral(resourceName: "The-Godfather-2-240x300")
            guard let imageUrl = result.multimedia?.src else {return}
            NetworkManager.getImage(urlString: imageUrl, completion: { (image, error) in
                guard let image = image else {return}
                self.bookImageView.image = image
                self.bookImageView.hero.id = .url
            })
            
        }
    }
    
    var bookImageView: UIImageView = {
        let imageView = UIElementsManager.createImageView(image: UIImage(), contentMode: .scaleAspectFill)
        imageView.tintColor = .gray
        imageView.image = #imageLiteral(resourceName: "The-Godfather-2-240x300")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let displayTitleLabel: UILabel = {
        let label = UIElementsManager.createLabel(text: "", font: .boldSystemFont(ofSize: 30), textColor: .white, adjustsFontSizeToFitWidth: true, numberOfLines: 0)
        label.textAlignment = .left
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UIElementsManager.createLabel(text: "", font: .boldSystemFont(ofSize: 17), textColor: .white, adjustsFontSizeToFitWidth: false, numberOfLines: 3)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        hero.isEnabled = true
        backgroundColor = .white
        layer.cornerRadius = 6
        addSubviews(bookImageView)
        bookImageView.addSubviews(displayTitleLabel,summaryLabel)
        setupConstraints()
      
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            //Image
            bookImageView.topAnchor.constraint(equalTo: topAnchor),
            bookImageView.leftAnchor.constraint(equalTo: leftAnchor),
            bookImageView.rightAnchor.constraint(equalTo:rightAnchor),
            bookImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //displayTitle
            displayTitleLabel.topAnchor.constraint(equalTo: bookImageView.topAnchor, constant: 16),
            displayTitleLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant: 8),
             displayTitleLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: -8),
            
            //Summarylabel
            summaryLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant: 8),
            summaryLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 8),
            summaryLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor,constant: -16),
            summaryLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
       
    }
    
}

