import 'package:flutter/material.dart';
import 'package:movies_app/ui/myThemeData/MyThemeData.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: MyThemeData.lightprimary,
        //toolbarHeight: MediaQuery.of(context).size.height*0.1,
        title:  TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 21,
          ),
          controller: search,
          onChanged: (String value){
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5,bottom: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            filled: true,
            fillColor: MyThemeData.secondaryprimarycontainer,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
            ),
            prefixIcon: IconButton(onPressed: (){

            },
              icon: Icon(Icons.search,size: 32,),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            suffixIcon: IconButton(onPressed: (){
              setState(() {
                query = '';
                search.clear();
              });
            },icon: Icon(Icons.close,size: 32,),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/iconmaterial.png')),
          SizedBox(height: 10,),
          Center(child: Text('No Movies Found',style: TextStyle(
            color: Colors.white.withOpacity(0.6745098233222961),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          ),
          ),
        ],
      ),
    );
  }
}
