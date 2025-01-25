extension Image on String {
  String get jpg => 'images/$this.jpg';
  String get png => 'images/$this.png';
  String get gif => 'images/$this.gif';
}
