import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Colors
const kDarkGrey = Colors.black45;

//Text styles

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 25,
  color: kDarkGrey,
);

const kBodyTitleTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.black87,
);

const kHightlightTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.black87,
  fontWeight: FontWeight.w700,
);

const kHighlightTitleTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 2.0,
      color: Color.fromRGBO(255, 0, 0, 0),
    )
  ],
);

const kHightlightInfoTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white70,
  fontWeight: FontWeight.w500,
);

const kNewsCardTitle = TextStyle(
  fontSize: 18,
  color: Colors.black87,
  fontWeight: FontWeight.w700,
);

const KNewsCardSnippet = TextStyle(
  fontSize: 14,
  color: Colors.black38,
);
const kNewsCardDate = TextStyle(
  fontSize: 14,
  color: Colors.black38,
);

const kMoreButton = TextStyle(
  fontSize: 10,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
