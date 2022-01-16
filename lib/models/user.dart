import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String username;
  final String bio;
  final String profilePicUrl;
  final String uid;
  final List<String> followers;
  final List<String> following;

  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.profilePicUrl,
    required this.followers,
    required this.following,
  });
  Map<String ,dynamic> toJson() => {
    'email' : email,
    'username' : username,
    'bio' : bio,
    'profilePicUrl' : profilePicUrl,
    'uid' : uid,
    'followers' : followers,
    'following' : following,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return User(
      uid:snapshot['uid'],
      email:snapshot['email'],
      username:snapshot['username'],
      bio:snapshot['bio'],
      profilePicUrl:snapshot['profilePicUrl'],
      followers:snapshot['followers'],
      following:snapshot['following'],
    );
  }
}
