//
//  StopWatchViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/25.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonlayers()
    }
    
    func setButtonlayers(){
        cancelButton.clipsToBounds = true
        startButton.clipsToBounds = true
        cancelButton.layer.cornerRadius = 35
        startButton.layer.cornerRadius = 35
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
