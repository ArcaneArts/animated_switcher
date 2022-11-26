library animated_switcher;

import 'package:flutter/material.dart';

Widget animatedSwitch(Widget w, [int ms = 3000]) => AnimatedSwitcher(
      duration: Duration(milliseconds: ms),
      switchOutCurve: Curves.easeOutExpo,
      switchInCurve: Curves.easeOutCirc,
      child: Stack(
        key: UniqueKey(),
        fit: StackFit.expand,
        children: [w],
      ),
    );

Widget animatedSwitchText(Widget w, [int ms = 3000]) => AnimatedSwitcher(
      duration: Duration(milliseconds: ms),
      switchOutCurve: Curves.easeOutExpo,
      switchInCurve: Curves.easeOutCirc,
      child: Stack(
        key: UniqueKey(),
        fit: StackFit.passthrough,
        children: [w],
      ),
    );

Widget animatedSwitchSymetrical(Widget w, [int ms = 750]) => AnimatedSwitcher(
      duration: Duration(milliseconds: ms),
      switchOutCurve: Curves.easeInOutCirc,
      switchInCurve: Curves.easeInOutCirc,
      child: Stack(
        key: UniqueKey(),
        fit: StackFit.expand,
        children: [w],
      ),
    );

class FadeOut extends StatefulWidget {
  final Widget? child;
  final Duration? duration;
  final Duration? delay;
  final Curve? curve;

  const FadeOut({Key? key, this.child, this.delay, this.duration, this.curve})
      : super(key: key);

  @override
  _FadeOutState createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> {
  bool go = false;
  bool disposed = false;

  @override
  void initState() {
    Future.delayed(widget.delay ?? const Duration(seconds: 1), () {
      if (disposed) {
        return;
      }

      setState(() => go = true);
    });
    super.initState();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        opacity: go ? 0 : 1,
        duration: widget.duration ?? const Duration(seconds: 1),
        curve: widget.curve ?? Curves.easeInOut,
        child: widget.child ?? Container(),
      );
}
