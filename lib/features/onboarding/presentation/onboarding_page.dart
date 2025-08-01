import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    final onboardingData = onboardingProvider.onboardingData;
    final int totalPages = onboardingData.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: onboardingProvider.updatePage,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnboardingItem(
                  title: data["title"]!,
                  description: data["description"]!,
                  image: data["image"]!,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          IndicatorBuilder(onboardingProvider.currentPage, totalPages, context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget IndicatorBuilder(
    int currentIndex,
    int totalPages,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: currentIndex == index ? 12 : 8,
          width: currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            color:
                currentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).primaryColor.withAlpha(70),

            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
