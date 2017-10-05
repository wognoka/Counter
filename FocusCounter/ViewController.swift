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
    var prgNum : Float = 0
    var start : Int = 0
    var timeArray = [Int]()
    var time = 0

    @IBOutlet weak var actionViewOutlet: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBAction func stepperAction(_ sender: UIStepper) {
        countdownLabel.text! = String(Int(sender.value))
        print(sender.value)
       // progressBar.progress = 0.0
  
        timeArray.removeAll()
        second = Int(sender.value)
        prgNum = 1 / Float(second)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ekrana dokundun")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: true)
        actionViewOutlet.isHidden = true
        self.view.backgroundColor = UIColor.green
        progressBar.setProgress(1, animated: false)
        time = 0
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Elini Çektin")
        timer.invalidate()
        var sonuc = ""
        actionViewOutlet.isHidden = false
        
        if second != 0{
            
        timeArray.append(time)
        for i in timeArray
        {
            sonuc += "\(i) sn \n"
        }
        print(sonuc)
            
            
       }
        
        
    }
    
    @objc func timerFunc(){
        print("çalışıyor")
        

        if second <= 0 {
            timer.invalidate()
            
            return

        }

        else
        {
            
            second -= 1
            
            time += 1
            
            countdownLabel.text = String(second)
            
            progressBar.progress -= prgNum
            
        
            
            
            
        }
        print(second)
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 1
        //progressBar.setProgress(1, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

