//
//  ViewController.swift
//  ColorPicker
//
//  Created by Aparna Natarajan on 12/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var hexCodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateColor()
        hexCodeTextField.isUserInteractionEnabled = false
    }
    @IBAction func reset(_ sender: UIButton) {
        redSwitch.isOn = true
        greenSwitch.isOn = true
        blueSwitch.isOn = true
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        updateColor()
        updateControls()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }

        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        hexCodeTextField.text = String(format: "#%02X%02X%02X", r, g, b)
        
    }
}

