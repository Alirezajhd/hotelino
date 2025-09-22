import 'dart:async';
import 'package:Hotelino/core/utils/networkImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StoryCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> titles;

  const StoryCarousel({
    super.key,
    required this.images,
    required this.titles,
  });

  @override
  StoryCarouselState createState() => StoryCarouselState();
}

class StoryCarouselState extends State<StoryCarousel> {
  int _currentIndex = 0;
  double _progress = 0.0;
  Timer? _timer;
  final CarouselSliderController _carouselController = CarouselSliderController();

  static const int storyDurationMs = 5000;
  static const int tickMs = 50;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _progress = 0.0;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: tickMs), (timer) {
      setState(() {
        _progress += tickMs / storyDurationMs;
        if (_progress >= 1.0) {
          _progress = 0.0;
          if (_currentIndex < widget.images.length - 1) {
            _currentIndex++;
          } else {
            _currentIndex = 0;
          }
          _carouselController.animateToPage(_currentIndex);
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startAutoSlide();
  }

  void _nextImage() {
    setState(() {
      if (_currentIndex < widget.images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _carouselController.animateToPage(_currentIndex);
      _progress = 0.0;
    });
    _resetTimer();
  }

  void _prevImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = widget.images.length - 1;
      }
      _carouselController.animateToPage(_currentIndex);
      _progress = 0.0;
    });
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  _progress = 0.0;
                });
                _resetTimer();
              },
            ),
            items: widget.images.map((imageUrl) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(networkUrl(imageUrl), fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.75),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(widget.images.length, (index) {
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: index == _currentIndex
                          ? FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _progress.clamp(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          : _currentIndex > index
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )
                              : SizedBox.shrink(),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Text(
              widget.titles[_currentIndex],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 100,
            child: GestureDetector(
              onTap: _nextImage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                child: const Icon(Icons.chevron_right, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 100,
            child: GestureDetector(
              onTap: _prevImage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                child: const Icon(Icons.chevron_left, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}