import 'package:flutter_games/generated/json/base/json_convert_content.dart';
import 'package:flutter_games/generated/json/base/json_field.dart';

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
	List<HomeItemEntity> itemList;
	int count;
}


class HomeItemEntity with JsonConvert<HomeItemEntity> {
	String type;
	HomeItemData data;
	dynamic tag;
	int id;
	int adIndex;
}

class HomeItemData with JsonConvert<HomeItemData> {
	String dataType;
	int id;
	String title;
	String description;
	@JSONField(name: "library")
	String xLibrary;
	List<HomeItemDataTag> tags;
	HomeItemDataConsumption consumption;
	String resourceType;
	dynamic slogan;
	HomeItemDataProvider provider;
	String category;
	HomeItemDataAuthor author;
	HomeItemDataCover cover;
	String playUrl;
	dynamic thumbPlayUrl;
	int duration;
	HomeItemDataWebUrl webUrl;
	int releaseTime;
	List<dynamic> playInfo;
	dynamic campaign;
	dynamic waterMarks;
	bool ad;
	List<dynamic> adTrack;
	String type;
	dynamic titlePgc;
	dynamic descriptionPgc;
	String remark;
	bool ifLimitVideo;
	int searchWeight;
	dynamic brandWebsiteInfo;
	dynamic videoPosterBean;
	int idx;
	dynamic shareAdTrack;
	dynamic favoriteAdTrack;
	dynamic webAdTrack;
	int date;
	dynamic promotion;
	dynamic label;
	List<dynamic> labelList;
	String descriptionEditor;
	bool collected;
	bool reallyCollected;
	bool played;
	List<dynamic> subtitles;
	dynamic lastViewTime;
	dynamic playlists;
	dynamic src;
	dynamic recallSource;
}

class HomeItemDataTag with JsonConvert<HomeItemDataTag> {
	int id;
	String name;
	String actionUrl;
	dynamic adTrack;
	String desc;
	String bgPicture;
	String headerImage;
	String tagRecType;
	dynamic childTagList;
	dynamic childTagIdList;
	bool haveReward;
	bool ifNewest;
	dynamic newestEndTime;
	int communityIndex;
}

class HomeItemDataConsumption with JsonConvert<HomeItemDataConsumption> {
	int collectionCount;
	int shareCount;
	int replyCount;
	int realCollectionCount;
}

class HomeItemDataProvider with JsonConvert<HomeItemDataProvider> {
	String name;
	String alias;
	String icon;
}

class HomeItemDataAuthor with JsonConvert<HomeItemDataAuthor> {
	int id;
	String icon;
	String name;
	String description;
	String link;
	int latestReleaseTime;
	int videoNum;
	dynamic adTrack;
	HomeItemDataAuthorFollow follow;
	HomeItemDataAuthorShield shield;
	int approvedNotReadyVideoCount;
	bool ifPgc;
	int recSort;
	bool expert;
}

class HomeItemDataAuthorFollow with JsonConvert<HomeItemDataAuthorFollow> {
	String itemType;
	int itemId;
	bool followed;
}

class HomeItemDataAuthorShield with JsonConvert<HomeItemDataAuthorShield> {
	String itemType;
	int itemId;
	bool shielded;
}

class HomeItemDataCover with JsonConvert<HomeItemDataCover> {
	String feed;
	String detail;
	String blurred;
	dynamic sharing;
	String homepage;
}

class HomeItemDataWebUrl with JsonConvert<HomeItemDataWebUrl> {
	String raw;
	String forWeibo;
}
