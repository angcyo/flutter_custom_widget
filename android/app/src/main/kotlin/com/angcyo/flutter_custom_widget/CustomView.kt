package com.angcyo.flutter_custom_widget

import android.content.Context
import android.graphics.Canvas
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View

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