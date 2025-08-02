import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:Hotelino/routes/appRoutes.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButton(
                  visible: onboardingProvider.currentPage > 0,
                  icon: Icons.arrow_back,
                  backgroundColor: Colors.transparent,
                  iconColor: Theme.of(context).colorScheme.primary,
                  onPressed: _previousPage,
                ),
                OnboardingButton(
                  visible:
                      onboardingProvider.currentPage <
                      onboardingProvider.onboardingData.length - 1,
                  icon: Icons.arrow_forward,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  iconColor: Colors.white,
                  onPressed: _nextPage,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (totalPages > 1) ...[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                  axisAlignment: -1,
                );
              },
              child:
                  onboardingProvider.currentPage == totalPages - 1
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: SizedBox(
                            width: double.infinity,
                            height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.home,
                              );
                            },
                            child: Text("شروع رزرو هتل ها"),
                          ),
                        ),
                      )
                      : null,
            ),
          ],
        ],
      ),
    );
  }

  void _nextPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage <
        onboardingProvider.onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(microseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _previousPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(microseconds: 500),
        curve: Curves.ease,
      );
    }
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
