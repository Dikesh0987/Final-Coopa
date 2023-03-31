import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/stores/screens/account_screen/constants/constants.dart';
import 'package:coopa/stores/screens/edit_account_details_screen/edit_account_details_screen.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailEditPage(store: widget.store)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    widget.store.images,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.store.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.store.about,
                    style: TextStyle(
                      fontSize: ksmallFontSize,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
