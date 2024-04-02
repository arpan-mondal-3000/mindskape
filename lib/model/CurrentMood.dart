class CurrentMoodModel {
  CurrentMoodModel({
    required this.time,
    required this.date,
    required this.mood,
    required this.isSelected,
    required this.id,
    required this.image,

  });
  late  String time;
  late  String date;
  late  int mood;
  late  bool isSelected;
  late  String id;
  late String image;


  CurrentMoodModel.fromJson(Map<String, dynamic> json){
    time = json['time'] ?? "";
    date = json['date'] ?? "";
    mood = json['mood'];
    isSelected = json['isSelected'] ;
    id = json['id'] ?? "";
    image=json['image']??'';

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['date'] = date;
    data['mood'] = mood;
    data['isSelected'] = isSelected;
    data['id'] = id;
    data['image']=image;
    return data;
  }
}