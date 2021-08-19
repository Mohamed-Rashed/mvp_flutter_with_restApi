
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvp_flutter_with_rest/data/FetchDataException.dart';
import 'package:mvp_flutter_with_rest/data/homeModel.dart';
import 'package:mvp_flutter_with_rest/deps/module/HomePresenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeListView {
  late HomePresenter _presenter;
  late List<HomeModel> _home;
  late bool _isLoading;

  _HomePageState() {
    _presenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadHotels();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hotel App'),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _isLoading
          ? new Center(
        child: new CircularProgressIndicator(),
      )
          : _hotelWidget(),
    );
  }

  Widget _hotelWidget() {
    return new Container(
      child: new Padding(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final HomeModel hotel = _home[index];
                  return _getCardItemUi(context, hotel);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCardItemUi(BuildContext context, HomeModel hotel) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: new Text(
                hotel.title
              ),
            ),
            subtitle: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: new Text(
                  hotel.body,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
            isThreeLine: true,
            onTap: () {
              final snackBar =
              new SnackBar(content: new Text("Tap : ${hotel.title}"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
    );
  }

  @override
  void onError(FetchDataException e) {
    print(e.toString());
  }

  @override
  void onSuccess(List<HomeModel> items) {
    setState(() {
      _home = items;
      _isLoading = false;
    });
  }
}
