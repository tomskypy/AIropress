//
//  BaseViewController.swift
//  AIropress
//
//  Created by Tomas Skypala on 19/08/2019.
//  Copyright © 2019 Tomas Skypala. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<SV: BaseSceneView>: UIViewController {
    
    var sceneView: SV {
        return view as! SV
    }
    
    override func loadView() {
        view = SV()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.render()
    }
}