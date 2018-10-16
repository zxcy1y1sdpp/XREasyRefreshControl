//
//  XRCustomGifRefreshHeader.swift
//
//  Copyright (c) 2018 - 2020 Ran Xu
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit
import Gifu

class XRCustomGifRefreshHeader: XRBaseRefreshHeader {
    
    lazy var gifImageView: GIFImageView = GIFImageView(frame: CGRect.zero)
    
    override init() {
        super.init()
        
        self.addSubview(gifImageView)
        gifImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        gifImageView.prepareForAnimation(withGIFNamed: "mugen")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gifImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        gifImageView.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
    }
    
    // Overrides
    override func prepareForRefresh() {
        super.prepareForRefresh()
        
        
    }
    
    override func refreshStateChanged() {
        
        switch self.refreshState {
        case .idle:
            gifImageView.stopAnimatingGIF()
            break
        case .pulling:
            
            break
        case .pullHalfing:
            
            break
        case .pullFulling:
            
            break
        case .refreshing:
            gifImageView.startAnimatingGIF()
            break
        case .finished:
            gifImageView.stopAnimatingGIF()
            break
        default:
            break
        }
    }
    
    override func pullProgressValueChanged() {
        
        debugPrint("progress: \(self.progress)")
    }
    
}
