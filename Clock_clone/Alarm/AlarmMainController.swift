//
//  AlarmViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/12.
//

import UIKit

class AlarmMainController: UIViewController {
    
    var alarmTable: [String] = []
    @IBOutlet weak var alarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addAlarm(_ sender: Any) {
        
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
        
        
        
        return cell
    }
    
    
}

class AlarmCell: UITableViewCell {
    
}
