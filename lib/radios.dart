/// name : "---تراتيل قصيرة متميزة---"
/// radio_url : "http://live.mp3quran.net:9702/;"

class Radios {
  Radios({
      this.name, 
      this.radioUrl,});

  Radios.fromJson(dynamic json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }
  String? name;
  String? radioUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['radio_url'] = radioUrl;
    return map;
  }

}