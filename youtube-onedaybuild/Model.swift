//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 14/2/21.
//

import Foundation

class Model {
    
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
            
        }
        
        //kick off the task
        dataTask.resume()
        
    }
    
}
