//
//  ViewController.swift
//  FocusCounter
//
//  Created by ST8 on 4.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var second = 0
    var timer = Timer()

    @IBOutlet weak var actionViewOutlet: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBAction func stepperAction(_ sender: UIStepper) {
        countdownLabel.text! = String(Int(sender.value))
        print(sender.value)
        progressBar.progress = 0.0
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ekrana dokundun")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Elini Çektin")
    }
    
    @objc func timerFunc(){
        print("çalışıyor")
        if second <= 0 {
            timer.invalidate()

        }
        else
        {
             second -= 1
        }
        print(second)
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

