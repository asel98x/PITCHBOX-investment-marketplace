import 'package:flutter/material.dart';

class RangeSeekBar extends StatefulWidget {
  final int min;
  final int max;
  final int initialMinValue;
  final int initialMaxValue;
  final ValueChanged<int> onMinValueChanged;
  final ValueChanged<int> onMaxValueChanged;

  RangeSeekBar({
    required this.min,
    required this.max,
    required this.initialMinValue,
    required this.initialMaxValue,
    required this.onMinValueChanged,
    required this.onMaxValueChanged,
  });

  @override
  _RangeSeekBarState createState() => _RangeSeekBarState();
}

class _RangeSeekBarState extends State<RangeSeekBar> {
  late double _minValue;
  late double _maxValue;

  @override
  void initState() {
    super.initState();
    _minValue = widget.initialMinValue.toDouble();
    _maxValue = widget.initialMaxValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.0,
          child: Row(
            children: [
              Text('Min: ${_minValue.toInt()}'),
              Expanded(
                child: Slider(
                  value: _minValue,
                  min: widget.min.toDouble(),
                  max: widget.max.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _minValue = value;
                    });
                    widget.onMinValueChanged(value.toInt());
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
          child: Row(
            children: [
              Text('Max: ${_maxValue.toInt()}'),
              Expanded(
                child: Slider(
                  value: _maxValue,
                  min: widget.min.toDouble(),
                  max: widget.max.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _maxValue = value;
                    });
                    widget.onMaxValueChanged(value.toInt());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
