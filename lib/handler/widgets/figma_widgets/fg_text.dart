import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';

class FgTextWidgetResolver extends UiObjectModelBase {
  FgTextWidgetResolver({required Map props, required Map resultJson})
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
    Map propData = {};

    //
    propData["type"] = "object";
    Map data = {};
    data["text"] = figmaProps["characters"];
    //
    propData["data"] = data;
    return propData;
  }

  @override
  Map? addDefaultPropsData() {
    Map? defaultPropsData = {};

    return defaultPropsData;
  }
}

final js = {
  "type": "digia/text",
  "id": "1xsd6tZGXc",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "text": {"type": "string", "data": "Figma To Digia Text"},
      "maxLines": {"type": "number", "data": 2},
      "overflow": {"type": "string", "data": "clip"},
      "alignment": {"type": "string", "data": "center"},
      "textStyle": {
        "type": "object",
        "data": {
          "fontToken": {"type": "string", "data": "headlineMedium"},
          "textColor": {"type": "string", "data": "#B92222"},
          "textBgColor": {"type": "string", "data": "#44484E"},
          "textDecoration": {"type": "string", "data": "underline"},
          "textDecorationColor": {"type": "string", "data": "#57636C"},
          "textDecorationStyle": {"type": "string", "data": "solid"}
        }
      }
    }
  },
  "defaultPropData": null,
  "children": [],
  "dataRef": null
};

final figmaText = {
  "id": "3262:6901",
  "name": "Already registered? Sign in",
  "type": "TEXT",
  "scrollBehavior": "SCROLLS",
  "blendMode": "PASS_THROUGH",
  "absoluteBoundingBox": {"x": 2698, "y": 7356, "width": 166, "height": 26},
  "absoluteRenderBounds": {
    "x": 2698.419921875,
    "y": 7363.919921875,
    "width": 164.55517578125,
    "height": 13.328125
  },
  "constraints": {"vertical": "TOP", "horizontal": "LEFT"},
  "fills": [
    {
      "blendMode": "NORMAL",
      "type": "SOLID",
      "color": {
        "r": 0.43921568989753723,
        "g": 0.4941176474094391,
        "b": 0.6823529601097107,
        "a": 1
      }
    }
  ],
  "strokes": [],
  "strokeWeight": 1,
  "strokeAlign": "OUTSIDE",
  "styles": {"fill": "3139:7634"},
  "effects": [],
  "characters": "Already registered? Sign in",
  "style": {
    "fontFamily": "DM Sans",
    "fontPostScriptName": "DMSans-Bold",
    "fontWeight": 700,
    "textAutoResize": "WIDTH_AND_HEIGHT",
    "fontSize": 14,
    "textAlignHorizontal": "LEFT",
    "textAlignVertical": "TOP",
    "letterSpacing": -0.28,
    "lineHeightPx": 26,
    "lineHeightPercent": 142.6376953125,
    "lineHeightPercentFontSize": 185.7142791748047,
    "lineHeightUnit": "PIXELS"
  },
  "layoutVersion": 4,
  "characterStyleOverrides": [
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    39,
    36,
    35,
    35,
    35,
    35,
    35,
    35,
    35
  ],
  "styleOverrideTable": {
    "35": {
      "fontFamily": "DM Sans",
      "fontPostScriptName": "DMSans-Bold",
      "fontWeight": 700,
      "fontSize": 14,
      "letterSpacing": -0.28,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.33725491166114807,
            "g": 0.3176470696926117,
            "b": 0.9647058844566345,
            "a": 1
          }
        }
      ]
    },
    "36": {"letterSpacing": -0.28},
    "39": {
      "fontFamily": "DM Sans",
      "fontPostScriptName": "DMSans-Regular",
      "fontWeight": 400,
      "fontSize": 14,
      "letterSpacing": -0.28,
      "fills": [
        {
          "blendMode": "NORMAL",
          "type": "SOLID",
          "color": {
            "r": 0.33725491166114807,
            "g": 0.3176470696926117,
            "b": 0.9647058844566345,
            "a": 1
          }
        }
      ]
    }
  },
  "lineTypes": ["NONE"],
  "lineIndentations": [0]
};
