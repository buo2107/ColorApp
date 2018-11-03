//
//  ViewController.swift
//  ColorApp
//
//  Created by User16 on 2018/11/3.
//  Copyright © 2018 User16. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var borderLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var randomSwitch: UISwitch!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        colorChange(red: (redSlider.value), green: (greenSlider.value), blue: (blueSlider.value), alpha: (alphaSlider.value))
        
        colorTextChange(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)

        alphaLabel.text = String(format: "%.1f", (alphaSlider.value))
    }

    @IBAction func borderChange(_ sender: UISlider) {
        borderLabel.text = String(format: "%.1f", (borderSlider.value))
        
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = CGFloat(borderSlider.value)
   }
    
    @IBAction func switchRandom(_ sender: UISwitch) {
        if !randomSwitch.isOn
        {
            randomButton.isEnabled = false
        }
        else
        {
            randomButton.isEnabled = true
        }
    }
    
    @IBAction func random(_ sender: Any) {
        let r = Float.random(in: 0...1)
        let g = Float.random(in: 0...1)
        let b = Float.random(in: 0...1)
        redSlider.value = r
        blueSlider.value = b
        greenSlider.value = g
        colorChange(red: r, green: g, blue: b, alpha: alphaSlider.value)
        colorTextChange(red: r, green: g, blue: b)
    }
    
    func colorChange(red: Float, green: Float, blue: Float, alpha: Float){
        imageView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    func colorTextChange(red: Float, green: Float, blue: Float){
        redLabel.text = String(format: "%.2f", (red))
        greenLabel.text = String(format: "%.2f", (green))
        blueLabel.text = String(format: "%.2f", (blue))
    }
}

