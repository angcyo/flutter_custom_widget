import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/08/29
///
class CustomContainerWidget extends SingleChildRenderObjectWidget {
  const CustomContainerWidget({super.key, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      CustomContainerRenderObject();
}

/// [RenderObjectWithChildMixin]
class CustomContainerRenderObject extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin<RenderBox> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CustomContainerParentData) {
      child.parentData = CustomContainerParentData();
    }
  }

  @override
  void performLayout() {
    if (child != null) {
      final parentData = child!.parentData as CustomContainerParentData;
      parentData.offset = const Offset(100, 100); // 确定子元素的位置
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }
    context.paintChild(child, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child?.hitTest(result, position: position) ?? false;
  }
}

//--

class CustomListContainerWidget extends MultiChildRenderObjectWidget {
  const CustomListContainerWidget({super.key, super.children});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      CustomListContainerRenderObject();
}

/// [ContainerRenderObjectMixin]
class CustomListContainerRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomContainerParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomContainerParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CustomContainerParentData) {
      child.parentData = CustomContainerParentData();
    }
  }

  @override
  void performLayout() {
    visitChildren((child) {
      final parentData = child.parentData as CustomContainerParentData;
      parentData.offset = const Offset(100, 100); // 确定子元素的位置
    });
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

//--

/// [ParentDataWidget]
class CustomContainerParentData extends ContainerBoxParentData<RenderBox> {}

class CustomContainerParentDataWidget
    extends ParentDataWidget<CustomContainerParentData> {
  const CustomContainerParentDataWidget({super.key, required super.child});

  @override
  void applyParentData(RenderObject renderObject) {
    if (renderObject.parentData is! CustomContainerParentData) {
      renderObject.parentData = CustomContainerParentData();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => CustomContainerParentDataWidget;
}
