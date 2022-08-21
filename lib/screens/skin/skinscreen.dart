import 'package:flutter/material.dart';
import 'package:wajah_id/screens/skin/selectable_circle_item.dart';
import 'package:wajah_id/screens/skin/selectable_circle_list.dart';


/// home widget of the example app
class SkinScreen extends StatefulWidget {
  /// creates the widget
  SkinScreen({Key key}) : super(key: key);

  @override
  _SkinScreenState createState() => _SkinScreenState();
}

class _SkinScreenState extends State<SkinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SelectableCircleList(
                children: _buildItems(),
                description: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("test"),
                ),
                subDescription: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("subtest"),
                ),
                onTap: _onTapCircle,
                initialValue: "6|subsecond",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: SelectableCircleList(
                children: _buildItems(),
                description: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("test multiselect"),
                ),
                onTapMultiSelect: _onTapMulti,
                initialValue: "1|3|6",
                itemWidth: 60,
                canMultiselect: true,
                externalPadding: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SelectableCircleItem> _buildItems() {
    return <SelectableCircleItem>[
      SelectableCircleItem(Icon(Icons.description), "first", "1", Colors.red),
      SelectableCircleItem(Icon(Icons.ac_unit), "second", "2", Colors.orange,
          subItemList: [
            SelectableCircleSubItem("subfirst", "subfirst"),
            SelectableCircleSubItem("subsecond", "subsecond"),
            SelectableCircleSubItem("subthird", "subthird"),
            SelectableCircleSubItem("subfourth", "subfourth"),
            SelectableCircleSubItem("subfifth", "subfifth"),
            SelectableCircleSubItem("subsixth", "subsixth"),
          ]),
      SelectableCircleItem(Image(), "third", "3", Colors.blue),
      SelectableCircleItem(Icon(Icons.ac_unit), "may the 4th", "4", Colors.green),
      SelectableCircleItem(Icon(Icons.ac_unit), "fifth", "5", Colors.orange),
      SelectableCircleItem(
        Icon(Icons.ac_unit),
        "6",
        "6",
        Colors.green,
        subItemList: [
          SelectableCircleSubItem("subfirst", "subfirst"),
          SelectableCircleSubItem("subsecond", "subsecond"),
          SelectableCircleSubItem("subthird", "subthird"),
          SelectableCircleSubItem("subfourth", "subfourth"),
          SelectableCircleSubItem("subfifth", "subfifth"),
          SelectableCircleSubItem("subsixth", "subsixth"),
        ],
      ),
    ];
  }

  _onTapCircle(String value, String subvalue) {
    print("tapped $value $subvalue");
  }

  _onTapMulti(List<String> values) {
    print(values);
  }
}