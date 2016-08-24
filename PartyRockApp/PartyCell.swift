//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Chiranth Bangalore Sathyaprakash on 8/23/16.
//  Copyright © 2016 Chiranth Bangalore Sathyaprakash. All rights reserved.
//

import UIKit

//class PartyCell is of type table view cell
class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(partyRock:PartyRock)  {
        videoTitle.text = partyRock.videoTitle // this will get the value from the class
        //TODO: set image from url
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data) //self is this class
                    //this will run images asyn
                }
            }catch{//catch error
            }
        }
        
    }

}
