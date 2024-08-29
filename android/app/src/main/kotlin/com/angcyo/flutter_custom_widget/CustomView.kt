package com.angcyo.flutter_custom_widget

import android.content.Context
import android.graphics.Canvas
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup

/**
 * Email:angcyo@126.com
 * @author angcyo
 * @date 2024/08/27
 */
class CustomView(context: Context, attrs: AttributeSet?) : View(context, attrs) {

    override fun onTouchEvent(event: MotionEvent?): Boolean {
        //进行手势处理
        //invalidate()
        //requestLayout()
        return super.onTouchEvent(event)
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        //进行测量操作, 确定自身的大小, 位置由parent决定
    }

    override fun onDraw(canvas: Canvas) {
        //进行绘制操作, 确定自身的内容
        //canvas.drawBitmap()
        //canvas.drawText()
        //canvas.drawPath()
    }
}

class CustomViewGroup(context: Context, attrs: AttributeSet?) : ViewGroup(context, attrs) {
    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        //进行测量操作, 确定自身的大小, 已经测量child的大小
    }

    override fun onLayout(changed: Boolean, l: Int, t: Int, r: Int, b: Int) {
        //进行布局操作, 确定子view的位置
        //getChildAt(0)?.layout()
    }

    override fun generateDefaultLayoutParams(): ViewGroup.LayoutParams {
        return LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT
        )
    }

    class LayoutParams(width: Int, height: Int) : ViewGroup.LayoutParams(width, height) {
        //自定义的布局参数
    }
}