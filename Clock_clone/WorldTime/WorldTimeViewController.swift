//
//  ViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/07.
//

import UIKit

class WorldTimeViewController: UIViewController {

    var worldTimeTable: [(lc: String, tz: String)] = []
    @IBOutlet weak var worldTimeTableView: UITableView!
    @IBOutlet weak var editTableButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToWTTable(_ segue: UIStoryboardSegue) {
        guard let addVC = segue.source as? AddWTController else { return }
        self.worldTimeTable.append(addVC.selectedLocation)
        self.worldTimeTableView.reloadData()
    }

    @IBAction func editWorldTimeTable(_ sender: Any) {
        if self.worldTimeTableView.isEditing {
            self.editTableButton.title = "편집"
            self.worldTimeTableView.setEditing(false, animated: true)
        } else {
            self.editTableButton.title = "완료"
            self.worldTimeTableView.setEditing(true, animated: true)
        }
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
        
        let city = worldTimeTable[indexPath.row].lc.split(separator: ",")[0]
        cell.locationLabel.text = String(city)
        cell.timeCalCell.text = "오늘, +0시간"
        
        let df = DateFormatter()
        df.dateFormat = "a hh:mm"
        df.timeZone = TimeZone(abbreviation: worldTimeTable[indexPath.row].tz)
        let timeText = df.string(from: Date())
        cell.timeLabel.text = timeText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.worldTimeTable.remove(at: indexPath.row)
            self.worldTimeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let target = self.worldTimeTable[sourceIndexPath.row]
        self.worldTimeTable.remove(at: sourceIndexPath.row)
        self.worldTimeTable.insert(target, at: destinationIndexPath.row)
    }
    
}

