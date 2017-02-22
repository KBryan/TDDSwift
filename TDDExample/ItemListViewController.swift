//
//  ItemListViewController.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-25.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet var dataProvider:(UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
