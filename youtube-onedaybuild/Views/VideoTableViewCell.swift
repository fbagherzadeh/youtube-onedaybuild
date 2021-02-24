//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 24/2/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v: Video) {
        self.video = v
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        guard self.video?.thumbnail != nil , self.video!.thumbnail != "" else {return}
        let url = URL(string: self.video!.thumbnail)!
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
                //check the downloaded url maches the video thumbnail url that this cell is currently set to display
                if url.absoluteString != self.video?.thumbnail {
                    return
                }
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                    CacheManager.setVideoCache(url.absoluteString, data!)
                }
                
            }
        }
        dataTask.resume()
    }
}
