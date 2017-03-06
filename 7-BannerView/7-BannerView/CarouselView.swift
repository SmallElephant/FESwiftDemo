//
//  CarouselView.swift
//  7-BannerView
//
//  Created by keso on 2017/3/5.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation
import UIKit

class CarouselView:UIView,UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    var timer:Timer!
    var imgArr:[String] = []
    var currentIndex:Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        
        self.pageControl = UIPageControl(frame: CGRect(x: (self.frame.width - 200) / 2, y: self.frame.height - 40, width: 200, height: 20))
        self.pageControl.numberOfPages = 5
        self.pageControl.currentPage = 1
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.white
        
        self.addSubview(scrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    func playBanner() {
        if currentIndex == self.imgArr.count { // 滚动到最后一页
            currentIndex = 1
        } else {
            currentIndex += 1
        }
        
         self.scrollView .setContentOffset(CGPoint(x: self.scrollView.frame.width * CGFloat(currentIndex), y: 0), animated: true)
    }
    
    private func stopTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector:#selector(playBanner), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    // MAARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX:CGFloat = scrollView.contentOffset.x
        let width:CGFloat = self.scrollView.frame.width
        print("偏移量\(offsetX)")
        if offsetX < width {
            self.scrollView .setContentOffset(CGPoint(x: width * CGFloat(self.imgArr.count), y: 0), animated: true)
        }
        
        if offsetX > (width * CGFloat(self.imgArr.count)) {
               self.scrollView .setContentOffset(CGPoint(x: width, y: 0), animated: true)
        }
        
        
       let currentPage = offsetX / width - 0.5
       self.pageControl.currentPage = Int(currentPage)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        startTimer()
    }
    
    // MARK: SetUp
    
    func setUp(imageNames:[String]) {
        self.imgArr = imageNames
        let count:Int = self.imgArr.count
        let width:CGFloat = self.scrollView.frame.width
        
        for i in 0..<count + 2 {
            let imgView:UIImageView = UIImageView(frame: CGRect(x: width * CGFloat(i), y: 0, width: width, height: self.scrollView.frame.height))
            imgView.backgroundColor = UIColor.green
            imgView.contentMode = UIViewContentMode.scaleAspectFill
            if i == 0 {
                imgView.image = UIImage.init(named: self.imgArr[count - 1])
            } else if i == count + 1 {
                imgView.image = UIImage.init(named: self.imgArr[0])
            } else {
                imgView.image = UIImage.init(named: self.imgArr[i - 1])
            }
            self.scrollView.addSubview(imgView)
        }
        
        currentIndex = 1
        
        self.pageControl.numberOfPages = count
        self.pageControl.currentPage = 0
        self.addSubview(self.pageControl)
        
        self.scrollView.contentOffset = CGPoint(x: width, y: 0)
        self.scrollView.contentSize = CGSize(width: width * CGFloat(count + 2), height: self.scrollView.frame.height)
        
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector:#selector(playBanner), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
}
