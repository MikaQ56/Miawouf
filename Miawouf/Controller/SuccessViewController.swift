//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by Mickael on 29/08/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    var dog: Pet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
    }
    
    @IBOutlet weak var woufTextField: UILabel!
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func setTextLabel(){
        if let name = dog.name {
            woufTextField.text = "Wouf de bienvenue à \(name) !"
        }
    }
}
