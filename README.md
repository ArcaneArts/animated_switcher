Simple widget switches with animation

## Usage

```dart
class SomeWidget extends StatefulWidget {
  const SomeWidget({Key? key}) : super(key: key);

  @override
  State<SomeWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  bool switched = false;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      animatedSwitch(Container(
        width: 100,
        height: 100,
        color: switched ? Colors.blue : Colors.red,
      ), 1000),
      SwitchListTile(
          value: switched,
          onChanged: (f) => setState(() {
            switched = f;
          }))
    ],
  );
}
```
