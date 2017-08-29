//
//  ViewController.swift
//  ParallaxTableViewHeader
//
//  Created by Lucas Louca on 11/06/15.
//  Copyright (c) 2015 Lucas Louca. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let items = ["Lonesome Duck", "Mombi", "Mr. Muffin", "Mrs. Yoop", "Munchkins", "Nimmie Amee", "Nome King",
        "Ojo the Lucky", "Patchwork Girl", "Phonograph", "Polychrome", "Pop Over", "Prince Karver", "Princess Langwidere", "Princess Ozma", "Prof. Woggle-Bug", "Queen Ann Soforth", "Sawhorse", "Scarecrow"]
    
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the table views header cell and delegate
        let tableHeaderViewHeight:CGFloat = 400
        let mapView = MKMapView(frame: CGRect(x: 0,y: 0, width: self.view.frame.width, height: tableHeaderViewHeight))
        let tableHeaderView = ParallaxTableHeaderView(size: CGSize(width: self.view.frame.width, height: tableHeaderViewHeight), subView: mapView)
        tableView.tableHeaderView = tableHeaderView
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /**
    Layout header content when table view scrolls
    */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header: ParallaxTableHeaderView = self.tableView.tableHeaderView as! ParallaxTableHeaderView
        header.layoutForContentOffset(tableView.contentOffset)
        self.tableView.tableHeaderView = header
    }
}

// MARK: - UITableViewDataSource
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = items[row]
        
        return cell
    }
}
