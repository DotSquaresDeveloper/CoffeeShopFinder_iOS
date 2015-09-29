//
//  ViewController.swift
//  Programming Exercise
//
//  Created by admin on 9/28/15.
//
//

import UIKit
import CoreLocation


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate{
    
    lazy var locationManager: CLLocationManager! = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        return manager
        }()
   
   var currentLocation = CLLocation()
   
    var repositories = [Repository]()
    @IBOutlet weak var tblCoreLocation: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tblCell = tblCoreLocation.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! JobsTableViewCell;

        tblCell.lblName?.text = repositories[indexPath.row].name
        tblCell.lblAddress?.text = repositories[indexPath.row].address
        tblCell.lbldistance?.text =  String(repositories[indexPath.row].distance);
        return tblCell
    }
    
    override func viewDidLoad() {
        locationManager.startUpdatingLocation();
        tblCoreLocation.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell");
        super.viewDidLoad();
    }
    
    // Service Method for Fetch FourSquare API Data
     func getResponsedata()
    {
        let urlString = NSString(format: "https://api.foursquare.com/v2/venues/search?client_id=ACAO2JPKM1MXHQJCK45IIFKRFR2ZVL0QASMCBCG5NPJQWF2G&client_secret=YZCKUYJ1WHUV2QICBXUBEILZI1DMPUIDP5SHV043O04FKBHL&v=20130815&ll=%f,%f&query=coffee",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
        
        
        let reposURL = NSURL(string: urlString as String);
        // 2
        if let JSONData = NSData(contentsOfURL: reposURL!) {
            // 3
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
                // 4
                if let  var resultData: NSDictionary = json["response"] as? NSDictionary {
                    // 5
                
                    var venues: NSArray ;
                    venues = (resultData["venues"] as? NSArray)!;
                
                    for item in venues
                    {
                     repositories.append(Repository(json: item as! NSDictionary))
                    }
                    
                    repositories.sorted { $0.distance < $1.distance };
                    
                    
                    tblCoreLocation.reloadData()
                
                }
            }
        }
    }
    
  
// CoreLocation Delegate Method
   func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
    
        if UIApplication.sharedApplication().applicationState == .Active {
            
            let currentDistance = newLocation.distanceFromLocation(oldLocation);

            if(currentLocation.coordinate.latitude == 0  || currentDistance > 100) { // run if first time or 100 meters gap
                currentLocation = newLocation;
                getResponsedata();
            }
            
        } else {
            NSLog("App is backgrounded. New location is %@", newLocation)
        }
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Failed to received");
    }
   
    
}

