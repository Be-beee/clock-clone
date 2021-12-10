//
//  AddWTViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/07.
//

import UIKit

class AddWTController: UIViewController {
    
    var locations: [(lc: String, tz: String)] = [("서울, 대한민국", "KST"), ("도쿄, 일본", "TST"), ("베이징, 중국", "CST"), ("뉴욕, 미국", "EST"), ("런던, 잉글랜드", "GMT")]
    var selectedLocation: (lc: String, tz: String) = ("서울", "KST")
    
    @IBOutlet weak var wtSearchBar: UISearchBar!
    @IBOutlet weak var allwtTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddWTController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allwtTableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath) as? RegionCell else { return UITableViewCell() }
        cell.locationLabel.text = locations[indexPath.row].lc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedLocation = locations[indexPath.row]
        self.performSegue(withIdentifier: "toWTTable", sender: self)
    }
}

class RegionCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
}
