// ignore_for_file: unused_element

library d_chart;


import 'package:community_charts_flutter/community_charts_flutter.dart'
as _charts;
import 'package:flutter/material.dart';



_charts.OutsideJustification? _getOutsideJustify(DJustify? justify) {
  switch (justify) {
    case DJustify.start:
      return _charts.OutsideJustification.start;
    case DJustify.startDrawArea:
      return _charts.OutsideJustification.startDrawArea;
    case DJustify.middle:
      return _charts.OutsideJustification.middle;
    case DJustify.middleDrawArea:
      return _charts.OutsideJustification.middleDrawArea;
    case DJustify.end:
      return _charts.OutsideJustification.end;
    case DJustify.endDrawArea:
      return _charts.OutsideJustification.endDrawArea;
    default:
      return null;
  }
}

_charts.BehaviorPosition? _getBehaviorPosition(DBehaviorPosition? position) {
  switch (position) {
    case DBehaviorPosition.left:
      return _charts.BehaviorPosition.start;
    case DBehaviorPosition.top:
      return _charts.BehaviorPosition.top;
    case DBehaviorPosition.right:
      return _charts.BehaviorPosition.end;
    case DBehaviorPosition.bottom:
      return _charts.BehaviorPosition.bottom;
    default:
      return null;
  }
}

_charts.BarLabelPosition _getBarLabelPosition(RBLabelPosition? labelPosition) {
  switch (labelPosition) {
    case RBLabelPosition.inside:
      return _charts.BarLabelPosition.inside;
    case RBLabelPosition.outside:
      return _charts.BarLabelPosition.outside;
    case RBLabelPosition.right:
      return _charts.BarLabelPosition.right;
    default:
      return _charts.BarLabelPosition.auto;
  }
}

_charts.BarLabelAnchor _getBarLabelAnchor(RBLabelAlign? align) {
  switch (align) {
    case RBLabelAlign.middle:
      return _charts.BarLabelAnchor.middle;
    case RBLabelAlign.end:
      return _charts.BarLabelAnchor.end;
    default:
      return _charts.BarLabelAnchor.start;
  }
}

_charts.BarGroupingType _getBarGroupingType(RBGroupType? type) {
  switch (type) {
    case RBGroupType.stacked:
      return _charts.BarGroupingType.stacked;
    case RBGroupType.groupedStacked:
      return _charts.BarGroupingType.groupedStacked;
    default:
      return _charts.BarGroupingType.grouped;
  }
}

class _IconRenderer extends _charts.CustomSymbolRenderer {
  final IconData icon;
  final double? size;

  _IconRenderer(this.icon, {this.size});
  @override
  Widget build(BuildContext context,
      {Color? color, required Size size, bool enabled = true}) {
    return SizedBox.fromSize(
      size: size,
      child: Icon(
        icon,
        color: color == null
            ? null
            : color.opacity < 1
            ? color.withAlpha(255)
            : color,
        size: this.size ?? 12,
      ),
    );
  }
}

/// model Time Group
class DChartTimeGroup {
  /// id for group data time series
  final String id;

  /// data each group
  final List<DChartTimeData> data;

  // set color for same group
  final Color? color;

  DChartTimeGroup({
    required this.id,
    required this.data,
    this.color,
  });
}

/// model Time Data
class DChartTimeData {
  /// the time at chart
  final DateTime time;

  /// value to measure
  final num value;

  /// your custom data,\
  /// can be string, Map, or your Model class
  final Object? x;

  DChartTimeData({
    required this.time,
    required this.value,
    this.x,
  });
}

class DChartScatterGroup {
  final String id;
  final Color? color;
  final List<DChartScatterData> data;

  DChartScatterGroup({
    required this.id,
    this.color,
    required this.data,
  });
}

class DPlot {
  /// in default direction: horizontal,\
  /// it is called x axis
  final double? domain;

  /// in default direction: horizontal,\
  /// it is called y axis
  final double? measure;

  DPlot(this.domain, this.measure);
}

class DChartScatterData {
  final num measure;
  final num domain;

  /// default 5
  final double? size;
  final SymbolType? type;

  /// for track scatter point\
  /// end plot auto same with (domain,measure)
  final DPlot? startPlot;

  DChartScatterData({
    required this.measure,
    required this.domain,
    this.size,
    this.type,
    this.startPlot,
  });
}

enum SymbolType { circle, rect, triangle }

enum TrackType { cylinder, rectangle }

enum RenderType {
  line,
  bar,
  barTargetLine,
  point,
}

enum DBehaviorPosition { left, top, right, bottom }

