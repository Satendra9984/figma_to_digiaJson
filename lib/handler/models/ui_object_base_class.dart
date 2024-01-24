abstract class UiObjectModelBase {
  final Map figmaProps;
  final Map finalDigiaWidgetGlobalJson;

  UiObjectModelBase({
    required this.figmaProps,
    required this.finalDigiaWidgetGlobalJson,
  });

  String getDigiaWidgetJson();
  Map addPropsData();
  Map? addDefaultPropsData();
}
