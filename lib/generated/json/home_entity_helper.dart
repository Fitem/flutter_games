import 'package:flutter_games/model/home_entity.dart';

homeEntityFromJson(HomeEntity data, Map<String, dynamic> json) {
	if (json['issueList'] != null) {
		data.issueList = new List<HomeIssueList>();
		(json['issueList'] as List).forEach((v) {
			data.issueList.add(new HomeIssueList().fromJson(v));
		});
	}
	if (json['nextPageUrl'] != null) {
		data.nextPageUrl = json['nextPageUrl']?.toString();
	}
	if (json['nextPublishTime'] != null) {
		data.nextPublishTime = json['nextPublishTime']?.toInt();
	}
	if (json['newestIssueType'] != null) {
		data.newestIssueType = json['newestIssueType']?.toString();
	}
	if (json['dialog'] != null) {
		data.dialog = json['dialog'];
	}
	return data;
}

Map<String, dynamic> homeEntityToJson(HomeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.issueList != null) {
		data['issueList'] =  entity.issueList.map((v) => v.toJson()).toList();
	}
	data['nextPageUrl'] = entity.nextPageUrl;
	data['nextPublishTime'] = entity.nextPublishTime;
	data['newestIssueType'] = entity.newestIssueType;
	data['dialog'] = entity.dialog;
	return data;
}

