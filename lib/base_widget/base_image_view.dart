// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meter_reading_app/base_widget/base_custom_cache_manager.dart';

class BaseImageView extends ConsumerWidget {
  ///[url] is required parameter for fetching network image
  final String? url;

  ///[imagePath] is required parameter for showing png,jpg,etc image
  final String? imagePath;

  ///[svgPath] is required parameter for showing svg image
  final String? svgPath;

  ///[file] is required parameter for fetching image file
  final File? file;

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;

  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final bool useOldImageOnUrlChange;

  final String? cacheKey;

  ///a [BaseImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  const BaseImageView({
    super.key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/img_not_found.png',
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.useOldImageOnUrlChange = true,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(ref),
          )
        : _buildWidget(ref);
  }

  Widget _buildWidget(WidgetRef ref) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(ref),
      ),
    );
  }

  ///build the image with border radius
  Widget _buildCircleImage(WidgetRef ref) {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius!,
        child: _buildImageWithBorder(ref),
      );
    } else {
      return _buildImageWithBorder(ref);
    }
  }

  ///build the image with border and border radius style
  Widget _buildImageWithBorder(WidgetRef ref) {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(ref),
      );
    } else {
      return _buildImageView(ref);
    }
  }

  Widget _buildImageView(WidgetRef ref) {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          color: color,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        cacheKey: cacheKey,
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        cacheManager: ref.read(defaultCacheManagerProvider),
        maxWidthDiskCache: maxWidthDiskCache ?? 1000,
        maxHeightDiskCache: maxHeightDiskCache ?? 1000,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        placeholder: (context, url) => SizedBox(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }

    return Image.asset(
      placeHolder,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
    // return const SizedBox();
  }
}
