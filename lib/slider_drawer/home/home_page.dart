import 'package:flutter/widgets.dart';
import 'package:flutter_drawer/slider_drawer/home/widget/author_list.dart';
import 'package:flutter_drawer/slider_drawer/home/widget/slider_menu.dart';
import 'package:flutter_drawer/slider_drawer/src/core/appbar/slider_app_bar.dart';
import 'package:flutter_drawer/slider_drawer/src/core/appbar/slider_app_bar_config.dart';
import 'package:flutter_drawer/slider_drawer/src/slider_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          config: SliderAppBarConfig(
              title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
        sliderOpenSize: 179,
        slider: SliderMenu(
          onItemClick: (title) {
            _sliderDrawerKey.currentState?.closeSlider();
            setState(() {
              this.title = title;
            });
          },
        ),
        child: const AuthorList(),
      ),
    );
  }
}
