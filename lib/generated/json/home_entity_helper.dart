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
		data.itemList = new List<HomeIssueListItemList>();
		(json['itemList'] as List).forEach((v) {
			data.itemList.add(new HomeIssueListItemList().fromJson(v));
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

homeIssueListItemListFromJson(HomeIssueListItemList data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['data'] != null) {
		data.data = new HomeIssueListItemListData().fromJson(json['data']);
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

Map<String, dynamic> homeIssueListItemListToJson(HomeIssueListItemList entity) {
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

homeIssueListItemListDataFromJson(HomeIssueListItemListData data, Map<String, dynamic> json) {
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
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['actionUrl'] != null) {
		data.actionUrl = json['actionUrl']?.toString();
	}
	if (json['adTrack'] != null) {
		data.adTrack = json['adTrack'];
	}
	if (json['shade'] != null) {
		data.shade = json['shade'];
	}
	if (json['label'] != null) {
		data.label = json['label'];
	}
	if (json['labelList'] != null) {
		data.labelList = json['labelList'];
	}
	if (json['header'] != null) {
		data.header = json['header'];
	}
	if (json['autoPlay'] != null) {
		data.autoPlay = json['autoPlay'];
	}
	return data;
}

Map<String, dynamic> homeIssueListItemListDataToJson(HomeIssueListItemListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dataType'] = entity.dataType;
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['image'] = entity.image;
	data['actionUrl'] = entity.actionUrl;
	data['adTrack'] = entity.adTrack;
	data['shade'] = entity.shade;
	data['label'] = entity.label;
	data['labelList'] = entity.labelList;
	data['header'] = entity.header;
	data['autoPlay'] = entity.autoPlay;
	return data;
}