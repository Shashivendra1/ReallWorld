//
//  VideoPlayerFile.swift
//  RealWorld
//
//  Created by SAT PAL on 13/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation
import AVKit

class VideoPlayer {
    
    static var instance : VideoPlayer? = VideoPlayer()
    
    let path = Bundle.main.path(forResource: "backvideo", ofType:"mp4")
    
    var avPlayer = AVPlayer()
    
    var player_view : AVPlayerView?
    
    func playVideo(player_view : AVPlayerView) {
        
        print("video played")
        
        self.player_view = player_view
        
        self.player_view?.contentMode = .scaleAspectFill
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd),
           name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
           object: avPlayer.currentItem)
              
        avPlayer = AVPlayer(url: URL(fileURLWithPath: path!))
        
        let castedLayer = self.player_view?.layer as! AVPlayerLayer
              
              castedLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
              castedLayer.player = avPlayer
             // avPlayer.play()
        
        
    }
    
    func stopVideo() {
        
        print("video stopped")
        
         avPlayer.pause()
     
        avPlayer.replaceCurrentItem(with: nil)
    }
    
    
    @objc func playerItemDidReachEnd() {
        
     //   self.player_view?.seekToTime(kCMTimeZero)
        avPlayer.seek(to: .zero)
        
         avPlayer.play()
    }
}
