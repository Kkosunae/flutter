import 'package:flutter/widgets.dart';

// Map screen 의 modal bottom sheet 내용
class MapBottomSheetWidget extends StatefulWidget {
  const MapBottomSheetWidget({super.key});

  @override
  State<MapBottomSheetWidget> createState() => _MapBottomSheetWidgetState();
}

class _MapBottomSheetWidgetState extends State<MapBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [

          ],
        ),
        Text("OO님 주변 정보"),
        ListBody(
          //post 아이템 객체 만들고 list로 표시
          children: [
            SizedBox(
              height: 100,
              child: Text("list1"),
            ),
            SizedBox(
              height: 100,
              child: Text("list2"),
            )
          ],
        ),
      ],
    );
  }
}
