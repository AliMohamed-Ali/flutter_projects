import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: "Free",
              textSize: 18,
              textWight: FontWeight.w600,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri url = Uri.parse(bookModel.volumeInfo.infoLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
              text: getText(bookModel),
              textSize: 16,
              textColor: Colors.white,
              backgroundColor: Colors.orange,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink == null){
      return "Not Avaliable";
    }else{
      return "Preview";
    }
  }
}
