//
//  ViewController.swift
//  StringCalculator
//
//  Created by Akshay Sonawane on 27/06/25.
//

import UIKit

class ViewController: UIViewController {

// Mark:- IBOutlets
    @IBOutlet weak var txtInput: UITextField?
    @IBOutlet weak var viwError: UIView?
    @IBOutlet weak var lblErrorMsg: UILabel?
    @IBOutlet weak var btnCalculate: UIButton?
    @IBOutlet weak var lblResult: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Mark:- IBAction
    @IBAction func btnCalculateTapped(_ sender: Any) {
        viwError?.isHidden.toggle()
    }
}

