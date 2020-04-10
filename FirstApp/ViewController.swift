//
//  ViewController.swift
//  FirstApp
//
//  Created by 90306193 on 2/6/20.
//  Copyright © 2020 JohnnyHartle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StartValueLabel: UILabel!
    
    @IBOutlet weak var TextField: UITextField!
    
    var StartAmount = 100
    
    
    
    var cardsList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    
    //card object
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
          self.hideKeyboardWhenTappedAround()
        
    }
    
//    func textFieldShouldReturn(_ TextField: UITextField) -> Bool {
//        TextField.resignFirstResponder()
//        return true
//    }
    
    @IBAction func EnterStartAmount(_ sender: UIButton) {
        //if TextField.text == nil{
        //    StartAmount = 100
        //}else{
        //StartAmount = Int(TextField.text!)!
        //}
        StartAmount = 100
        StartValueLabel.text = "Your Starting Amount: \(StartAmount)"
    }
    
    
    @IBAction func ResetStartAmount(_ sender: UIButton) {
        StartAmount = 100
        StartValueLabel.text = "Your Starting Amount: \(StartAmount)"
    }
    
    
    @IBAction func DealMeInButton(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var SecondController = segue.destination as! SecondViewController
        SecondController.usertotal = StartAmount
        
    }
    
   
    
}




extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
      
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
