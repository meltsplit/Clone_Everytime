//
//  ReactionView.swift
//  Clone_Everytime
//
//  Created by 장석우 on 2022/04/10.
//

import Foundation
import UIKit

class ReactionView : UIStackView{
    
    
    private let likeBtn : UIButton = {
        let btn = UIButton()
        
        btn.setTitle("0", for: .normal)
        btn.setTitleColor(UIColor(r: 198, g: 41, b: 23), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        btn.setImage(UIImage(named: "main_like_icon"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        
        return btn
    }()
    
    private let commentBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        btn.setTitleColor(UIColor(r: 89, g: 177, b: 187), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        btn.setImage(UIImage(named: "main_comment_icon"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        
        return btn
    }()
    
    override init(frame : CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 6
        self.axis = .horizontal
        self.addArrangedSubview(likeBtn)
        self.addArrangedSubview(commentBtn)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
