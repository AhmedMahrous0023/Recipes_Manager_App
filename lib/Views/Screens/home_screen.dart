import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading =false ;
  List<String> categories =['Breakfast','Lunch','Dinner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        centerTitle: true,
        title: Text('Recipe Manager App'),
        titleTextStyle: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w800,
          color: Colors.white
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.purple,child: Icon(Icons.add,color: Colors.white,),),
      body:isLoading?Center(child: CircularProgressIndicator(),): Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
            crossAxisSpacing: 50,
            mainAxisExtent: 50,
            ),
            itemCount: categories.length,
             itemBuilder: (context,index){
              return InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.only(right: 60,left: 60),
                  child: Card(
                    color: Colors.deepPurple[300],
                    child: GridTile(child: Center(child: Text(categories[index],style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),)))),
                ),
              );
             }),
        )
      ),
    );
  }
}