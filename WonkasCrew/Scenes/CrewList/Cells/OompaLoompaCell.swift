//
//  OompaLoompaCell.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import UIKit
import BSWInterfaceKit

final class OompaLoompaCell: UICollectionViewCell {
    
    private enum Constants {
        static let topMargin: CGFloat = 8
        static let bottomMargin: CGFloat = 8
        static let leadingMargin: CGFloat = 8
        static let trailingMargin: CGFloat = 8
        
        static let imgDim: CGFloat = 50
    }
    
    //MARK: UI Elements
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel = UILabel()
    let roleLabel = UILabel()
    
    let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public static func reuseIdentifier() -> String {
        return "OOMPALOOMPACELL"
    }
    
    
    private func setup() {
        [imageView, textStackView].forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
    
        //ImageView
        imageView.leadingAnchor
            .constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.leadingMargin
            ).isActive = true
        imageView.topAnchor
            .constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.topMargin
            ).isActive = true
        
        imageView.widthAnchor
            .constraint(equalToConstant: Constants.imgDim)
            .isActive = true
        imageView.heightAnchor
            .constraint(equalToConstant: Constants.imgDim)
            .isActive = true
        
        //Text StackView
        textStackView.leadingAnchor
            .constraint(
                equalTo: imageView.trailingAnchor,
                constant: Constants.leadingMargin)
            .isActive = true
        textStackView.topAnchor
            .constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.topMargin)
            .isActive = true
        textStackView.trailingAnchor
            .constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.trailingMargin)
            .isActive = true
        textStackView.bottomAnchor
            .constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.bottomMargin)
            .isActive = true
        
        
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(roleLabel)
        
        nameLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
    }
}

extension OompaLoompaCell: ViewModelReusable {
    
    public func configureFor(viewModel: OompaLoompa) {
        nameLabel.text = viewModel.name
        roleLabel.text = viewModel.role
        imageView.image = viewModel.thumbnail
    }
}
