import 'dart:async';

import 'package:flutter/material.dart';

import '../models/lap.dart';

class StopwatchViewModel extends ChangeNotifier {
  late Stopwatch _stopwatch;
  Timer? _timer;
  final List<Lap> _laps = [];
  Duration _previousLapTime = Duration.zero;
  bool _isRunning = false;

  StopwatchViewModel() {
    _stopwatch = Stopwatch();
  }

  Duration get elapsed => _stopwatch.elapsed;
  bool get isRunning => _isRunning;
  List<Lap> get laps => List.unmodifiable(_laps);

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _isRunning = true;
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        notifyListeners();
      });
    }
  }

  void pause() {
    _stopwatch.stop();
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _stopwatch.reset();
    _laps.clear();
    _previousLapTime = Duration.zero;
    _isRunning = false;
    notifyListeners();
  }

  void recordLap() {
    if (_stopwatch.isRunning) {
      final currentLapTime = _stopwatch.elapsed - _previousLapTime;
      _laps.insert(0, Lap(
        number: _laps.length + 1,
        lapTime: currentLapTime,
        totalTime: _stopwatch.elapsed
      ));
      _previousLapTime = _stopwatch.elapsed;
      notifyListeners();
    }
  }
}
