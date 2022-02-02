import 'package:flutter/material.dart';

// Usefull functions to reduce boilerplate
class UIHelper {
  // Vertical spacing constants. Adjust to your liking
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceLarge = 60.0;

  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;

  // Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  static Widget verticalSpaceMedium() {
    return verticalSpace(_HorizontalSpaceMedium);
  }

  static Widget verticalSpaceLarge() {
    return verticalSpace(_HorizontalSpaceLarge);
  }

  // Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(
      height: height,
    );
  }

  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_HorizontalSpaceLarge);
  }

  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
