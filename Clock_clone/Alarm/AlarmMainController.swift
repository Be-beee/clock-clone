//
//  AlarmViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/12.
//

import UIKit

class AlarmMainController: UIViewController {
    
    var alarmTable: [AlarmData] = []
    @IBOutlet weak var alarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addAlarm(_ sender: Any) {
        guard let addAlarmVC = UIStoryboard(name: "AddAlarmController", bundle: nil).instantiateViewController(withIdentifier: "AddAlarmNavController") as? UINavigationController else { return }
        self.present(addAlarmVC, animated: true, completion: nil)
    }
}

extension AlarmMainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = alarmTableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmCell else {
            return UITableViewCell()
        }
        
        cell.timeLabel.text = ""
        cell.alarmInfoLabel.text = alarmTable[indexPath.row].labelInfo + ", " + alarmTable[indexPath.row].repeatNum.description
        cell.alarmSwitch.isOn = alarmTable[indexPath.row].isSoundOn
        
        return cell
    }
    
    
}

class AlarmCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alarmInfoLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
}
