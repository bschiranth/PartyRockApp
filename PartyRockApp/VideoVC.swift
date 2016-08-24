//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Chiranth Bangalore Sathyaprakash on 8/23/16.
//  Copyright © 2016 Chiranth Bangalore Sathyaprakash. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView:UIWebView! //webview outlet
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyRock:PartyRock! // private object
    
    //PartyRock object to fill in webview and label
    var partyRock:PartyRock{
        get{
            return _partyRock
        }set{
            _partyRock = newValue // it will be initializd with new value when created
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

            //load the title and youtube
        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)//load webview with URL
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
