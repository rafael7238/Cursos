class Video {
  String id, titulo, image, canal, descricao;

  Video({this.id, this.titulo, this.image, this.canal,this.descricao});

/*
static converterJson(Map<String,dynamic> json){
  return Video(
    id: json["id"]["videoId"],
    titulo: json["snippet"]["title"],
    image: json["snippet"]["thumbnails"]["high"]["url"],
    canal: json["snippet"]["channelId"],
  );
}*/
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
      descricao: json["snippet"]["description"],
    );
  }
}