//
//  ViewController.swift
//  sonnt.training2
//
//  Created by Nero on 11/13/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterAction(_ sender: Any) {
        self.present(MainViewController(), animated: true, completion: nil)
    }
}

