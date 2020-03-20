//
//  LoadingScreenViewController.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class LoadingScreenViewController: UIViewController {
    lazy var viewWrapper: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = UIColor.white
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.layer.cornerRadius = 8
        return uiview
    }()
    
    lazy var imageLoader: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "covid-doctor1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var waitLabel: UILabel = {
        let label = UILabel()
        label.text = "รอสักครู่นะค่ะ"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupView()
    }
    
    func setupView() {
        view.addSubview(viewWrapper)
        viewWrapper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewWrapper.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewWrapper.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewWrapper.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        viewWrapper.addSubview(imageLoader)
        imageLoader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageLoader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageLoader.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageLoader.heightAnchor.constraint(equalToConstant: 350).isActive = true
        imageLoader.contentMode = .scaleAspectFit
    }
    
    

}
