import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class FgGroupWidgetResolver extends UiObjectModelBase {
  FgGroupWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    // finalDigiaWidget = {};

    //
    finalDigiaWidgetGlobalJson["type"] = figmaProps["name"];
    finalDigiaWidgetGlobalJson["id"] = figmaProps["id"];
    // finalDigiaWidget["propData"] = _addPropData();
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
