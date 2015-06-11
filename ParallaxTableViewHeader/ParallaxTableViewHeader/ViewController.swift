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
        var tableHeaderViewHeight:CGFloat = 400
        var mapView = MKMapView(frame: CGRectMake(0,0, self.view.frame.width, tableHeaderViewHeight))
        var tableHeaderView = ParallaxTableHeaderView(size: CGSizeMake(self.view.frame.width, tableHeaderViewHeight), subView: mapView)
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
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let header: ParallaxTableHeaderView = self.tableView.tableHeaderView as! ParallaxTableHeaderView
        header.layoutForContentOffset(tableView.contentOffset)
        self.tableView.tableHeaderView = header
    }
}

// MARK: - UITableViewDataSource
extension ViewController {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = items[row]
        
        return cell
    }
}
