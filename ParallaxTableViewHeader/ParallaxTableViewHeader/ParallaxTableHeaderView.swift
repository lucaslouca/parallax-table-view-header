//
//  ViewParallaxTableHeader.swift
//  ParallaxTableViewHeader
//
//  Created by Lucas Louca on 11/06/15.
//  Copyright (c) 2015 Lucas Louca. All rights reserved.
//

import UIKit

class ParallaxTableHeaderView: UIView {
    let parallaxDeltaFactor: CGFloat = 0.5
    var defaultHeaderFrame: CGRect!
    var scrollView: UIScrollView!
    var subView: UIView!
    
    convenience init(size: CGSize, subView:UIView) {
        self.init(frame: CGRectMake(0, 0, size.width, size.height))
        
        self.scrollView = UIScrollView(frame: self.bounds)
        self.scrollView.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin | .FlexibleHeight | .FlexibleWidth
        self.subView = subView
        self.subView.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin | .FlexibleHeight | .FlexibleWidth
        self.scrollView.addSubview(self.subView)
        self.addSubview(self.scrollView)
    }
    
    /**
    Layout the content of the header view to give the parallax feeling.

    :param: contentOffset scroll views content offset
    */
    func layoutForContentOffset(contentOffset: CGPoint) {
        var frame = self.scrollView.frame
        defaultHeaderFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
        if (contentOffset.y > 0) {
            frame.origin.y = contentOffset.y * parallaxDeltaFactor
            self.scrollView.frame = frame
            self.clipsToBounds = true
        } else {
            var delta: CGFloat = 0.0
            var rect: CGRect = defaultHeaderFrame;
            delta = fabs(contentOffset.y)
            rect.origin.y -= delta
            rect.size.height += delta
            self.scrollView.frame = rect
            self.clipsToBounds = true
        }
    }
}
