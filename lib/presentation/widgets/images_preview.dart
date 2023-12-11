import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagesPreview extends StatefulWidget {
  ImagesPreview({super.key,required this.galleryItems,required this.idex});
  final List<String> galleryItems;
  int idex;
  bool flag = false;
  late PageController controller;

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {


  @override
  void initState() {
    // TODO: implement initState
    widget.controller = PageController(initialPage: widget.idex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          enableRotation: true,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            if(widget.flag){
              widget.idex = index;
            }
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(widget.galleryItems[index]),
              initialScale: PhotoViewComputedScale.contained* 1,
              heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryItems[widget.idex]),
            );
          },
          itemCount: widget.galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / (event.expectedTotalBytes as double),
              ),
            ),
          ),
          backgroundDecoration: BoxDecoration(color: Colors.black),
          onPageChanged: (i){
            setState(() {
              widget.flag = true;
            });
          },
          pageController: widget.controller,
        )
    );
  }
}
