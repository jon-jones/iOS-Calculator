//
//  ViewController.swift
//  Auto View Calculator
//
//  Created by Jonathon Jones on 5/16/19.
//  Copyright © 2019 Jonathon Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var  displayInt = true
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var operation = 0
    var characterCount = 0
    var display = ""
    

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        //sets uilabel number to a double called numberOnScreen
        label.text = label.text! + String(sender.tag)
        numberOnScreen = Double(label.text!)!
        
        //checks for 7 characters and changes font size of label to allow
        //more characters on the screen
        displayFont()
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        //clear button resets values
        if (sender).tag == 10 {
            label.text = ""
            numberOnScreen = 0
            characterCount = 0
            //resets font to original size after decimal
            label.font = label.font.withSize(75)
        //positive/negative button
        } else if (sender).tag == 11 {
            //checks for a negative and removes it and sets the number back to positive
            if (label.text?.contains("-"))! {
                label.text = label.text?.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
                numberOnScreen = -numberOnScreen
            } else { //else make the number negative
                label.text = "-" + label.text!
                numberOnScreen = -numberOnScreen
            }
        //percentage function
        } else if (sender).tag == 12{
            //if user presses this button first, it avoids a nil by
            //setting the screen to show 0
            if numberOnScreen == 0 {
                label.text = "0"
            }
            //ensures that nil cannot be used to run this function
            else if label.text != nil {
                numberOnScreen = numberOnScreen / 100
                label.text = String(numberOnScreen)
            }
        //division function gives value to previous number and resets screen value
        } else if (sender).tag == 13 {
            operation = 1
            previousNumber = numberOnScreen
            label.text = ""
        //multiplication function function gives value to previous number and resets screen value
        } else if (sender).tag == 14 {
            operation = 2
            previousNumber = numberOnScreen
            label.text = ""
        //subtraction function gives value to previous number and resets screen value
        } else if (sender).tag == 15 {
            operation = 3
            previousNumber = numberOnScreen
            label.text = ""
        //addition function gives value to previous number and resets screen value
        } else if (sender).tag == 16 {
            operation = 4
            previousNumber = numberOnScreen
            label.text = ""
        //equals function
        } else if (sender).tag == 17 {
            //displays integer values if no decimal is used to keep cleaner display
            if displayInt == true {
                if operation == 1 { //math of functions based upon operation number
                    label.text = String(Int(previousNumber/numberOnScreen))
                } else if operation == 2 {
                    label.text = String(Int(previousNumber*numberOnScreen))
                } else if operation == 3 {
                    label.text = String(Int(previousNumber-numberOnScreen))
                } else if operation == 4 {
                    label.text = String(Int(previousNumber+numberOnScreen))
                }
            } else { //uses double if decimal is used
                if operation == 1 { //math of functions based upon operation number
                    label.text = String(previousNumber/numberOnScreen)
                    displayFont()
                } else if operation == 2 {
                    label.text = String(previousNumber*numberOnScreen)
                    displayFont()
                } else if operation == 3 {
                    label.text = String(previousNumber-numberOnScreen)
                    displayFont()
                } else if operation == 4 {
                    label.text = String(previousNumber+numberOnScreen)
                    displayFont()
                }
            }
        //decimal point button
        //checks for no value to start off the number as 0.
        } else if (sender).tag == 18 {
            if label.text == "" {
                label.text = "0."
                displayInt = false
            //ensures only one decimal may be placed
            } else if (label.text?.contains("."))! {
                
            } else { //inserts decimal
                label.text = label.text! + "."
                displayInt = false
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    //checks for 7 characters and changes font size of label to allow
    //more characters on the screen
    func displayFont() {
        characterCount = label.text!.count
        if characterCount > 7 {
            label.font = label.font.withSize(30)
        }
    }
    
}