enum DJustify {
  startDrawArea,
  start,
  middleDrawArea,
  middle,
  endDrawArea,
  end,
}

/// label relative to bar\
/// RB: Render Bar
enum RBLabelPosition {
  auto,
  outside,
  inside,

  /// when bar horizontal
  right,
}

/// label align\
/// RB: Render Bar
enum RBLabelAlign { start, middle, end }

/// type for group bar
enum RBGroupType { grouped, groupedStacked, stacked }

/// [TitlePositionX] how to position title x axis
enum TitlePositionX { top, bottom }

/// [TitlePositionY] how to position title y axis
enum TitlePositionY { left, right }

/// [BarValueAnchor] how to position value inside bar
enum BarValueAnchor { start, middle, end }

/// [BarValuePosition] how to set value
enum BarValuePosition { inside, outside, auto }

/// [PieLabelPosition] how to position pie data label
enum PieLabelPosition { inside, outside, auto }

typedef BarColor<Color> = Color Function(
    Map<String, dynamic> barData, int? index, String id);
typedef BarValue<String> = String Function(
    Map<String, dynamic> barData, int? index);
typedef LineColor<Color> = Color Function(
    Map<String, dynamic> lineData, int? index, String id);
typedef PieColor<Color> = Color Function(
    Map<String, dynamic> pieData, int? index);
typedef PieLabel<String> = String Function(
    Map<String, dynamic> pieData, int? index);
typedef PieLabel2<String> = String Function(
    Map<String, dynamic> pieData, int? index);

// Time
typedef TimePrimaryColor = Color Function(
    DChartTimeGroup group, DChartTimeData data);
typedef TimeAreaColor = Color Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef TimeFillColor = Color Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef TimeSeriesColor = Color Function(DChartTimeGroup group);
typedef TimeChangedListener = void Function(
    String groupId, DChartTimeData data);
typedef TimeLegendMeasure = String Function(num? value);
typedef TimeLegendTitle = String? Function(DChartTimeGroup group);
typedef TimeLabelValue = String Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef TimeMeasureLabel = String Function(num? value);
typedef TimeDomainLabel = String Function(DateTime? dateTime);

// Scatter
typedef ScatterBorderColor = Color Function(
    Color random, DChartScatterGroup group, DChartScatterData data);
typedef ScatterFillColor = Color Function(
    Color random, DChartScatterGroup group, DChartScatterData data);
typedef ScatterChangedListener = void Function(
    String groupId, DChartScatterData data);
typedef ScatterLegendMeasure = String Function(num? value);
typedef ScatterLegendTitle = String? Function(DChartScatterGroup group);
typedef ScatterLabelValue = String Function(
    DChartScatterGroup group, DChartScatterData data, int? index);
typedef ScatterMeasureLabel = String Function(num? value);
typedef ScatterDomainLabel = String Function(num? value);
typedef ScatterBorderWidth = double Function(
    DChartScatterGroup group, DChartScatterData data, int? index);

// Single Bar
typedef OnBackgroud = void Function(double max);
typedef OnForground = void Function(double value);

/// get color util to color charts
_charts.Color _getColor(Color color) {
  return _charts.ColorUtil.fromDartColor(color);
}

/// get textStyleSpec from TextStyle
_charts.TextStyleSpec? _getTextStyleSpec(TextStyle? textStyle) {
  if (textStyle == null) return null;
  return _charts.TextStyleSpec(
    color: textStyle.color == null
        ? null
        : _charts.ColorUtil.fromDartColor(textStyle.color!),
    fontSize: textStyle.fontSize?.toInt(),
    lineHeight: textStyle.height,
  );
}

/// [_textStyleSpec] styling textsStyle on spec render chart
_charts.TextStyleSpec _textStyleSpec(int? fontSize, Color? color) {
  return _charts.TextStyleSpec(
    color: color == null ? null : _charts.ColorUtil.fromDartColor(color),
    fontSize: fontSize,
  );
}

/// [_getTitlePositionX] convert d'chart title position to chart_flutter position
_charts.BehaviorPosition? _getTitlePositionX(TitlePositionX? position) {
  switch (position) {
    case TitlePositionX.top:
      return _charts.BehaviorPosition.top;
    case TitlePositionX.bottom:
      return _charts.BehaviorPosition.bottom;
    default:
      return null;
  }
}

/// [_getTitlePositionY] convert d'chart title position to chart_flutter position
_charts.BehaviorPosition? _getTitlePositionY(TitlePositionY? position) {
  switch (position) {
    case TitlePositionY.left:
      return _charts.BehaviorPosition.start;

    case TitlePositionY.right:
      return _charts.BehaviorPosition.end;

    default:
      return null;
  }
}

