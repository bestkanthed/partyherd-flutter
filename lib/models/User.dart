class User {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  int rating = 10;

  @override
  toString() => '{ name: $name, location: $location, description: $description, imageUrl: $imageUrl, rating: $rating }';
  
  User(this.name, this.location, this.description);
}

// Here should be user.save() 
