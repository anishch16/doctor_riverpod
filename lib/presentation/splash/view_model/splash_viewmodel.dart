import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashViewModel extends StateNotifier<bool> {
  SplashViewModel(read) : super(true) {
    Future.delayed(const Duration(seconds: 3), () {
      state = false;
    });
  }
}