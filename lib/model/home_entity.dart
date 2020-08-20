import 'package:flutter_games/generated/json/base/json_convert_content.dart';

class HomeEntity with JsonConvert<HomeEntity> {
	List<HomeIssueList> issueList;
	String nextPageUrl;
	int nextPublishTime;
	String newestIssueType;
	dynamic dialog;
}

class HomeIssueList with JsonConvert<HomeIssueList> {
	int releaseTime;
	String type;
	int date;
	int publishTime;
	List<HomeIssueListItemList> itemList;
	int count;
}

class HomeIssueListItemList with JsonConvert<HomeIssueListItemList> {
	String type;
	HomeIssueListItemListData data;
	dynamic tag;
	int id;
	int adIndex;
}

class HomeIssueListItemListData with JsonConvert<HomeIssueListItemListData> {
	String dataType;
	int id;
	String title;
	String description;
	String image;
	String actionUrl;
	dynamic adTrack;
	bool shade;
	dynamic label;
	dynamic labelList;
	dynamic header;
	bool autoPlay;
}
