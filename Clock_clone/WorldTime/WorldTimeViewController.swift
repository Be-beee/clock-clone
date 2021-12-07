//
//  ViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/07.
//

import UIKit

class WorldTimeViewController: UIViewController {

    var worldTimeTable: [(location: String, time: Date)] = [("서울", Date()), ("서울", Date()), ("서울", Date())]
    @IBOutlet weak var worldTimeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func editWorldTimeTable(_ sender: Any) {
        
    }
    
    @IBAction func addWorldTime(_ sender: Any) {
        guard let addWT = UIStoryboard(name: "AddWTController", bundle: nil).instantiateViewController(withIdentifier: "AddWTController") as? AddWTController else { return }
        self.present(addWT, animated: true, completion: nil)
    }
    
}

extension WorldTimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldTimeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as? WorldTimeCell else {
            return UITableViewCell()
        }
        
        cell.locationLabel.text = worldTimeTable[indexPath.row].location
        cell.timeCalCell.text = "오늘, +0시간"
        
        let df = DateFormatter()
        df.dateFormat = "a hh:mm"
        let timeText = df.string(from: worldTimeTable[indexPath.row].time)
        cell.timeLabel.text = timeText
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//        }
//    }
    
}

