//
//  ConstantsTemplate.swift
//  youtube-onedaybuild
//
//  Created by Farhad on 15/2/21.
//

//add you own apikey here

import Foundation


 
struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
 
    static var VIDEOCELL_ID = "VideoCell"
}
 

