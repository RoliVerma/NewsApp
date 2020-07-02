import 'package:flutter/material.dart';
import 'package:newsapp/Helper/Data.dart';
import 'package:newsapp/Models/CategoryModel.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
List<CategoryModel> categories = new List<CategoryModel>();

   @override
  void initState() { 
    
    categories = getNewsCategories();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text("NEWS APP" , style: TextStyle(
              color : Colors.blue
            ),)
          ],
          ),
          elevation: 0.0,
      ),
      body: Container(
        child:Column(
          children : <Widget> [
            Container(
              padding: EdgeInsets.symmetric(horizontal:16),
              height : 70,
              child : ListView.builder(                
                 itemCount : categories.length ,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context , index){
                   return CategoryCard(
                     imageUrl: categories[index].imageUrl,
                     categoryName: categories[index].categoryName,
                   );
                 }),
            )
          ]
        )
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final imageUrl , categoryName;
  CategoryCard ( {this.imageUrl , this.categoryName });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
          child: Container(
        margin: EdgeInsets.only( right : 16 , top: 8 ),
        child: Stack(
          children : <Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
             child : Image.network(imageUrl , width :120 , height : 60 , fit : BoxFit.cover),
            ),
            
            Container(
              alignment: Alignment.center,
               width :120 , height : 60 ,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Colors.black26,
               ),
              child : Text( categoryName , style: TextStyle(
                color : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),)
            )
          ]
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  
  final String imgUrl , blogTitle , desc;
  BigCard({ @required this.imgUrl , @required this.blogTitle , @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children : <Widget>[
         Image.network(imgUrl),
         Text(blogTitle),
         Text(desc)
       ]
     ),
    );
  }
}