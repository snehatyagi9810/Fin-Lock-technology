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
    let longProcessLabel = UILabel()
    let longProcessIsRunningLabel = UILabel()
    let selectCityLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
        setupTextField()
        setupPickerView()
        setupView()
        setupConstraint()
        
        DispatchQueue.global(qos: .background).async {
            self.longProcess()
        }
    }
    func setupConstraint(){
        longProcessLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            longProcessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            longProcessLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150)
        ])
        
        longProcessIsRunningLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            longProcessIsRunningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            longProcessIsRunningLabel.bottomAnchor.constraint(equalTo: longProcessLabel.topAnchor,constant: -10)
        ])
        
        selectCityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectCityLabel.bottomAnchor.constraint(equalTo: textField.topAnchor,constant: -10)
        ])
        
        
    }
    func setupView(){
        longProcessLabel.text = "Long Process Label"
        view.addSubview(longProcessLabel)
        
        longProcessIsRunningLabel.text = "Long Process Is Running"
        view.addSubview(longProcessIsRunningLabel)
        
        selectCityLabel.text = "Select Your City"
        view.addSubview(selectCityLabel)
    }
    
    
    @objc func doneButtonPressed () {
       let selectedRow =  pickerView.selectedRow(inComponent: 0)
        let selectedCountry = countries[selectedRow]
        nextScreen(cit: selectedCountry.cities)
     }
    
    @objc func cancelButtonPressed () {
        view.endEditing(true)
        textField.text = ""
     }
    

    
    private func setupUI(){
        view.backgroundColor = .white
    }
    
    private func fetchData(){
        NetworkManager().fetchCountries { dataModel in
            if let dataModel{
                self.countries = dataModel.data
                
            }
        }
    }
    
    
    func longProcess() {
        for i in 0...100000000{
            if i % 1000 == 0{
                DispatchQueue.main.async {
                    self.longProcessLabel.text = String(i)
                }
            }
        }
        
    }
    
    
    func setupTextField(){
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
    
    func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.inputView = pickerView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        let item = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        let item2 = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonPressed))
        let flexibleItem = UIBarButtonItem(systemItem: .flexibleSpace)
        toolBar.items = [item2,flexibleItem, item]
        textField.inputAccessoryView = toolBar
        
    }
    
    
   
    
    func nextScreen(cit: [String]){
        let vc = CitiesViewController()
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
