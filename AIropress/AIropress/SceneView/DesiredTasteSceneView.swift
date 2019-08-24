//
//  DesiredTasteSceneView.swift
//  AIropress
//
//  Created by Tomas Skypala on 19/08/2019.
//  Copyright © 2019 Tomas Skypala. All rights reserved.
//

import Foundation
import UIKit
import TinyConstraints

class DesiredTasteSceneView: BaseSceneView {
    
    lazy var safeAreaContainer: UIView = {
        return UIView()
    }()
    
    lazy var sceneLabelContainer: UIView = {
        let container = UIView()
        
        let label = UILabel()
        label.text = "Desired"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        
        container.addSubview(label)
        label.centerYToSuperview()
        
        return container
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var bottomButtonContainer: UIView = {
        return UIView()
    }()
    
    lazy var calculateButton: UIButton = {
        return BaseSceneView.createButton(title: "Calculate")
    }()
    
    override func addViews() {
        addSubview(safeAreaContainer)
        addSubview(sceneLabelContainer)
        addSubview(tableView)
        addSubview(bottomButtonContainer)
        addSubview(calculateButton)
    }
    
    override func setContraints() {
        safeAreaContainer.edgesToSuperview(insets: TinyEdgeInsets(horizontal: 15), usingSafeArea: true)
        
        sceneLabelContainer.height(120)
        bottomButtonContainer.height(65)
        
        calculateButton.width(150)
        
        safeAreaContainer.stack([sceneLabelContainer, tableView, bottomButtonContainer], axis: .vertical, spacing: 5)
        
        calculateButton.centerY(to: bottomButtonContainer)
        calculateButton.right(to: bottomButtonContainer)
    }
}