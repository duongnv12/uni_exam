import 'package:flutter/cupertino.dart';

class CardListTile extends StatelessWidget {
  final Widget title;
  final VoidCallback? onTap;

  CardListTile({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: CupertinoListTile(
          title: title,
          onTap: onTap,
        ),
      ),
    );
  }
}