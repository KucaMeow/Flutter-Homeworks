class Post {
  User user;
  final String postedAt;
  List<User> likedBy;
  List<String> images;
  List<String> assetImages;

  Post({
    required this.user,
    required this.postedAt,
    required this.likedBy,
    required this.images,
    required this.assetImages,
  });
}

class User {
  final String name;
  final String image;

  User({
    required this.name,
    required this.image,
  });
}
