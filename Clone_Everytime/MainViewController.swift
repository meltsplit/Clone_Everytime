//
//  MainViewController.swift
//  Clone_Everytime
//
//  Created by 장석우 on 2022/04/10.
//

import Foundation
import UIKit

final class MainViewController : UITableViewController{
    
    let textArray = TextFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.navigationItem.titleView = NavigationTitleView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more_title"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        self.tableView.separatorStyle = .none
        self.tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        textArray.text.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        
        cell.setupData(data: textArray.text[indexPath.item])
        return cell
    }
    
}
