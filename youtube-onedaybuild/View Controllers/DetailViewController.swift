//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Farhad Bagherzadeh on 1/3/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear the fields from old details
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        //check if there is a video
        guard video != nil else {return}
        
        //create the embed url
        let embedURL = URL(string: Constants.YT_EMBED_URL + video!.videoId)
        
        //load it to webview
        let request = URLRequest(url: embedURL!)
        webView.load(request)
        
        //set other views
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        descriptionTextView.text = video!.description
    }
}
