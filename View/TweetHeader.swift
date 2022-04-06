//
//  TweetHeader.swift
//  TwitterClone
//
//  Created by Yaz Burrell on 4/5/22.
//

import Foundation
import UIKit

class TweetHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
}
