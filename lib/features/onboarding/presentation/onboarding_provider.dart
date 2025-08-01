import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:flutter/cupertino.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingRepository repository;

  OnboardingProvider(this.repository) {
    _loadData();
  }

  int currentPage = 0;
  List<Map<String, String>> onboardingData = [];

  void _loadData() {
    onboardingData = repository.onboardingDatas;
    notifyListeners();
  }

  void updatePage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
