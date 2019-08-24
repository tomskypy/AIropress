//
//  ViewRecipeVM.swift
//  AIropress
//
//  Created by Tomas Skypala on 23/08/2019.
//  Copyright © 2019 Tomas Skypala. All rights reserved.
//

import Foundation
import UIKit

class ViewRecipeVM {
    
    weak var flowController: ViewRecipeSceneFC?
    
    private(set) var cellVMs: [BaseTableCellVM]
    
    let brewRecipeConstants: [RecipeConstant]
    
    init(brewRecipe: BrewRecipe) {
        self.brewRecipeConstants = brewRecipe.constants
        self.cellVMs = []
        
        setupCellVMs(brewRecipe: brewRecipe)
    }
    
    func configure(tableView: UITableView) {
        tableView.register(RecipeConstantCell.self, forCellReuseIdentifier: ConstantCellVM.cellIdentifier)
        tableView.register(RecipeSemiConstantCell.self, forCellReuseIdentifier: SemiConstantCellVM.cellIdentifier)
    }
    
    @objc
    func onResetClicked() {
        flowController?.onRecipeReset()
    }
    
    @objc
    func onPrepareClicked() {
        var recipeValues = brewRecipeConstants.reduce(into: [Int: Double]()) { $0[$1.id] = $1.value }
        
        //        for vm in cellVMs where let semiConstantCellVM = vm as? SemiConstantCellVM {
        for vm in cellVMs {
            guard let semiConstantCellVM = vm as? SemiConstantCellVM else { continue }
            
            recipeValues[semiConstantCellVM.recipeConstant.id] = semiConstantCellVM.recipeConstant.value
            recipeValues[semiConstantCellVM.confidenceVariable.id] = semiConstantCellVM.confidenceValue
        }
        
        flowController?.onPrepared(recipeValues: recipeValues)
    }
    
    private func setupCellVMs(brewRecipe: BrewRecipe) {
        cellVMs.append(contentsOf: brewRecipe.constants.map { ConstantCellVM(constant: $0) })
        cellVMs.append(contentsOf: brewRecipe.semiConstants.map { SemiConstantCellVM(semiConstant: $0) })
    }
    
}

extension ViewRecipeVM: BaseTableVM {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(section: Int) -> Int {
        guard section == 0 else { fatalError("Unexpected section") }
        
        return cellVMs.count
    }
    
    func cellViewModel(for path: IndexPath) -> BaseTableCellVM {
        guard path.section == 0 else { fatalError("Unexpected section") }
        return cellVMs[path.row]
    }
    
    func cellHeight(for path: IndexPath) -> CGFloat {
        return cellViewModel(for: path).cellHeight
    }
    
}