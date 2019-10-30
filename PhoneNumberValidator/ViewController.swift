//
//  ViewController.swift
//  PhoneNumberValidator
//
//  Created by Raja on 30/10/19.
//  Copyright © 2019 Adaptavant. All rights reserved.
//

import UIKit
import PhoneNumberKit

class PhoneNumberFormatter {
    
    static var phoneNumber = PhoneNumberKit()
    
    static func getFormattedNumber(fromNumber number: String) throws -> String {
        let phoneNumberObj = try phoneNumber.parse(number)
        return phoneNumber.format(phoneNumberObj, toType: .e164)
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var formattedNumberTextField: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func formatButtonAction(_ sender: Any) {
        
        guard let text = phoneNumberTextField.text else {
            formattedNumberTextField.text = "Invalid text in the phone number text field"
            return
        }
        
        guard let phoneNumber = try? PhoneNumberFormatter.getFormattedNumber(fromNumber: text) else {
            formattedNumberTextField.text = "Invalid Phone number format"
            return
        }
        
        formattedNumberTextField.text = phoneNumber
    }
    
}

