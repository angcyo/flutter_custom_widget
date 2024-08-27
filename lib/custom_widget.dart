import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/08/27
///
class CustomWidget extends LeafRenderObjectWidget {
  const CustomWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderObject();
  }
}

/// [RenderSliver]
class CustomRenderObject extends RenderBox {
  Offset localPosition = Offset.zero;

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    //进行手势处理, 这里需要注意的是,
    //如果想要`handleEvent`方法被回调, 那么`hitTestSelf`必须返回true
    localPosition = event.localPosition;
    markNeedsPaint();
    //markNeedsLayout();
  }

  @override
  void performLayout() {
    //进行测量操作, 确定自身的大小, 位置由parent决定
    size = constraints.constrain(const Size(100, 100));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    //进行绘制操作, 确定自身的内容
    //context.canvas.drawImage(image, offset, paint);
    //context.canvas.drawPath(path, paint);
    //TextPainter()..layout()..paint(canvas, offset);

    context.canvas.drawRect(
      paintBounds.shift(offset),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.purpleAccent,
    );

    context.canvas.drawCircle(
      localPosition + offset,
      10,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.purpleAccent,
    );

    TextPainter(
        text: TextSpan(
          text: localPosition.toString(),
          style: const TextStyle(
            color: Colors.purpleAccent,
            fontSize: 8,
          ),
        ),
        textDirection: TextDirection.ltr)
      ..layout()
      ..paint(context.canvas, offset);
  }
}
