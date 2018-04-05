//
//  ViewController.swift
//  TextFieldValidation
//
//  Created by Maksim Artemov on 05/04/2018.
//  Copyright © 2018 Maksim Artemov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController: UITextFieldDelegate {
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validationAtSignCheckFrom(textField: textField, string: string)
    }
    
    func validationNumericDecimalCheckFrom(textField: UITextField, string: String) -> Bool {
        
        let period = textField.text?.filter{".".contains($0)}
        if period == "." && string == "." {
            return false
        }
        
        var set = CharacterSet.decimalDigits
        set.insert(charactersIn: ".")
        let words = string.components(separatedBy: set.inverted)
        if words.count > 1 {
            return false
        }
        
        return true
    }
    
    func validationAtSignCheckFrom(textField: UITextField, string: String) -> Bool {
        
        if textField.text?.count == 0 && string == "@" {
            return false
        }
        
        let period = textField.text?.filter{"@".contains($0)}
        if period == "@" && string == "@" {
            return false
        }
        
        return true
    }
    
}

