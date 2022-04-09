//
//  NavigationTitleView.swift
//  Clone_Everytime
//
//  Created by 장석우 on 2022/04/10.
//

import Foundation
import UIKit

class NavigationTitleView: UIStackView{
    
    
    private let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "자유게시판"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(w: 41)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let universtyTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "광운대"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(w: 115)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 1
        
        self.addArrangedSubview(universtyTitleLabel)
        self.addArrangedSubview(categoryLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
