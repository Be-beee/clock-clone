//
//  TimerViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/07.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonlayers()
    }
    
    func setButtonlayers(){
        cancelButton.clipsToBounds = true
        startButton.clipsToBounds = true
        cancelButton.layer.cornerRadius = 40
        startButton.layer.cornerRadius = 40
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        print("cancel timer")
    }
    
    @IBAction func startTimer(_ sender: Any) {
        print("start timer")
    }
}
