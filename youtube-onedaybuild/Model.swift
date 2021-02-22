//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 14/2/21.
//

import Foundation

protocol ModelDelegate {
    func videoFetched(videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate!
    
    func getVideos() {
        
        //create url
        let url  = URL(string: Constants.API_URL)
        guard url != nil else {return}
        
        //get url session
        let session = URLSession.shared
        //get a datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
                DispatchQueue.main.async {
                    if response.items != nil {
                        self.delegate.videoFetched(videos: response.items!)
                    }
                }
            }
            catch {
                print("decoing issue!")
            }
            
            
        }
        
        //kick off the task
        dataTask.resume()
        
    }
    
}
