//
//  UIScrollView+QMUI.swift
//  QMUI.swift
//
//  Created by 伯驹 黄 on 2017/3/17.
//  Copyright © 2017年 伯驹 黄. All rights reserved.
//

extension UIScrollView {

    /** 
     * 判断当前的scrollView内容是否足够滚动
     * @warning 避免与<i>scrollEnabled</i>混淆
     */
    var qmui_canScroll: Bool {
        // 没有高度就不用算了，肯定不可滚动，这里只是做个保护
        if bounds.size == .zero {
            return false
        }

        let canVerticalScroll = contentSize.height + contentInset.verticalValue > bounds.height
        let canHorizontalScoll = contentSize.width + contentInset.horizontalValue > bounds.width
        return canVerticalScroll || canHorizontalScoll
    }

    /** 
     * 不管当前scrollView是否可滚动，直接将其滚动到最顶部
     * @param force 是否无视qmui_canScroll而强制滚动
     * @param animated 是否用动画表现
     */
    func qmui_scrollToTopForce(_ force: Bool, animated: Bool) {
        if force || (!force && qmui_canScroll) {
            setContentOffset(CGPoint(x: -contentInset.left, y: -contentInset.top), animated: animated)
        }
    }

    /** 
     * 等同于qmui_scrollToTop(false, animated: animated)
     */
    func qmui_scrollToTopAnimated(_ animated: Bool) {
        qmui_scrollToTopForce(false, animated: animated)
    }

    /// 等同于qmui_scrollToTop(false)
    func qmui_scrollToTop() {
        qmui_scrollToTopAnimated(false)
    }

    /** 
     * 如果当前的scrollView可滚动，则将其滚动到最底部
     * @param animated 是否用动画表现
     * @see [UIScrollView qmui_canScroll]
     */
    func qmui_scrollToBottomAnimated(_ animated: Bool) {
        if qmui_canScroll {
            setContentOffset(CGPoint(x: contentOffset.x, y: contentSize.height + contentInset.bottom - bounds.height), animated: animated)
        }
    }

    /// 等同于qmui_scrollToBottomAnimated(false)
    func qmui_scrollToBottom() {
        qmui_scrollToBottomAnimated(false)
    }

    // 立即停止滚动，用于那种手指已经离开屏幕但列表还在滚动的情况。
    func qmui_stopDeceleratingIfNeeded() {
        if isDecelerating {
            setContentOffset(contentOffset, animated: false)
        }
    }
}
