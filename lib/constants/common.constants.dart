// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

const CIRCLE_RADIUS = 50.0;
const KAKAO_NATIVE_APP_KEY = "fc7ff62469909fc60350045b7bc1178e"; //real
const KAKAO_NATIVE_APP_KEY2 = "7d87ad463053b80008264d1eb03665b1"; //real

const NO_CATEGORY_TEXT = "없음";
final MAP_INITIAL_CENTER_LOCATION = LatLng(37.5547125, 126.9707878);
const ZOOM_FOR_SHOW_MARKER_NAME = 13;

var POPUP_MENU_ITEMS = [
  PopupMenuItem(
      value: "edit",
      child: TextButton.icon(
        icon: const Icon(
          Icons.edit,
          color: Colors.black54,
        ),
        label: const Text(
          "편집",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: null,
      )),
  PopupMenuItem(
      value: "share",
      child: TextButton.icon(
        icon: const Icon(
          Icons.share,
          color: Colors.black54,
        ),
        label: const Text(
          "공유",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: null,
      )),
  PopupMenuItem(
      value: "delete",
      child: TextButton.icon(
        icon: const Icon(
          Icons.delete,
          color: Colors.black54,
        ),
        label: const Text(
          "삭제",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: null,
      ))
];

var POPUP_MENU_ITEMS_OTHERS = [
  PopupMenuItem(
      value: "share",
      child: TextButton.icon(
        icon: const Icon(
          Icons.share,
          color: Colors.black54,
        ),
        label: const Text(
          "공유",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: null,
      )),
];

var RESION_LIST_MENU = ListView(
  padding: EdgeInsets.zero,
  children: <Widget>[
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('강남'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('강북'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('관악'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('광진'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('동작'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('서초'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('성북'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('양천'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('영등포'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('종로'),
      onTap: () {
        print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.home,
        color: Colors.grey[850],
      ),
      title: Text('중구'),
      onTap: () {

      },
    ),
  ],
);

const FOOD_DATAs = [
  {
  "name":"Burger",
  "brand":"Hawkers",
  "price":2.99
  },{
  "name":"Cheese Dip",
  "brand":"Hawkers",
  "price":4.99
  },
  {
  "name":"Cola",
  "brand":"Mcdonald",
  "price":1.49
  },
  {
  "name":"Fries",
  "brand":"Mcdonald",
  "price":2.99
  },
  {
  "name":"Ice Cream",
  "brand":"Ben & Jerry's",
  "price":9.49
  },
  {
  "name":"Noodles",
  "brand":"Hawkers",
  "price":4.49
  },
  {
  "name":"Pizza",
  "brand":"Dominos",
  "price":17.99
  },
  {
  "name":"Sandwich",
  "brand":"Hawkers",
  "price":2.99
  },
  {
  "name":"Wrap",
  "brand":"Subway",
  "price":6.99
  }
];