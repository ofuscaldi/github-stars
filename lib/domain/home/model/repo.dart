import 'package:github_stars/data/home/model/repo_api.dart';

class Repo {
  Repo({this.name, this.description, this.stars});

  factory Repo.fromApi(RepoApi api) {
    return Repo(name: api.name, description: api.description, stars: api.stars);
  }

  final String name;
  final String description;
  final int stars;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Repo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          stars == other.stars;

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ stars.hashCode;
}