/// [_getBarValueAnchor] convert d'chart value position inside bar to chart_flutter position
_charts.BarLabelAnchor? _getBarValueAnchor(BarValueAnchor? position) {
  switch (position) {
    case BarValueAnchor.start:
      return _charts.BarLabelAnchor.start;
    case BarValueAnchor.middle:
      return _charts.BarLabelAnchor.middle;
    case BarValueAnchor.end:
      return _charts.BarLabelAnchor.end;
    default:
      return null;
  }
}

/// [_getBarValuePosition] convert d'chart value bar position to chart_flutter position
_charts.BarLabelPosition _getBarValuePosition(BarValuePosition? position) {
  switch (position) {
    case BarValuePosition.inside:
      return _charts.BarLabelPosition.inside;
    case BarValuePosition.outside:
      return _charts.BarLabelPosition.outside;
    default:
      return _charts.BarLabelPosition.auto;
  }
}

/// [_getPieLabelPosition] convert pie d'chart position to chart_flutter position
_charts.ArcLabelPosition _getPieLabelPosition(PieLabelPosition position) {
  switch (position) {
    case PieLabelPosition.inside:
      return _charts.ArcLabelPosition.inside;
    case PieLabelPosition.outside:
      return _charts.ArcLabelPosition.outside;
    default:
      return _charts.ArcLabelPosition.auto;
  }
}


class DChartPie extends StatelessWidget {
  /// [data] of chart. key for data map as String and value is dynamic
  /// For axis data, use key 'domain' for domain axis and use key 'measure' for measure axis
  final List<Map<String, dynamic>> data;

  /// [fillColor] return color of pie. can be custom based on pie data
  final PieColor fillColor;

  /// [pieLabel] return PieLabel data. can be custom based on pie data
  final PieLabel? pieLabel;
  final PieLabel? pieLabel2;

  /// [labelPosition] return PieLabelPosition
  /// Default: PieLabelPosition.auto
  final PieLabelPosition labelPosition;

  /// [labelFontSize] return fontSize of label
  /// Default: 12
  final int labelFontSize;

  /// [labelColor] return color of label
  /// Default: Colors.black
  final Color labelColor;

  /// [showLabelLine] if true, will be show label line
  /// Default: true
  final bool showLabelLine;

  /// [labelLineColor] return color of label line
  /// Default: Colors.black
  final Color labelLineColor;

  /// [labelLinelength] return length of label line
  /// Default: 16
  final double labelLinelength;

  /// [labelLineThickness] return thickness of label line
  /// Default: 1
  final double labelLineThickness;

  /// [labelPadding] return padding of label
  /// Default: 5
  final int labelPadding;

  /// [donutWidth] return width of donut chart. if null will be return Pie Chart
  final int? donutWidth;

  /// [strokeWidth] return width of stroke/limit between part data in pie chart
  /// Default: 2
  final double strokeWidth;

  /// [animate] if true, line chart will be animated when widget chart launch
  final bool? animate;

  /// [animationDuration] return duration of animation
  final Duration? animationDuration;

  DChartPie({
    this.animate,
    this.animationDuration,
    required this.data,
    this.donutWidth,
    required this.fillColor,
    this.labelColor = Colors.black,
    this.labelFontSize = 12,
    this.labelLineColor = Colors.black,
    this.labelLineThickness = 1,
    this.labelLinelength = 16,
    this.labelPadding = 5,
    this.labelPosition = PieLabelPosition.auto,
    this.pieLabel,
    this.pieLabel2,
    this.showLabelLine = true,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return _charts.PieChart(
      [
        _charts.Series<Map<String, dynamic>, String>(
          id: 'Pie',
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: data,
          labelAccessorFn: (datum, index) {
            return pieLabel == null
                ? datum['measure'].toString()
                : pieLabel!(datum, index);
          },
          colorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(fillColor(datum, index));
          },
        ),
      ],
      defaultRenderer: _charts.ArcRendererConfig<String>(
        arcWidth: donutWidth,
        strokeWidthPx: strokeWidth,
        arcRendererDecorators: [
          _charts.ArcLabelDecorator(
            labelPadding: labelPadding,
            leaderLineStyleSpec: _charts.ArcLabelLeaderLineStyleSpec(
              color: _charts.ColorUtil.fromDartColor(labelLineColor),
              length: labelLinelength,
              thickness: labelLineThickness,
            ),
            showLeaderLines: showLabelLine,
            labelPosition: _getPieLabelPosition(labelPosition),
            insideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
            outsideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
          ),
        ],
      ),
      animate: animate,
      animationDuration: animationDuration,
    );
  }
}


