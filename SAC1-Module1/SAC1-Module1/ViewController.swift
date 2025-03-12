//
//  ViewController.swift
//  SAC1-Module1
//
//  Created by sac19 on 21/2/2025.
//

import UIKit

class ViewController: UIViewController {
    
    // Inputs
    @IBOutlet weak var txtCost: UITextField!
    @IBOutlet weak var segTip: UISegmentedControl!
    @IBOutlet weak var segPeople: UISegmentedControl!
    
    // Outputs
    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    // Buttons
    
    /* Function: Calulate the amount each person pays */
    @IBAction func btnCalculate(_ sender: Any) {
        if txtCost.text != "" { // Existence Check
            if Float(txtCost.text!) != nil { // Type Check
                if Float(txtCost.text!)! > 0 && Float(txtCost.text!)! < 200 { // Range Check
                    let totalBill:Float = Float(txtCost.text ?? "0")!
                    var percentTip:Float = 0
                    var numPeople:Int = 0
                    
                    switch segPeople.selectedSegmentIndex {
                    case 1: // Three people
                        numPeople = 3
                    case 2: // Four people
                        numPeople = 4
                    case 3: // Five people
                        numPeople = 5
                    default: // Two people
                        numPeople = 2
                    }
                    
                    switch segTip.selectedSegmentIndex {
                    case 1: // 5% Tip
                        percentTip = 0.05
                    case 2: // 10% Tip
                        percentTip = 0.10
                    default: // No Tip
                        percentTip = 0.00
                    }
                    
                    let splitBillCost = (totalBill + (totalBill * percentTip)) / Float(numPeople)
                    
                    lblOutput.text = "The amount each person will pay is \(String(format: "$%.02f", splitBillCost))"
                    lblMessage.text = "Tickets successfully purchased"
                } else { // Message displayed if range check fails
                    lblMessage.text = "Please enter a number between 0 and 200"
                }
            } else { // Message displayed if type check fails
                lblMessage.text = "Please enter a number"
            }
        } else { // Message displayed if existence check fails
            lblMessage.text = "Please ensure all fields are filled"
        }
    }
    
    /* Function: Clear all input and output fields, reset segments to default */
    @IBAction func btnClear(_ sender: Any) {
        txtCost.text = ""
        segTip.selectedSegmentIndex = 0
        segPeople.selectedSegmentIndex = 0
        lblOutput.text = ""
        lblMessage.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
