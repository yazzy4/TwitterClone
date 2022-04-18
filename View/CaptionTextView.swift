//
//  CaptionTextView.swift
//  TwitterClone
//
//  Created by Yaz Burrell on 2/11/22.
//

import UIKit

class CaptionTextView: UITextView {
    
    // MARK: - Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"
        return label
    }()
    
    // MARK: - Lifecyle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: safeAreaLayoutGuide.topAnchor,
                                left: leftAnchor,
                                paddingTop: 8,
                                paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleTextInputChange() {
        print("DEBUG: Hide and show placeholder text")
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    // MARK: - API
    
    // MARK: - Helpers
}
