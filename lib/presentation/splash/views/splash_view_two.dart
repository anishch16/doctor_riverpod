import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../skippable_page/view/skippable_page_view.dart';
import '../view_model/splash_viewmodel.dart';

final splashViewModelProvider = StateNotifierProvider((ref) => SplashViewModel(ref.read));

class SplashSecondView extends ConsumerWidget {
  const SplashSecondView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSplashFinished = ref.watch(splashViewModelProvider);
    if (isSplashFinished != null && isSplashFinished == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SkippingView()),
        );
      });
    }
    return Material(
      color: ref.watch(blueColorProvider),
      child: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ref.watch(logoTextIconProvider)),

          ],
        ),
      ),
    );;
  }
}
