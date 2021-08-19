import 'package:mvp_flutter_with_rest/data/homeModel.dart';
import 'package:mvp_flutter_with_rest/data/networkfetch.dart';

class Injector{
  static final Injector _singleton = Injector._internal();

  factory Injector(){
    return _singleton;
  }

  Injector._internal();

  HomeFetchData get homefetchData => NetworkFetch();
}