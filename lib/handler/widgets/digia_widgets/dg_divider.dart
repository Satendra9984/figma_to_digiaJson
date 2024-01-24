import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class DgDividerWidgetResolver extends UiObjectModelBase {
  DgDividerWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    Map localJson = {};

    //
    localJson["type"] = figmaProps["name"];
    localJson["id"] = figmaProps["id"];

    finalDigiaWidgetGlobalJson["${figmaProps["id"]}"] = localJson;
    //

    return figmaProps["id"].toString();
  }

  @override
  Map addPropsData() {
    Map propsData = {};

    return propsData;
  }

  @override
  Map? addDefaultPropsData() {
    Map? defaultPropsData = {};

    return defaultPropsData;
  }
}
