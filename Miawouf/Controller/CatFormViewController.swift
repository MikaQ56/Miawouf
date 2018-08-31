//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Mickael on 30/08/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import UIKit

// MARK: - Outlets & données
class CatFormViewController: UIViewController {
    
    var cat: Pet!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
}

// MARK: - Actions
extension CatFormViewController {
    
    @IBAction func validate() {
        createPetObject()
        checkPetStatus()
    }
}

// MARK: - Segue
extension CatFormViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToCatSuccess" {
            let successVC = segue.destination as! CatSuccessViewController
            successVC.cat = cat
        }
    }
}

// MARK: - Form
extension CatFormViewController {
    
    private func createPetObject(){
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = majoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = catRaces[raceIndex]
        cat = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
    
    private func checkPetStatus(){
        switch cat.status {
        case .accepted:
            performSegue(withIdentifier: "segueToCatSuccess", sender: self)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
}

// MARK: - Alerts
extension CatFormViewController {
    
    private func presentAlert(with error: String) {
        let alertVC = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

// MARK: - Picker view
extension CatFormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
}

// MARK: - Keyboard
extension CatFormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

