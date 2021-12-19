//
//  AddAlarmController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/12.
//

import UIKit

class AddAlarmController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var alarmInfoTableView: UITableView!
    var alarmInfoTable: [String] = ["반복", "레이블", "사운드", "다시 알림"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelAddingAlarm(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveAlarmInfo(_ sender: Any) {
        
        // save data
        
        self.performSegue(withIdentifier: "toAlarmMain", sender: self)
    }
}

extension AddAlarmController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmInfoTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = alarmInfoTableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else { return UITableViewCell() }
        
        cell.infoTitleLabel.text = alarmInfoTable[indexPath.row]
        
        return cell
    }
    
    
}

class InfoCell: UITableViewCell {
    @IBOutlet weak var infoTitleLabel: UILabel!
    
}
