//
//  ViewController.swift
//  StringCalculator
//
//  Created by Akshay Sonawane on 27/06/25.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark:- IBOutlets
    @IBOutlet weak var viwError: UIView?
    @IBOutlet weak var lblErrorMsg: UILabel?
    @IBOutlet weak var btnCalculate: UIButton?
    @IBOutlet weak var lblResult: UILabel?
    
    @IBOutlet weak var txtviwInput: UITextView?
    //    MARK:- Variable Declaration
    private let viewModel = StringCalculatorViewModel()
    private let placeholder = "Enter input string"
    //    MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtSetUp()
        //        Update the Result value
        viewModel.onResult = { [weak self] result in
            self?.lblResult?.text = "\(result)"
            self?.lblResult?.isHidden = result.isEmpty
        }
        //        Update the Error value
        viewModel.onError = { [weak self] error in
            self?.lblErrorMsg?.text = error
            self?.lblErrorMsg?.isHidden = error.isEmpty
        }
    }
    
    // Mark:- IBAction
    @IBAction func btnCalculateTapped(_ sender: Any) {
        let input = txtviwInput?.text ?? ""
        viewModel.calculate(input)
        self.txtviwInput?.resignFirstResponder()
    }
}

//MARK:- Extention
extension ViewController: UITextViewDelegate {
    
    //    TextView initial setup
    func txtSetUp () {
        self.txtviwInput?.delegate = self
        self.txtviwInput?.text = placeholder
        self.txtviwInput?.textColor = .lightGray
    }
    
    //    Add PlaceHolder to the textView
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtviwInput?.text == placeholder {
            txtviwInput?.text = ""
            txtviwInput?.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if ((txtviwInput?.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) != nil) {
            txtviwInput?.text = placeholder
            txtviwInput?.textColor = .lightGray
            
        }
    }
}
