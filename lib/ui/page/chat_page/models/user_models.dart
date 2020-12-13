class User {
  final int id;
  final String name;
  final String image;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.image,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'person1',
  image: 'assets/img/user.png',
  isOnline: true,
);

// USERS
final User other = User(
  id: 1,
  name: 'person2',
  image: 'assets/img/user.png',
  isOnline: true,
);