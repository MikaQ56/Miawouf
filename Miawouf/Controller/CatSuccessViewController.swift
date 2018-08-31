//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by Mickael on 30/08/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {

    var cat: Pet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
    }
    
    @IBOutlet weak var miaouTextField: UILabel!
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func setTextLabel(){
        if let name = cat.name {
            miaouTextField.text = "Miaou de bienvenue à \(name) !"
        }
    }
}
