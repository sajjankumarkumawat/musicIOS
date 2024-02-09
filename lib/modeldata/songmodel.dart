class ModelData {
  int? view;
  String? profile;
  String? song;
  String? songImage;
  String? artist;
  String? background;

  ModelData(
      {this.view,
        this.profile,
        this.song,
        this.songImage,
        this.artist,
        this.background});

  ModelData.fromJson(Map<String, dynamic> json) {
    view = json['view'];
    profile = json['Profile'];
    song = json['song'];
    songImage = json['songImage'];
    artist = json['artist'];
    background = json['Background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view'] = this.view;
    data['Profile'] = this.profile;
    data['song'] = this.song;
    data['songImage'] = this.songImage;
    data['artist'] = this.artist;
    data['Background'] = this.background;
    return data;
  }
}
