import 'package:flutter/material.dart';
import 'package:flutter_examples/constant/data_json.dart';
import 'package:flutter_examples/pages/course_detail_page.dart';
import 'package:flutter_examples/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: SvgPicture.asset("assets/images/burger_icon.svg"), onPressed: (){}),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),fit: BoxFit.cover)
              ),
            )
          ],
        ),
      ),

      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
     children: <Widget>[
       Text("Hey, SopheaMen", style: TextStyle(fontSize: 22,
         fontWeight: FontWeight.w600),),
       SizedBox(height: 15,),
       Text("Find a course you want to learn", style: TextStyle(fontSize: 18,),),
       SizedBox(height: 40,),
       Container(
         height: 60,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: Colors.blueGrey,
         ),

         child: Center(
           child: Padding(
             padding: const EdgeInsets.only(top: 3),
             child: TextField(
               cursorColor: Colors.black,
              controller: _searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for anything",
                prefixIcon: Icon(LineIcons.search,color: Colors.black.withOpacity(0.8),)
              ),
             ),
           ),
         ),
       ),
       SizedBox(height: 40,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text("Categories", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
           Text("See All", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primary),),
         ],
       ),
       SizedBox(height: 30,),
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: List.generate(online_data_one.length, (index){
               return GestureDetector(
                 onTap: () { 
                   Navigator.push(context, MaterialPageRoute (builder: (_) => CourseDetailPage(
                     title: online_data_one[index]['title'],
                     imgDetail: online_data_one[index]['img_detail'],
                   )));
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Stack(
                     children: <Widget>[
                       Container(
                         width: (MediaQuery.of(context).size.width - 60) / 2,
                         height: 200,
                         decoration: BoxDecoration(
                             color: primary,
                             borderRadius: BorderRadius.circular(20),
                             image: DecorationImage(image: AssetImage(online_data_one[index]['img']), fit: BoxFit.cover)),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                         child: Column(
                           children: <Widget>[
                             Text(online_data_one[index]['title'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                             SizedBox(height: 8,),
                             Text(online_data_one[index]['courses'], style: TextStyle(fontSize: 14, color: black.withOpacity(0.6)),),
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               );
             })
         ),

         SizedBox(width: 20,),

         Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: List.generate(online_data_two.length, (index){
               return GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute (builder: (_) => CourseDetailPage(
                     title: online_data_two[index]['title'],
                     imgDetail: online_data_one[index]['img_detail'],
                   )));
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Stack(
                     children: <Widget>[
                       Container(
                         width: (MediaQuery.of(context).size.width - 60) / 2,
                         height: 240,
                         decoration: BoxDecoration(
                             color: primary,
                             borderRadius: BorderRadius.circular(20),
                             image: DecorationImage(image: AssetImage(online_data_two[index]['img']), fit: BoxFit.cover)),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                         child: Column(
                           children: <Widget>[
                             Text(online_data_two[index]['title'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                             SizedBox(height: 8,),
                             Text(online_data_two[index]['courses'], style: TextStyle(fontSize: 14, color: black.withOpacity(0.6)),),
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               );
             })
         )

       ],)

     ],);
  }
}
