import 'package:flutter_examples/model/sample_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MultipleAxisExample extends SampleView {
  const MultipleAxisExample(Key key) : super(key: key);
  
  @override
  _MultipleAxisExampleState createState() => _MultipleAxisExampleState();
}

class _MultipleAxisExampleState extends SampleViewState {
  _MultipleAxisExampleState();
  bool panelOpen;
  final ValueNotifier<bool> frontPanelVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    panelOpen = frontPanelVisible.value;
    frontPanelVisible.addListener(_subscribeToValueNotifier);
    super.initState();
  }

  void _subscribeToValueNotifier() => panelOpen = frontPanelVisible.value;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(MultipleAxisExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    frontPanelVisible.removeListener(_subscribeToValueNotifier);
    frontPanelVisible.addListener(_subscribeToValueNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return _getRadialGauge(context);
  }

  SfRadialGauge _getRadialGauge(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 32,
        maximum: 212,
        interval: 36,
        radiusFactor: MediaQuery.of(context).orientation == Orientation.portrait
            ? isCardView ? 0.5 : 0.6
            : 0.5,
        labelOffset: 15,
        needsRotateLabels: true,
        minorTickStyle: MinorTickStyle(
            color: const Color(0xFF00A8B5),
            thickness: 1.5,
            lengthUnit: GaugeSizeUnit.factor,
            length: 0.07),
        majorTickStyle: MajorTickStyle(
            color: const Color(0xFF00A8B5),
            thickness: 1.5,
            lengthUnit: GaugeSizeUnit.factor,
            length: 0.15),
        axisLineStyle: AxisLineStyle(
          color: const Color(0xFF00A8B5),
          thickness: 3,
        ),
        axisLabelStyle:
            GaugeTextStyle(color: const Color(0xFF00A8B5), fontSize: 12),
      ),
      RadialAxis(
          minimum: 0,
          maximum: 100,
          interval: 10,
          ticksPosition: ElementsPosition.outside,
          labelsPosition: ElementsPosition.outside,
          minorTicksPerInterval: 5,
          radiusFactor: 0.95,
          labelOffset: 15,
          minorTickStyle: MinorTickStyle(
              thickness: 1.5, length: 0.07, lengthUnit: GaugeSizeUnit.factor),
          majorTickStyle: MinorTickStyle(
            thickness: 1.5,
            length: 0.15,
            lengthUnit: GaugeSizeUnit.factor,
          ),
          axisLineStyle: AxisLineStyle(
            thickness: 3,
          ),
          axisLabelStyle: GaugeTextStyle(fontSize: 12),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                angle: 90,
                positionFactor: 1,
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        child: const Text(
                      '33°C  :',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    )),
                    Container(
                        child: const Text(
                      ' 91.4°F',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF00A8B5),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    ))
                  ],
                ))
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              needleLength: 0.68,
              lengthUnit: GaugeSizeUnit.factor,
              needleStartWidth: 0,
              needleEndWidth: 3,
              value: 33,
              enableAnimation: true,
              knobStyle: KnobStyle(
                  knobRadius: 6.5, sizeUnit: GaugeSizeUnit.logicalPixel),
            )
          ]),
    ]);
  }
}
