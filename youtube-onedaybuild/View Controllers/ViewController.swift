//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 11/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    var model = Model()
    var videos = [Video]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getVideos()
    }
    
    func videoFetched(videos: [Video]) {
        self.videos = videos
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {return}
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.video = selectedVideo
        }
    }
}

