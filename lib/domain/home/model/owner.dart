import 'package:flutter/foundation.dart';
import 'package:github_stars/data/home/model/owner_api.dart';
import 'package:github_stars/data/home/model/repo_api.dart';
import 'package:github_stars/domain/home/model/repo.dart';

class Owner {
  Owner(
      {this.login,
      this.email,
      this.url,
      this.avatarUrl,
      this.location,
      this.bio,
      this.starredRepos});

  factory Owner.fromApi(OwnerApi api) {
    return Owner(
        login: api.login,
        email: api.email,
        url: api.url,
        avatarUrl: api.avatarUrl,
        location: api.location,
        bio: api.bio,
        starredRepos:
            (api.starredRepos).map((RepoApi repoApi) => Repo.fromApi(repoApi)).toList());
  }

  final String login;
  final String email;
  final String url;
  final String avatarUrl;
  final String location;
  final String bio;
  final List<Repo> starredRepos;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          email == other.email &&
          url == other.url &&
          avatarUrl == other.avatarUrl &&
          location == other.location &&
          bio == other.bio &&
          listEquals(starredRepos, other.starredRepos);

  @override
  int get hashCode =>
      login.hashCode ^
      email.hashCode ^
      url.hashCode ^
      avatarUrl.hashCode ^
      location.hashCode ^
      bio.hashCode ^
      starredRepos.hashCode;
}
