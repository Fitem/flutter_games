class HomeBean {
  List<Issue> issueList;
  String nextPageUrl;
  BigInt nextPublishTime;
  String newestIssueType;
  var dialog;

  HomeBean(this.issueList, this.nextPageUrl, this.nextPublishTime, this.newestIssueType, this.dialog);
}

class Issue {
  BigInt releaseTime;
  String type;
  BigInt date;
  int total;
  BigInt publishTime;
  List<Item> itemList;
  int count;
  String nextPageUrl;
}

class Item {
  String type;
  Data data;
  String tag;
  int itemType;
  List itemList;
}

class Data {
  String dataType;
  String text;
  String videoTitle;
  BigInt id;
  String title;
  String slogan;
  String description;
  String actionUrl;
  Provider provider;
  String category;
  ParentReply parentReply;
  Author author;
  Cover cover;
  int likeCount;
  String playUrl;
  String thumbPlayUrl;
  BigInt duration;
  String message;
  BigInt createTime;
  WebUrl webUrl;
  String library;
  User user;
  List<PlayInfo> playInfo;
  Consumption consumption;
  var campaign;
  var waterMarks;
  var adTrack;
  List<Tag> tags;
  String type;
  var titlePgc;
  var descriptionPgc;
  String remark;
  int idx;
  var shareAdTrack;
  var favoriteAdTrack;
  var webAdTrack;
  BigInt date;
  var promotion;
  var label;
  var labelList;
  String descriptionEditor;
  bool collected;
  bool played;
  var subtitles;
  var lastViewTime;
  var playlists;
  Header header;
  List<Item> itemList;
}

class Tag {
  int id;
  String name;
  String actionUrl;
  var adTrack;
}

class Author {
  String icon;
  String name;
  String description;
}

class Provider {
  String name;
  String alias;
  String icon;
}

class Cover {
  String feed;
  String detail;
  String blurred;
  String sharing;
  String homepage;
}

class WebUrl {
  String raw;
  String forWeibo;
}

class PlayInfo {
  String name;
  String url;
  String type;
  List<Url> urlList;
}

class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
}

class User {
  BigInt uid;
  String nickname;
  String avatar;
  String userType;
  bool ifPgc;
}

class ParentReply {
  User user;
  String message;
}

class Url{
  BigInt size;
}

class Header {
  int id;
  String icon;
  String iconType;
  String description;
  String title;
  String font;
  String cover;
  Label label;
  String actionUrl;
  String subtitle;
  List<Label> labelList;
}

class Label {
  String text;
  String card;
  var detial;
  var actionUrl;
}
