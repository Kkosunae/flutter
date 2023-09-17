
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:kkosunae/src/widget/custom_app_bar_widget.dart';
import 'package:kkosunae/src/widget/custom_expandable_fab_widget.dart';
import 'package:kkosunae/src/widget/map_bottom_sheet_widget.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final initCameraPosition = NCameraPosition(target: NLatLng(37.506932467450326, 127.05578661133796), zoom: 10);
  final marker1 = NMarker(id: 'marker1',position: NLatLng(37.506932467450326, 127.05578661133796));
  final marker2 = NMarker(id: 'marker2',position: NLatLng(37.606932467450326, 127.05578661133796));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(title: "지도",),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(
                Alignment.topRight.x, Alignment.topRight.y + 0.35
            ),
            child: ExpandableFab(),
          ),
          Align(
            alignment: Alignment(
              Alignment.bottomRight.x, Alignment.bottomRight.y - 0.25
            ),
            child: FloatingActionButton(onPressed: (){},),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x, Alignment.bottomRight.y
            ),
            child: FloatingActionButton(onPressed: (){},),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: initCameraPosition,
              ),
              onMapReady: (controller) {
                print("네이버 맵 로딩됨!");
                controller.addOverlayAll({marker1, marker2});
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton( // modal sheet button
                child: const Text("show modal sheet"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled:true, // modal sheet height 제한 없게 해줌.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: 600,
                        child: MapBottomSheetWidget(),
                        // Column(
                        //   children: <Widget>[
                        //     Row(
                        //       children: [
                        //         Expanded(child: Container()),
                        //         IconButton(
                        //           icon: Icon(Icons.close_rounded, color: Colors.black,),
                        //           onPressed: () => Navigator.pop(context),
                        //         ),
                        //       ],
                        //     ),
                        //     Expanded(
                        //         child: Text("expanded"),
                        //     ),
                        //   ],
                        // ),
                      );
                    },
                  );
                },
              )
            ),
          ],
        )
      ),
    );
  }
}


