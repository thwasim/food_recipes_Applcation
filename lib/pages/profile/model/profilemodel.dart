class Profilemodel {
  String? image;

  Profilemodel({this.image});

   // receiving  data from server
  
    Map<String, dynamic> toMap() {
    return {
      "image" : image
    };
  }

  factory Profilemodel.fromMap(map) {
    return Profilemodel(
      image:map['image']
    );
  }
  // sending data to our server
 
}