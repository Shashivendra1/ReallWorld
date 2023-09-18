//
//  VideoPlayer.swift
//  RealWorld
//
//  Created by SAT PAL on 04/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AVPlayerView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}
