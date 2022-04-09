//
//  MainCell.swift
//  Clone_Everytime
//
//  Created by 장석우 on 2022/04/10.
//

import Foundation
import UIKit

final class MainCell:UITableViewCell{
   
    private let nickNameContainer : UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 6
        stackview.axis = .horizontal
        return stackview
    }()
    
    private let seperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(w: 237)
        return view
    }()
    
    
    private let userImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "detail_reply_profile")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let nickNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "익명"
        label.textColor = UIColor(w: 41)
        label.numberOfLines = 1
        return label
    }()
   
    private let timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "27분 전"
        label.textAlignment = .right
        label.textColor = UIColor(w: 166)
        label.numberOfLines = 1
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(w: 68)
        label.text = "전정대 기준 학점 4.2면 소프트로 전과 가능할라나?"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
   
    
    private let reactionView = ReactionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        
        self.contentView.addSubview(self.nickNameContainer)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.reactionView)
        self.contentView.addSubview(self.seperator
        )
        self.nickNameContainer.addArrangedSubview(userImageView)
        self.nickNameContainer.addArrangedSubview(nickNameLabel)
        self.nickNameContainer.addArrangedSubview(timeLabel)
        
        self.seperator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.nickNameContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.nickNameContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.nickNameContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.nickNameContainer.heightAnchor.constraint(equalToConstant: 24),
            
            self.userImageView.widthAnchor.constraint(equalToConstant: 24),
            self.userImageView.heightAnchor.constraint(equalToConstant: 24),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.nickNameContainer.bottomAnchor, constant: 4),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -24),
            
            self.reactionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4),
            self.reactionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            self.reactionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.reactionView.heightAnchor.constraint(equalToConstant: 16),
            
            
            self.seperator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -1),
            self.seperator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.seperator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.seperator.heightAnchor.constraint(equalToConstant: 1)
            
        ])
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: String){
        self.titleLabel.text = data
        
    }
}