homeIssueListFromJson(HomeIssueList data, Map<String, dynamic> json) {
	if (json['releaseTime'] != null) {
		data.releaseTime = json['releaseTime']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toInt();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['itemList'] != null) {
		data.itemList = new List<HomeItemEntity>();
		(json['itemList'] as List).forEach((v) {
			data.itemList.add(new HomeItemEntity().fromJson(v));
		});
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeIssueListToJson(HomeIssueList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['releaseTime'] = entity.releaseTime;
	data['type'] = entity.type;
	data['date'] = entity.date;
	data['publishTime'] = entity.publishTime;
	if (entity.itemList != null) {
		data['itemList'] =  entity.itemList.map((v) => v.toJson()).toList();
	}
	data['count'] = entity.count;
	return data;
}

homeItemEntityFromJson(HomeItemEntity data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['data'] != null) {
		data.data = new HomeItemData().fromJson(json['data']);
	}
	if (json['tag'] != null) {
		data.tag = json['tag'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['adIndex'] != null) {
		data.adIndex = json['adIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeItemEntityToJson(HomeItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['tag'] = entity.tag;
	data['id'] = entity.id;
	data['adIndex'] = entity.adIndex;
	return data;
}

homeItemDataFromJson(HomeItemData data, Map<String, dynamic> json) {
	if (json['dataType'] != null) {
		data.dataType = json['dataType']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['library'] != null) {
		data.xLibrary = json['library']?.toString();
	}
	if (json['tags'] != null) {
		data.tags = new List<HomeItemDataTag>();
		(json['tags'] as List).forEach((v) {
			data.tags.add(new HomeItemDataTag().fromJson(v));
		});
	}
	if (json['consumption'] != null) {
		data.consumption = new HomeItemDataConsumption().fromJson(json['consumption']);
	}
	if (json['resourceType'] != null) {
		data.resourceType = json['resourceType']?.toString();
	}
	if (json['slogan'] != null) {
		data.slogan = json['slogan'];
	}
	if (json['provider'] != null) {
		data.provider = new HomeItemDataProvider().fromJson(json['provider']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['author'] != null) {
		data.author = new HomeItemDataAuthor().fromJson(json['author']);
	}
	if (json['cover'] != null) {
		data.cover = new HomeItemDataCover().fromJson(json['cover']);
	}
	if (json['playUrl'] != null) {
		data.playUrl = json['playUrl']?.toString();
	}
	if (json['thumbPlayUrl'] != null) {
		data.thumbPlayUrl = json['thumbPlayUrl'];
	}
	if (json['duration'] != null) {
		data.duration = json['duration']?.toInt();
	}
	if (json['webUrl'] != null) {
		data.webUrl = new HomeItemDataWebUrl().fromJson(json['webUrl']);
	}
	if (json['releaseTime'] != null) {
		data.releaseTime = json['releaseTime']?.toInt();
	}
	if (json['playInfo'] != null) {
		data.playInfo = new List<dynamic>();
		data.playInfo.addAll(json['playInfo']);
	}
	if (json['campaign'] != null) {
		data.campaign = json['campaign'];
	}
	if (json['waterMarks'] != null) {
		data.waterMarks = json['waterMarks'];
	}
	if (json['ad'] != null) {
		data.ad = json['ad'];
	}
	if (json['adTrack'] != null) {
		data.adTrack = new List<dynamic>();
		data.adTrack.addAll(json['adTrack']);
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['titlePgc'] != null) {
		data.titlePgc = json['titlePgc'];
	}
	if (json['descriptionPgc'] != null) {
		data.descriptionPgc = json['descriptionPgc'];
	}
	if (json['remark'] != null) {
		data.remark = json['remark']?.toString();
	}
	if (json['ifLimitVideo'] != null) {
		data.ifLimitVideo = json['ifLimitVideo'];
	}
	if (json['searchWeight'] != null) {
		data.searchWeight = json['searchWeight']?.toInt();
	}
	if (json['brandWebsiteInfo'] != null) {
		data.brandWebsiteInfo = json['brandWebsiteInfo'];
	}
	if (json['videoPosterBean'] != null) {
		data.videoPosterBean = json['videoPosterBean'];
	}
	if (json['idx'] != null) {
		data.idx = json['idx']?.toInt();
	}
	if (json['shareAdTrack'] != null) {
		data.shareAdTrack = json['shareAdTrack'];
	}
	if (json['favoriteAdTrack'] != null) {
		data.favoriteAdTrack = json['favoriteAdTrack'];
	}
	if (json['webAdTrack'] != null) {
		data.webAdTrack = json['webAdTrack'];
	}
	if (json['date'] != null) {
		data.date = json['date']?.toInt();
	}
	if (json['promotion'] != null) {
		data.promotion = json['promotion'];
	}
	if (json['label'] != null) {
		data.label = json['label'];
	}
	if (json['labelList'] != null) {
		data.labelList = new List<dynamic>();
		data.labelList.addAll(json['labelList']);
	}
	if (json['descriptionEditor'] != null) {
		data.descriptionEditor = json['descriptionEditor']?.toString();
	}
	if (json['collected'] != null) {
		data.collected = json['collected'];
	}
	if (json['reallyCollected'] != null) {
		data.reallyCollected = json['reallyCollected'];
	}
	if (json['played'] != null) {
		data.played = json['played'];
	}
	if (json['subtitles'] != null) {
		data.subtitles = new List<dynamic>();
		data.subtitles.addAll(json['subtitles']);
	}
	if (json['lastViewTime'] != null) {
		data.lastViewTime = json['lastViewTime'];
	}
	if (json['playlists'] != null) {
		data.playlists = json['playlists'];
	}
	if (json['src'] != null) {
		data.src = json['src'];
	}
	if (json['recallSource'] != null) {
		data.recallSource = json['recallSource'];
	}
	return data;
}

Map<String, dynamic> homeItemDataToJson(HomeItemData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dataType'] = entity.dataType;
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['library'] = entity.xLibrary;
	if (entity.tags != null) {
		data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	}
	if (entity.consumption != null) {
		data['consumption'] = entity.consumption.toJson();
	}
	data['resourceType'] = entity.resourceType;
	data['slogan'] = entity.slogan;
	if (entity.provider != null) {
		data['provider'] = entity.provider.toJson();
	}
	data['category'] = entity.category;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	if (entity.cover != null) {
		data['cover'] = entity.cover.toJson();
	}
	data['playUrl'] = entity.playUrl;
	data['thumbPlayUrl'] = entity.thumbPlayUrl;
	data['duration'] = entity.duration;
	if (entity.webUrl != null) {
		data['webUrl'] = entity.webUrl.toJson();
	}
	data['releaseTime'] = entity.releaseTime;
	if (entity.playInfo != null) {
		data['playInfo'] =  [];
	}
	data['campaign'] = entity.campaign;
	data['waterMarks'] = entity.waterMarks;
	data['ad'] = entity.ad;
	if (entity.adTrack != null) {
		data['adTrack'] =  [];
	}
	data['type'] = entity.type;
	data['titlePgc'] = entity.titlePgc;
	data['descriptionPgc'] = entity.descriptionPgc;
	data['remark'] = entity.remark;
	data['ifLimitVideo'] = entity.ifLimitVideo;
	data['searchWeight'] = entity.searchWeight;
	data['brandWebsiteInfo'] = entity.brandWebsiteInfo;
	data['videoPosterBean'] = entity.videoPosterBean;
	data['idx'] = entity.idx;
	data['shareAdTrack'] = entity.shareAdTrack;
	data['favoriteAdTrack'] = entity.favoriteAdTrack;
	data['webAdTrack'] = entity.webAdTrack;
	data['date'] = entity.date;
	data['promotion'] = entity.promotion;
	data['label'] = entity.label;
	if (entity.labelList != null) {
		data['labelList'] =  [];
	}
	data['descriptionEditor'] = entity.descriptionEditor;
	data['collected'] = entity.collected;
	data['reallyCollected'] = entity.reallyCollected;
	data['played'] = entity.played;
	if (entity.subtitles != null) {
		data['subtitles'] =  [];
	}
	data['lastViewTime'] = entity.lastViewTime;
	data['playlists'] = entity.playlists;
	data['src'] = entity.src;
	data['recallSource'] = entity.recallSource;
	return data;
}

homeItemDataTagFromJson(HomeItemDataTag data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['actionUrl'] != null) {
		data.actionUrl = json['actionUrl']?.toString();
	}
	if (json['adTrack'] != null) {
		data.adTrack = json['adTrack'];
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['bgPicture'] != null) {
		data.bgPicture = json['bgPicture']?.toString();
	}
	if (json['headerImage'] != null) {
		data.headerImage = json['headerImage']?.toString();
	}
	if (json['tagRecType'] != null) {
		data.tagRecType = json['tagRecType']?.toString();
	}
	if (json['childTagList'] != null) {
		data.childTagList = json['childTagList'];
	}
	if (json['childTagIdList'] != null) {
		data.childTagIdList = json['childTagIdList'];
	}
	if (json['haveReward'] != null) {
		data.haveReward = json['haveReward'];
	}
	if (json['ifNewest'] != null) {
		data.ifNewest = json['ifNewest'];
	}
	if (json['newestEndTime'] != null) {
		data.newestEndTime = json['newestEndTime'];
	}
	if (json['communityIndex'] != null) {
		data.communityIndex = json['communityIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeItemDataTagToJson(HomeItemDataTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['actionUrl'] = entity.actionUrl;
	data['adTrack'] = entity.adTrack;
	data['desc'] = entity.desc;
	data['bgPicture'] = entity.bgPicture;
	data['headerImage'] = entity.headerImage;
	data['tagRecType'] = entity.tagRecType;
	data['childTagList'] = entity.childTagList;
	data['childTagIdList'] = entity.childTagIdList;
	data['haveReward'] = entity.haveReward;
	data['ifNewest'] = entity.ifNewest;
	data['newestEndTime'] = entity.newestEndTime;
	data['communityIndex'] = entity.communityIndex;
	return data;
}

homeItemDataConsumptionFromJson(HomeItemDataConsumption data, Map<String, dynamic> json) {
	if (json['collectionCount'] != null) {
		data.collectionCount = json['collectionCount']?.toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount']?.toInt();
	}
	if (json['replyCount'] != null) {
		data.replyCount = json['replyCount']?.toInt();
	}
	if (json['realCollectionCount'] != null) {
		data.realCollectionCount = json['realCollectionCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeItemDataConsumptionToJson(HomeItemDataConsumption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['collectionCount'] = entity.collectionCount;
	data['shareCount'] = entity.shareCount;
	data['replyCount'] = entity.replyCount;
	data['realCollectionCount'] = entity.realCollectionCount;
	return data;
}

homeItemDataProviderFromJson(HomeItemDataProvider data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alias'] != null) {
		data.alias = json['alias']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	return data;
}

Map<String, dynamic> homeItemDataProviderToJson(HomeItemDataProvider entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['alias'] = entity.alias;
	data['icon'] = entity.icon;
	return data;
}

homeItemDataAuthorFromJson(HomeItemDataAuthor data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['link'] != null) {
		data.link = json['link']?.toString();
	}
	if (json['latestReleaseTime'] != null) {
		data.latestReleaseTime = json['latestReleaseTime']?.toInt();
	}
	if (json['videoNum'] != null) {
		data.videoNum = json['videoNum']?.toInt();
	}
	if (json['adTrack'] != null) {
		data.adTrack = json['adTrack'];
	}
	if (json['follow'] != null) {
		data.follow = new HomeItemDataAuthorFollow().fromJson(json['follow']);
	}
	if (json['shield'] != null) {
		data.shield = new HomeItemDataAuthorShield().fromJson(json['shield']);
	}
	if (json['approvedNotReadyVideoCount'] != null) {
		data.approvedNotReadyVideoCount = json['approvedNotReadyVideoCount']?.toInt();
	}
	if (json['ifPgc'] != null) {
		data.ifPgc = json['ifPgc'];
	}
	if (json['recSort'] != null) {
		data.recSort = json['recSort']?.toInt();
	}
	if (json['expert'] != null) {
		data.expert = json['expert'];
	}
	return data;
}

Map<String, dynamic> homeItemDataAuthorToJson(HomeItemDataAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['link'] = entity.link;
	data['latestReleaseTime'] = entity.latestReleaseTime;
	data['videoNum'] = entity.videoNum;
	data['adTrack'] = entity.adTrack;
	if (entity.follow != null) {
		data['follow'] = entity.follow.toJson();
	}
	if (entity.shield != null) {
		data['shield'] = entity.shield.toJson();
	}
	data['approvedNotReadyVideoCount'] = entity.approvedNotReadyVideoCount;
	data['ifPgc'] = entity.ifPgc;
	data['recSort'] = entity.recSort;
	data['expert'] = entity.expert;
	return data;
}

homeItemDataAuthorFollowFromJson(HomeItemDataAuthorFollow data, Map<String, dynamic> json) {
	if (json['itemType'] != null) {
		data.itemType = json['itemType']?.toString();
	}
	if (json['itemId'] != null) {
		data.itemId = json['itemId']?.toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	return data;
}

Map<String, dynamic> homeItemDataAuthorFollowToJson(HomeItemDataAuthorFollow entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemType'] = entity.itemType;
	data['itemId'] = entity.itemId;
	data['followed'] = entity.followed;
	return data;
}

homeItemDataAuthorShieldFromJson(HomeItemDataAuthorShield data, Map<String, dynamic> json) {
	if (json['itemType'] != null) {
		data.itemType = json['itemType']?.toString();
	}
	if (json['itemId'] != null) {
		data.itemId = json['itemId']?.toInt();
	}
	if (json['shielded'] != null) {
		data.shielded = json['shielded'];
	}
	return data;
}

Map<String, dynamic> homeItemDataAuthorShieldToJson(HomeItemDataAuthorShield entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemType'] = entity.itemType;
	data['itemId'] = entity.itemId;
	data['shielded'] = entity.shielded;
	return data;
}

homeItemDataCoverFromJson(HomeItemDataCover data, Map<String, dynamic> json) {
	if (json['feed'] != null) {
		data.feed = json['feed']?.toString();
	}
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	if (json['blurred'] != null) {
		data.blurred = json['blurred']?.toString();
	}
	if (json['sharing'] != null) {
		data.sharing = json['sharing'];
	}
	if (json['homepage'] != null) {
		data.homepage = json['homepage']?.toString();
	}
	return data;
}

Map<String, dynamic> homeItemDataCoverToJson(HomeItemDataCover entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['feed'] = entity.feed;
	data['detail'] = entity.detail;
	data['blurred'] = entity.blurred;
	data['sharing'] = entity.sharing;
	data['homepage'] = entity.homepage;
	return data;
}

homeItemDataWebUrlFromJson(HomeItemDataWebUrl data, Map<String, dynamic> json) {
	if (json['raw'] != null) {
		data.raw = json['raw']?.toString();
	}
	if (json['forWeibo'] != null) {
		data.forWeibo = json['forWeibo']?.toString();
	}
	return data;
}

Map<String, dynamic> homeItemDataWebUrlToJson(HomeItemDataWebUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['raw'] = entity.raw;
	data['forWeibo'] = entity.forWeibo;
	return data;
}


