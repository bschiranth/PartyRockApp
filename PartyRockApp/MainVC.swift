//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Chiranth Bangalore Sathyaprakash on 8/22/16.
//  Copyright © 2016 Chiranth Bangalore Sathyaprakash. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    var partyRocks = [PartyRock]() // array of type class PartyRock initialized
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // create few objects with imageurl , images and title
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/xXYhua4IwoE/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3hZ_ZyzCO24\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Harry1")
        let p2 = PartyRock(imageURL: "https://img.ifcdn.com/images/e28d177decf39ae2efa88d0862a19b749887c5f9cdd2181b3bd17a91dbe1c940_1.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Bm9qKj1Q_OU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Harry2")
        let p3 = PartyRock(imageURL: "http://greatergood.berkeley.edu/images/application_uploads/Inside_Out_Joy_and_Sadness.jpeg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xbZNkMn3PvQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Harry3")
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/L9XNNGZfA6k/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/l3fzFUs-hYM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Harry4")
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/4c0Y22mDZWQ/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/GXRlGULqHxg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Harry5")
        
        partyRocks.append(p1)   //append the objects to the array
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource  = self
    }

    @IBOutlet weak var tableView: UITableView!
    
    //at that cell row do something and return cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell" , for: indexPath) as?
        PartyCell{
            let partyRock = partyRocks[indexPath.row] // PartyRock object at evey row
            
            //now update Table Cell UI with table row 
            cell.updateUI(partyRock: partyRock)
            
            return cell // return UITableViewCell
        }else{
            //if row is not returned default cell is returned
            return UITableViewCell()
        }
    }
    
    //number of table rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row] // get the selected row object
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        //if destination is in fact videoVC
        if let destination = segue.destinationViewController as? VideoVC{
            //if partyrock object is present in sender to segue
            if let party = sender as? PartyRock{
                //assign the destination with partyrock object
                destination.partyRock = party
            }
        }
    }
    
}

