//
//  AddWTViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/07.
//

import UIKit

class AddWTController: UIViewController {
    
    var curLocation = Locale(identifier: "ko_KR").regionCode
    var locations: [String] = []
    

    @IBOutlet weak var wtSearchBar: UISearchBar!
    @IBOutlet weak var allwtTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(curLocation ?? "nil")
    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddWTController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allwtTableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath) as? RegionCell else { return UITableViewCell() }
        
        return cell
    }
}

class RegionCell: UITableViewCell {
    
}
