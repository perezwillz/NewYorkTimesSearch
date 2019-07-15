//
//  ReviewViewController.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import UIKit
import Hero

class ReviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        setupView()
    }
    
    var result : Results?{
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let result = result else {return}
        summaryLabel.text = result.summary_short
        bookImageView.hero.id = .url
        
    }
    
    func setupView(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        view.addGestureRecognizer(pan)
        hero.isEnabled = true
        view.addSubviews(bookImageView,summaryLabel)
        constrainView()
    }
    
    var bookImageView: UIImageView = {
        let imageView = UIElementsManager.createImageView(image: UIImage(), contentMode: .scaleAspectFill)
        imageView.tintColor = .gray
        imageView.image = #imageLiteral(resourceName: "The-Godfather-2-240x300")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let summaryLabel: UITextView = {
        let textView = UIElementsManager.createTextView(text: "", font: .generalTextFont, textColor: .black, backgroundColor: .white, cornerRadius: 0)
        textView.textAlignment = .center
        return textView
    }()
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            hero.dismissViewController()
        case .changed:
            let translation = sender.translation(in: nil)
            let progress = translation.y / 2 / view.bounds.height
            Hero.shared.update(progress)
        default:
            Hero.shared.finish()
        }
        
    }
    
    func constrainView(){
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bookImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bookImageView.heightAnchor.constraint(equalToConstant: UIElementSizes.windowHeight-100),
            
            summaryLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 0),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
    }
    

    
}
