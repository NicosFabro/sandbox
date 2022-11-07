import 'package:sandbox/src/instagram_profile/instagram_profile.dart';
import 'package:sandbox/src/paint/paint.dart';
import 'package:sandbox/src/models/page_model.dart';

const features = <String, PageModel>{
  InstagramProfileView.routeName: InstagramProfileView.pageModel,
  PaintPage.routeName: PaintPage.pageModel,
};
