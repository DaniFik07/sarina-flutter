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
  name: 'Saya',
  image: 'assets/img/user.png',
  isOnline: true,
);

// USERS
final User diaDia = User(
  id: 1,
  name: 'Dia Dia',
  image: 'assets/img/user.png',
  isOnline: true,
);
final User yangLain = User(
  id: 1,
  name: 'Yang Lain',
  image: 'assets/img/user.png',
  isOnline: true,
);