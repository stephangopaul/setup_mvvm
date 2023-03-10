import 'package:flutter/material.dart';
import 'package:{{project_name}}/config/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  BannerConfig? bannerConfig;

  FlavorBanner({required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;

    bannerConfig ??= _getDefaultBanner();

    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance!.name,
        bannerColor: FlavorConfig.instance!.color);
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig!.bannerName,
            textDirection: TextDirection.ltr,
            layoutDirection: TextDirection.ltr,
            location: BannerLocation.topStart,
            color: bannerConfig!.bannerColor),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig(
      {required String this.bannerName, required Color this.bannerColor});
}
