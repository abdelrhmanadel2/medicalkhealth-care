import 'package:flutter/material.dart';
import 'package:med_app/Styles/colors.dart';
import 'package:med_app/provider/Blog_Provider.dart';
import 'package:provider/provider.dart';

import 'Medical_List_Screen.dart';
import 'Nutrition_List_View.dart';

class BlogHomescreen extends StatefulWidget {
  final int neturationNavigation;
  BlogHomescreen({Key key, this.neturationNavigation});
  @override
  _BlogHomescreenState createState() => _BlogHomescreenState();
}

class _BlogHomescreenState extends State<BlogHomescreen> {
  int _selectedIndex = 0;
  var blogs;
  List<Widget> _widgetotpions = <Widget>[
    MedicalListScreen(),
    NutritionalListScreen(),
  ];
  void _itemSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider<BlogProvider>(
        create: (context) => BlogProvider(),
        child: Consumer<BlogProvider>(builder: (context, blogprovider, _) {
          //  var medblogs= blogprovider.Medical;
          //  var nutiblogs=blogprovider.nuitrition;
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text("Blogs"),
                    backgroundColor: ColorsCollection.mainColor,
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Medical',
                        ),
                        Tab(
                          text: 'Nuitrition',
                        ),
                      ],
                      onTap: (index) {
                        //  blogs= (index==0)? medblogs:nutiblogs;
                        _itemSwitch(index);
                      },
                    ),
                  ),
                  body: _widgetotpions.elementAt(_selectedIndex)));
        }));
  }
}
