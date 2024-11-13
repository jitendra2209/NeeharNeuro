import 'package:flutter/material.dart';

late TabController _tabController;

class TabBuilder {
  Widget buildTab(String title, int tabIndex) {
    return DefaultTabController(
      length: 3,
      child: Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tab title text
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: _tabController.index == tabIndex
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
            const SizedBox(width: 4.0), // Spacing between texts

            // "0" with conditional background
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: _tabController.index == tabIndex
                    ? Colors.teal.withOpacity(.1)
                    : Colors.grey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: _tabController.index == tabIndex
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
