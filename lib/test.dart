import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Table Example'),
        ),
        body: DropdownTable(),
      ),
    );
  }
}

class DropdownTable extends StatelessWidget {
  const DropdownTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:const<Widget>[
        ExpansionTile(
          title: Text('E01 Nội trú'),
          children: <Widget>[
            ExpansionTile(
              title: Text('E01L00001 Hồ sơ điều trị'),
              children: <Widget>[
                ExpansionTile(
                  title: Text('E01L00001.1 Hồ sơ bác sĩ'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Xem'),
                    ),
                    ListTile(
                      title: Text('Thêm'),
                    ),
                    ListTile(
                      title: Text('Sửa'),
                    ),
                  ],
                ),
                ListTile(
                  title: Text('E01L00001.2 Hồ sơ điều dưỡng'),
                ),
              ],
            ),
            ListTile(
              title: Text('E01L00002 Danh sách người bệnh tại Khoa'),
            ),
          ],
        ),
        ListTile(
          title: Text('E02 Ngoại trú'),
        ),
        ListTile(
          title: Text('E05 Dữ liệu dùng chung'),
        ),
      ],
    );
  }
}
