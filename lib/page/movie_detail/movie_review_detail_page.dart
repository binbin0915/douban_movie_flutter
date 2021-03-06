import 'package:douban_movie_flutter/i10n/localization_intl.dart';
import 'package:douban_movie_flutter/model/reviews_vo.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/cache_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/**
 * 电影影评详情页
 */
class MovieReviewDetailPage extends StatefulWidget {
  ReviewsVo reviewsVo;

  MovieReviewDetailPage(this.reviewsVo, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieReviewDetailState();
  }
}

class _MovieReviewDetailState extends State<MovieReviewDetailPage> {
  ScrollController _scrollController;
  int _offsetLimit;
  bool _offstageAutorInfo;
  bool _offstageTitle;

  _MovieReviewDetailState();

  @override
  void initState() {
    super.initState();
    _offsetLimit = 110;
    _offstageAutorInfo = true;
    _offstageTitle = false;
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > _offsetLimit) {
        if (_offstageAutorInfo) {
          _offstageAutorInfo = false;
          _offstageTitle = true;
          setState(() {});
        }
      } else {
        if (!_offstageAutorInfo) {
          _offstageAutorInfo = true;
          _offstageTitle = false;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color:ThemeHelper.wrapDarkColor(context, Colors.black87)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: ThemeHelper.wrapDarkBackgroundColor(context, Colors.white),
          brightness: Brightness.light,
          elevation: 1,
          title: Stack(
            children: <Widget>[
              Offstage(
                offstage: _offstageTitle,
                child: Text(
                  DouBanLocalizations.of(context).reviews_detail,
                  style: TextStyle(
                      color: ThemeHelper.wrapDarkColor(context, Colors.black87),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Offstage(
                offstage: _offstageAutorInfo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CacheImageWidget(
                          url: widget.reviewsVo.author.avatar,
                          radius: 15,
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          widget.reviewsVo.author.name,
                          style: TextStyle(
                              color: ThemeHelper.wrapDarkColor(context, Colors.black87),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 92,
                      height: 30,
                      margin: EdgeInsets.only(right: 10),
                      child: RaisedButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: ThemeHelper.wrapDarkColor(context, Colors.white),
                          size: 14,
                        ),
                        label: Text(
                          DouBanLocalizations.of(context).follow,
                          style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.white), fontSize: 14),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          showToast("${DouBanLocalizations.of(context).follow}${widget.reviewsVo.author.name}",
                              context: context);
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
      body: Container(
        color: ThemeHelper.wrapDarkBackgroundColor(context, Colors.white),
        height: ScreenUtil.height,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.reviewsVo.title,
                style: TextStyle(
                    color: ThemeHelper.wrapDarkColor(context, Colors.black87),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  CacheImageWidget(
                    url: widget.reviewsVo.author.avatar,
                    radius: 20,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.reviewsVo.author.name}${DouBanLocalizations.of(context).somebody_reviews}',
                        style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black45), fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.reviewsVo.createdAt}',
                        style: TextStyle(color:ThemeHelper.wrapDarkColor(context, Colors.black87), fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.reviewsVo.content,
                style: TextStyle(color: ThemeHelper.wrapDarkColor(context, Colors.black54), fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
