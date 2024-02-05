import 'package:doctor_riverpod/constants/colors.dart';
import 'package:doctor_riverpod/constants/icons.dart';
import 'package:doctor_riverpod/presentation/splash/views/splash_view_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../view_model/splash_viewmodel.dart';

final splashViewModelProvider = StateNotifierProvider((ref) => SplashViewModel(ref.read));

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSplashFinished = ref.watch(splashViewModelProvider);
    if (isSplashFinished != null && isSplashFinished == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashSecondView()),
        );
      }
      );
    }
    return Material(
      color: ref.watch(blueColorProvider),
      child: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ref.watch(logoIconProvider)),
            SvgPicture.asset(ref.watch(logoTextIconProvider)),
          ],
        ),
      ),
    );
  }
}
