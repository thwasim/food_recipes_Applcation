class Profilemodel {
  String? image;

  Profilemodel({this.image});

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {"image": image};
  }

// receiving  data from server
  factory Profilemodel.fromMap(map) {
    return Profilemodel(image: map['image']);
  }
}
