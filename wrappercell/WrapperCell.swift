//
//  WrapperCell.swift
//  Performance
//
//  Created by Muhammad Ghifari on 9/3/2023.
//

import Foundation
import SwiftUI

class WrapperCell<T : View>: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        separatorInset = .zero
        backgroundColor = .clear
    }
    
    var content: UIHostingController<T>? = nil
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindContent(content: T) {
        self.content = UIHostingController(rootView: content)
        if let content = self.content?.view {
            contentView.addSubview(content)
            self.content?.view.translatesAutoresizingMaskIntoConstraints = false
            self.content?.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            self.content?.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            self.content?.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            self.content?.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            self.content?.view.backgroundColor = .clear
        }
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
