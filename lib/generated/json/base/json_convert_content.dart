// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:douban_movie_flutter/model/showing_movie.dart';
import 'package:douban_movie_flutter/generated/json/showing_movie_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {					case ShowingMovie:
			return showingMovieFromJson(data as ShowingMovie, json) as T;			case MovieSubject:
			return movieSubjectFromJson(data as MovieSubject, json) as T;			case MovieSubjectsRating:
			return movieSubjectsRatingFromJson(data as MovieSubjectsRating, json) as T;			case MovieSubjectsRatingDetails:
			return movieSubjectsRatingDetailsFromJson(data as MovieSubjectsRatingDetails, json) as T;			case MovieSubjectsCast:
			return movieSubjectsCastFromJson(data as MovieSubjectsCast, json) as T;			case MovieSubjectsCastsAvatars:
			return movieSubjectsCastsAvatarsFromJson(data as MovieSubjectsCastsAvatars, json) as T;			case MovieSubjectsDirector:
			return movieSubjectsDirectorFromJson(data as MovieSubjectsDirector, json) as T;			case MovieSubjectsDirectorsAvatars:
			return movieSubjectsDirectorsAvatarsFromJson(data as MovieSubjectsDirectorsAvatars, json) as T;			case MovieSubjectsImages:
			return movieSubjectsImagesFromJson(data as MovieSubjectsImages, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {						case ShowingMovie:
			return showingMovieToJson(data as ShowingMovie);			case MovieSubject:
			return movieSubjectToJson(data as MovieSubject);			case MovieSubjectsRating:
			return movieSubjectsRatingToJson(data as MovieSubjectsRating);			case MovieSubjectsRatingDetails:
			return movieSubjectsRatingDetailsToJson(data as MovieSubjectsRatingDetails);			case MovieSubjectsCast:
			return movieSubjectsCastToJson(data as MovieSubjectsCast);			case MovieSubjectsCastsAvatars:
			return movieSubjectsCastsAvatarsToJson(data as MovieSubjectsCastsAvatars);			case MovieSubjectsDirector:
			return movieSubjectsDirectorToJson(data as MovieSubjectsDirector);			case MovieSubjectsDirectorsAvatars:
			return movieSubjectsDirectorsAvatarsToJson(data as MovieSubjectsDirectorsAvatars);			case MovieSubjectsImages:
			return movieSubjectsImagesToJson(data as MovieSubjectsImages);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {					case 'ShowingMovie':
			return ShowingMovie().fromJson(json);			case 'MovieSubject':
			return MovieSubject().fromJson(json);			case 'MovieSubjectsRating':
			return MovieSubjectsRating().fromJson(json);			case 'MovieSubjectsRatingDetails':
			return MovieSubjectsRatingDetails().fromJson(json);			case 'MovieSubjectsCast':
			return MovieSubjectsCast().fromJson(json);			case 'MovieSubjectsCastsAvatars':
			return MovieSubjectsCastsAvatars().fromJson(json);			case 'MovieSubjectsDirector':
			return MovieSubjectsDirector().fromJson(json);			case 'MovieSubjectsDirectorsAvatars':
			return MovieSubjectsDirectorsAvatars().fromJson(json);			case 'MovieSubjectsImages':
			return MovieSubjectsImages().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {				case 'ShowingMovie':
			return List<ShowingMovie>();			case 'MovieSubject':
			return List<MovieSubject>();			case 'MovieSubjectsRating':
			return List<MovieSubjectsRating>();			case 'MovieSubjectsRatingDetails':
			return List<MovieSubjectsRatingDetails>();			case 'MovieSubjectsCast':
			return List<MovieSubjectsCast>();			case 'MovieSubjectsCastsAvatars':
			return List<MovieSubjectsCastsAvatars>();			case 'MovieSubjectsDirector':
			return List<MovieSubjectsDirector>();			case 'MovieSubjectsDirectorsAvatars':
			return List<MovieSubjectsDirectorsAvatars>();			case 'MovieSubjectsImages':
			return List<MovieSubjectsImages>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}