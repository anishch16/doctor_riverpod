import 'package:doctor_riverpod/constants/colors.dart';
import 'package:doctor_riverpod/constants/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/icons.dart';
import '../widgets/changing_page.dart';

final pageControllerProvider = Provider<PageController>((ref) => PageController());
final skippingPagesProvider = Provider<List<Widget>>((ref) {
  return List.generate(
    3,
        (index) => ChangingPages(
      title: setTitle(index),
      subTitle: setSubTitle(index),
      image: setImage(index, ref),
    ),
  );
});


String setTitle(int index) {
  if (index == 0) {
    return "Seamless Doctor Connections";
  } else if (index == 1) {
    return "Medications at Your Doorstep";
  } else {
    return "Find Pharmacies Nearby";
  }
}

String setSubTitle(int index) {
  if (index == 0) {
    return "Skip the queues and Easily connect with top doctors at your fingertips.";
  } else if (index == 1) {
    return "Skip the queues and Easily connect with top doctors at your fingertips.";
  } else {
    return " Need a pharmacy? Our platform locates the nearest ones for you. Prioritize your comfort.";
  }
}

String setImage(int index, ProviderRef ref) {
  if (index == 0) {
    return ref.watch(connectionIconProvider);
  } else if (index == 1) {
    return ref.watch(medicationIconProvider);
  } else {
    return ref.watch(pharmacyIconProvider);
  }
}



class SkippingView extends ConsumerWidget {
  const SkippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = ref.watch(skippingPagesProvider);
    final controller = ref.watch(pageControllerProvider);
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  stops: const [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    ref.watch(lightBlueColorProvider).withOpacity(0),
                    ref.watch(lightBlueColorProvider).withOpacity(0.075),
                    ref.watch(lightBlueColorProvider).withOpacity(0.15),
                    ref.watch(lightBlueColorProvider).withOpacity(0.225),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Text(
                      "Skip",
                      style: ref.watch(normalStyleProvider).copyWith(
                          color: ref.watch(blackColorProvider),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      type: WormType.thinUnderground,
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    return InkWell(
                      onTap: () {
                      },
                      child: Text(
                        "Next",
                        style: ref.watch(normalStyleProvider).copyWith(
                          color: ref.watch(blueColorProvider),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    );
                  }),

                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

