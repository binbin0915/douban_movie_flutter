import 'package:douban_movie_flutter/model/movie_item_vo.dart';
import 'package:douban_movie_flutter/model/new_movie_vo.dart';
import 'package:douban_movie_flutter/model/usbox_movie_list_vo.dart';
import 'package:douban_movie_flutter/model/weekly_movie_list_vo.dart';
import 'package:douban_movie_flutter/provider/view_state_refresh_list_provider.dart';
import 'package:douban_movie_flutter/service/net/douban_movie_repository.dart';
import 'package:douban_movie_flutter/service/router_manager.dart';
import 'package:flutter/src/widgets/framework.dart';

class BillboardProvider extends ViewStateRefreshListProvider {

  List<MovieItemVo> top250MovieItemVos;

  BillboardBannerEntity weeklyBannerEntity;
  BillboardBannerEntity newMovieBannerEntity;
  BillboardBannerEntity usboxBannerEntity;

  BillboardProvider(BuildContext context) : super(context);

  @override
  Future<List> loadData({Object arguments, int pageSize, int pageNum}) async {
    List<Future> futures = [];
    futures.add(DouBanMovieRepository.getTop250MovieItemList());
    futures.add(DouBanMovieRepository.getWeeklyMovieVo());
    futures.add(DouBanMovieRepository.getNewMovieVo());
    futures.add(DouBanMovieRepository.getUsBoxMovieVo());

    var result = await Future.wait(futures);
    top250MovieItemVos = result[0];
    WeeklyMovieListVo weeklyMovieVo = result[1];
    NewMovieVo newMovieVo = result[2];
    UsBoxMovieListVo usboxMovieVo = result[3];

    var weeklyMovieItemVos = <MovieItemVo>[];
    weeklyMovieVo.weeklyMovieItems.forEach((it) {
      weeklyMovieItemVos.add(it.movieItemVo);
    });
    var usboxMovieItemVos = <MovieItemVo>[];
    usboxMovieVo.usboxMovieItems.forEach((it) {
      usboxMovieItemVos.add(it.movieItemVo);
    });

    weeklyBannerEntity = BillboardBannerEntity(
        title: weeklyMovieVo.title,
        movieItemVos: weeklyMovieItemVos,
        routerName: RouteName.billboardWeeklyPage);

    newMovieBannerEntity = BillboardBannerEntity(
        title: usboxMovieVo.title,
        movieItemVos: newMovieVo.movieItems,
        routerName: RouteName.billboardUsBoxPage);

    usboxBannerEntity = BillboardBannerEntity(
        title: newMovieVo.title,
        movieItemVos: usboxMovieItemVos,
        routerName: RouteName.billboardNewMoviesPage);

    return result[0];
  }

}

class BillboardBannerEntity {
  final String title;
  final List<MovieItemVo> movieItemVos;
  final String routerName;

  BillboardBannerEntity({this.title, this.movieItemVos, this.routerName});
}