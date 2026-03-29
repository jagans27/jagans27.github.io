import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/controllers/root_controller.dart';
import 'package:portfolio/screens/home/widgets/content_view.dart';
import 'package:portfolio/screens/home/widgets/experience_tab_view.dart';
import 'package:portfolio/screens/home/widgets/project_tab_view.dart';
import 'package:portfolio/styles/app_colors.dart';
import 'package:portfolio/widgets/cursor_overlay.dart';
import 'package:provider/provider.dart';

class HomeDesktopScreen extends StatefulWidget {
  final int currentIndex;
  const HomeDesktopScreen({super.key, required this.currentIndex});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  late final PageController _pageController;
  final ScrollController _experienceScrollController = ScrollController();
  final ScrollController _projectScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<RootController>().setCurrentIndex(widget.currentIndex);
    });

    final rootController = context.read<RootController>();
    rootController.addListener(() {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          rootController.currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        );

        if (rootController.currentIndex == 0 &&
            _experienceScrollController.hasClients) {
          _experienceScrollController.jumpTo(0);
        } else if (rootController.currentIndex == 1 &&
            _projectScrollController.hasClients) {
          _projectScrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant HomeDesktopScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _pageController.animateToPage(
          widget.currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        );
        context.read<RootController>().setCurrentIndex(widget.currentIndex);
      });
    }
  }

  void _handleScroll(PointerSignalEvent event) {
    ScrollController? activeController;
    final currentIndex = context.read<RootController>().currentIndex;

    if (currentIndex == 0) {
      activeController = _experienceScrollController;
    } else if (currentIndex == 1) {
      activeController = _projectScrollController;
    }

    if (event is PointerScrollEvent &&
        activeController != null &&
        activeController.hasClients) {
      final newOffset = (activeController.offset + event.scrollDelta.dy).clamp(
        activeController.position.minScrollExtent,
        activeController.position.maxScrollExtent,
      );
      activeController.jumpTo(newOffset);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _experienceScrollController.dispose();
    _projectScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Listener(
        onPointerSignal: _handleScroll,
        child: LazyCursorOverlay(
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ContentView(),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  allowImplicitScrolling: true,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return RepaintBoundary(
                          child: ExperienceTabView(
                            key: const PageStorageKey('experience'),
                            scrollController: _experienceScrollController,
                          ),
                        );
                      case 1:
                        return RepaintBoundary(
                          child: ProjectTabView(
                            key: const PageStorageKey('project'),
                            scrollController: _projectScrollController,
                          ),
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
