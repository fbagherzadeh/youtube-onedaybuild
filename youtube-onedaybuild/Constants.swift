//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 14/2/21.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBg9m7s5PlQNh7EKrrplLz0fhw75NEdqOs"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
}
