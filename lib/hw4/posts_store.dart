import 'package:mobx/mobx.dart';

import 'models.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  final user =
      User(name: "user", image: "resources/images/user.png");
  final admin = User(name: "admin", image: "resources/images/admin.png");

  _PostsStore() {
    fetchPosts();
  }

  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  @action
  void fetchPosts() {
    if(posts.isEmpty) {
      posts.insertAll(0, [
        Post(
          user: user,
          images: [],
          assetImages: ["resources/images/picture.jpg"],
          likedBy: [admin],
          postedAt: "32 декабря 2050 г.",
        ),
        Post(
          user: admin,
          images: [],
          assetImages: [
            "resources/images/picture2.png",
            "resources/images/picture.jpg"
          ],
          likedBy: [user],
          postedAt: "32 декабря 2050 г.",
        ),
      ]);
    }
  }

  @action
  addPost(String filePath, String description) {
    Post newPost = Post(
      user: user,
      images: [filePath],
      assetImages: [],
      likedBy: [],
      postedAt: "32 декабря 2050 г.",
    );
    posts.insert(0, newPost);
    // postContainer = PostContainer(posts: posts);
  }
}
