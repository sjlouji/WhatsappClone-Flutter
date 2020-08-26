class Chat {
  final String name;
  final String message;
  final String time;
  final String userImage;
  final int noUnseenmsg;
  final String lastMesssageType;
  final bool seen;
  final bool recieved;

  Chat({this.name, this.message, this.time, this.userImage, this.noUnseenmsg, this.lastMesssageType, this.seen, this.recieved});
}