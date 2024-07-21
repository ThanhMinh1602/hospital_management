class ScreenSub {
  final int id;
  final String subCode;
  final String subName;

  ScreenSub({
    required this.id,
    required this.subCode,
    required this.subName,
  });

  factory ScreenSub.fromJson(Map<String, dynamic> json) {
    return ScreenSub(
      id: json['id'],
      subCode: json['SubCode'],
      subName: json['SubName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'SubCode': subCode,
      'SubName': subName,
    };
  }

  // Dữ liệu giả cho ScreenSub
  static List<ScreenSub> generateFakeData() {
    return [
      ScreenSub(
        id: 1,
        subCode: 'SUB001',
        subName: 'Overview',
      ),
      ScreenSub(
        id: 2,
        subCode: 'SUB002',
        subName: 'User List',
      ),
      ScreenSub(
        id: 3,
        subCode: 'SUB003',
        subName: 'Preferences',
      ),
    ];
  }
}
