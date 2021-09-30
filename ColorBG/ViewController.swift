//
//  ViewController.swift
//  ColorBG
//
//  Created by Kaznacheev on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redIntLebel: UILabel!
    @IBOutlet weak var greenIntLebel: UILabel!
    @IBOutlet weak var blueIntLebel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorBG: UIView!
    
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorBG.layer.cornerRadius = 15
        colorBG.layer.borderColor = UIColor.green.cgColor
        colorBG.layer.borderWidth = 1
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setLebel(redIntLebel, greenIntLebel, blueIntLebel)
    }

    @IBAction func activSliders(_ sender: UISlider) {
        setColor()
        
        switch sender {
            case redSlider: setLebel(redIntLebel)
            case greenSlider: setLebel(greenIntLebel)
            default: setLebel(blueIntLebel)
        }
    }
    
    // Цвет View
    private func setColor() {
        colorBG.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha:1
        )
    }
    
    // Значения слайдера при изменении
    private func setLebel(_ lebel: UILabel...) {
        lebel.forEach{ lebel in
             switch lebel {
        case redIntLebel:
            lebel.text = stringFormat(redSlider)
             case greenIntLebel:
                 lebel.text = stringFormat(greenSlider)
             default:
                 lebel.text = stringFormat(blueSlider)
             }
        }
    }
    
    // Значения Цвета
    private func stringFormat(_ slider: UISlider ) -> String {
        String(format: "%.1f", slider.value)
    }
}

