//
//  VesselViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-23.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

struct applet {
    var appletName : String
    var appletIcon : UIImage
    var segue : String
}

//var applets : [applet] = [applet]()

    
// ["Create Account", "Add to Cart", "Manage Cart" ]

class VesselViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    // MARK: Properties
    
    let section = ["E-Commerce", "UI Elements", "Content", "Entitlements"]

    var applets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet1"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet2"),
        applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet3"),
        applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet4")
    ]

    var UIapplets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet1"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet2"),
    ]

    var contentApplets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet1"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet2"),
    ]

    var entitlementsApplets : [applet] = [
        applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet1"),
        applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Combined Shape"), segue: "applet2"),
    ]
    
    lazy var appletsFullList = [applets, UIapplets, contentApplets, entitlementsApplets]

    @IBOutlet weak var List: UITableView!
    
    @IBOutlet weak var Filter: UIButton!
    
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        List.delegate = self
        List.dataSource = self
    }
    
    
    // MARK: Functions
    
    @IBAction func filterTapped(_ sender: UIButton) {
        print("hi")
    }
    
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    
    // Title of Each Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    // Number of Rows in Each Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(appletsFullList[section].count)
        return appletsFullList[section].count
    }
    
    // Intializing What Image and Label is in Each Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "appletCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AppletTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.appletLabel?.text = appletsFullList[indexPath.section][indexPath.row].appletName
        cell.appletIcon?.image = appletsFullList[indexPath.section][indexPath.row].appletIcon
        
        return cell
    }
    
    // What Happens After Clicking on a Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: applets[indexPath.row].segue, sender: self)
    }
    
}

/*
 
 func createAppletList(){
     applets.append(applet(appletName: "Create Account", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet1"))
     applets.append(applet(appletName: "Add to Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet2"))
     applets.append(applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet3"))
     applets.append(applet(appletName: "Manage Cart", appletIcon: #imageLiteral(resourceName: "Screen Shot 2020-06-24 at 12.46.40 PM"), segue: "applet4"))
     
 }
     
 
 
 
 
 
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return applets.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "appletCell", for: indexPath)

     cell.textLabel!.text = applets[indexPath.row]
     
     //cell.imageView!.image = UIImage(named: "CreateAccountIcon")
     
     return cell
 }
 
 */
