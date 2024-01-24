import 'package:figma_to_json_convertor/handler/config_resolver/mapper.dart';
import 'package:figma_to_json_convertor/handler/models/ui_object_base_class.dart';
import 'package:figma_to_json_convertor/utils/string_utils.dart';

class DgTextWidgetResolver extends UiObjectModelBase {
  DgTextWidgetResolver({required Map props, required Map resultJson})
      : super(figmaProps: props, finalDigiaWidgetGlobalJson: resultJson);

  @override
  String getDigiaWidgetJson() {
    Map localJson = {};

    //
    localJson["type"] =
        'digia/${WidgetsMapper.getWidgetName(figmaProps["name"])}';
    localJson["id"] = figmaProps["id"];
    localJson["propData"] = addPropsData();
    localJson["defaultPropData"] = addDefaultPropsData();
    localJson["children"] = [];
    localJson["dataRef"] = null;
    //
    finalDigiaWidgetGlobalJson["${figmaProps["id"]}"] = localJson;
    //

    return figmaProps["id"].toString();
  }

  @override
  Map addPropsData() {
    Map propData = {
      "type": "object",
    };

    Map data = {};
    data["text"] = {
      "type": StringUtils.getDatatypeInString(figmaProps["characters"]),
      "data": figmaProps["characters"],
    };

    data["maxLines"] = {
      "type": "numbers",
      "data": 1,
    };
    data["overflow"] = {
      "type": "string",
      "data": "clip",
    };

    data["alignment"] = {
      "type": "string",
      "data": figmaProps["style"]["textAlignHorizontal"],
    };

    data["textStyle"] = _getTextStyle();

    propData["data"] = data;

    return propData;
  }

  Map _getTextStyle() {
    Map textstyle = {
      "type": "object",
    };

    textstyle["data"] = {};
    //? [TODO] : IN LATER DETAILING
    // textstyle["data"]["fontToken"] = _getFontToken()

    textstyle["data"]["textColor"] = {
      "type": "string",
      "data": StringUtils.rgbaToHex(figmaProps["fills"][0]),
    };

    textstyle["data"]["textDecorationStyle"] = {
      "type": "string",
      "data": (figmaProps["fills"][0]["type"] as String).toLowerCase(),
    };

    return textstyle;
  }

  @override
  Map? addDefaultPropsData() {
    Map? defaultPropsData = {};

    return defaultPropsData;
  }
}

final dgt = {
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
