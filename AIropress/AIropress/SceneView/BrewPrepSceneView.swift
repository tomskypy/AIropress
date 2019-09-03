//
//  BrewPrepSceneView.swift
//  AIropress
//
//  Created by Tomas Skypala on 30/08/2019.
//  Copyright © 2019 Tomas Skypala. All rights reserved.
//

import Foundation
import UIKit
import TinyConstraints

class BrewPrepSceneView: LabeledSceneView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var whatToDoLabelContainer: UIView = {
        let container = UIView()
        
        let label = UILabel()
        label.text = "What to do:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        container.addSubview(label)
        label.centerYToSuperview()
        
        return container
    }()
    
    lazy var resetButton: UIButton = {
        return BaseSceneView.createButton(title: "Reset", color: AppOptions.color.buttonNegative)
    }()
    
    lazy var prepareButton: UIButton = {
        return BaseSceneView.createButton(title: "Prepare")
    }()
    
    override func getSceneLabelText() -> String {
        return "Get ready to brew"
    }
    
    override func addViews() {
        super.addViews()
        
        addSubview(tableView)
        addSubview(resetButton)
        addSubview(prepareButton)
    }
    
    override func setContraints() {
        super.setContraints()
        
        resetButton.width(150)
        prepareButton.width(150)
        
        contentContainer.stack([whatToDoLabelContainer, tableView], spacing: 5)
        
        resetButton.centerY(to: bottomButtonContainer)
        prepareButton.centerY(to: bottomButtonContainer)
        resetButton.left(to: bottomButtonContainer)
        prepareButton.right(to: bottomButtonContainer)
    }
}
