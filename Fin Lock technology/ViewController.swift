//
//  ViewController.swift
//  Fin Lock technology
//
//  Created by Sneh on 15/10/23.
//

import UIKit

class ViewController: UIViewController {

    let textField = UITextField()
    var countries: [Datum] = []
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        NetworkManager().fetchCountries { dataModel in
            if let dataModel{
                self.countries = dataModel.data
                
            }
        }
        
        
        addTextField()
        addPickerView()
        }

    
    
    
    
    
    
    func addTextField () {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40)
            ])
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.placeholder = "Select City"
    }
    
    func addPickerView() {
      
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.inputView = pickerView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        let item = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        let flexibleItem = UIBarButtonItem(systemItem: .flexibleSpace)
        toolBar.items = [flexibleItem, item]
        textField.inputAccessoryView = toolBar
    }
    
   @objc func doneButtonPressed () {
      let selectedRow =  pickerView.selectedRow(inComponent: 0)
       let selectedCountry = countries[selectedRow]
       nextScreen(cit: selectedCountry.cities)
    }
    
    func nextScreen(cit: [String]){
        let vc = CitiesTableViewController()
        vc.cities = cit
        navigationController?.pushViewController(vc, animated: true)
        
    }    
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        countries[row].country
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = countries[row].country
    }
    
}
