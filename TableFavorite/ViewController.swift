//
//  ViewController.swift
//  TableFavorite
//
//  Created by Werik on 7/12/16.
//  Copyright © 2016 Orbis Ventures. All rights reserved.
//

import UIKit

struct Constant {
    static let nibNameCellIdentifier = "FavoriteCell"
    static let favoriteCellIdentifier = "favoriteCell"
}

class ViewController: UIViewController {
    
//MARK: - IBOutlet
    @IBOutlet weak var favoritesTable: UITableView!
    
//MARK: - Variables
    var data = [Favorite]()

//MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
        self.getData {
            self.printDataInTable()
        }
    }
    
//MARK: - Custom Functions
    func getData(complete:()->Void) {
        let dummyGenerate = Dummy(generateData: .Random)
        self.data = dummyGenerate.data
        complete()
    }
    
    func setupTable() {
        let favoriteNib = UINib(nibName: Constant.nibNameCellIdentifier, bundle: nil)
        self.favoritesTable.registerNib(favoriteNib, forCellReuseIdentifier: Constant.favoriteCellIdentifier)
        self.favoritesTable.rowHeight = UITableViewAutomaticDimension
        self.favoritesTable.estimatedRowHeight = 150
    }
    
    func printDataInTable() {
        self.favoritesTable.beginUpdates()
        let totalItem = self.data.count
        var tmpArray:NSIndexPath? = nil
        for i in 0...totalItem{
            tmpArray = NSIndexPath(forRow: i, inSection: 0)
        }
        self.favoritesTable.insertRowsAtIndexPaths([tmpArray!], withRowAnimation: .Automatic)
        self.favoritesTable.endUpdates()
    }
    
    func addFavorite(sender:DOFavoriteButton) {
        
        let favorite = self.data[sender.tag]
        
        if sender.selected {
            favorite.favorite = "false"
            sender.deselect()
        } else {
            sender.select()
            favorite.favorite = "true"
        }
        
    }

}

extension ViewController:UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected \(indexPath.row)")
    }

}

extension ViewController:UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let favoriteObj = self.data[indexPath.row] as Favorite

        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.favoriteCellIdentifier) as! FavoriteCell
        cell.lblFavorite.text = favoriteObj.name
        cell.btnFavorite.tag = indexPath.row
        if favoriteObj.favorite == "true" {
            cell.btnFavorite.selected = true
        } else {
            cell.btnFavorite.selected = false
        }
        
        cell.btnFavorite.addTarget(self, action: #selector(self.addFavorite(_:)), forControlEvents: .TouchUpInside)
        return cell
    }
}

