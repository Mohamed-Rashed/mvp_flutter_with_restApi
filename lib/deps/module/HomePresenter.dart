import 'package:mvp_flutter_with_rest/data/FetchDataException.dart';
import 'package:mvp_flutter_with_rest/data/homeModel.dart';
import 'package:mvp_flutter_with_rest/deps/di.dart';

abstract class HomeListView{
  void onSuccess(List<HomeModel> items);
  void onError(FetchDataException e);
}


class HomePresenter {
  late HomeListView _view;
  late HomeFetchData _repository;

  HomePresenter(this._view) {
    _repository = new Injector().homefetchData;
  }

  void loadHotels() {
    _repository
        .fetchHome()
        .then((data) => _view.onSuccess(data))
        .catchError((e) => _view.onError(new FetchDataException(e.toString())));
  }
}