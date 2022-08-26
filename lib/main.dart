import 'package:flutter/material.dart';
import 'package:flutter_5_butterfly/model.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const UsersList(),
        appBar: AppBar(
          title: const Text("Описание бабочек"),
          centerTitle: true,
        ),
      )));
}

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  UsersListState createState() => UsersListState();
}

class UsersListState extends State<UsersList> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHorizontalList(),
        _buildSpacer(20),
        _buildText(),
        _buildSpacer(10),
        _buildImage(),
      ],
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(20),
          itemCount: butterfly.length,
          itemBuilder: (BuildContext context, int index) {
            Butter butter = butterfly[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: 255,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: _selectedIndex == index
                          ? Colors.black12
                          : Colors.purple,
                      width: 3),
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.all(1),
                leading: ClipOval(
                  child: Image(
                    image: AssetImage(butter.image),
                    width: 50,
                    height: 35,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                title: Text(
                  butterfly.elementAt(index).name,
                  style: const TextStyle(fontSize: 24, color: Colors.blue),
                ),
                selected: index == _selectedIndex,
                selectedTileColor: Colors.black12,
              ),
            );
          }),
    );
  }

  Widget _buildText() {
    return Text(
      _selectedIndex == -1 ? ('') : butterfly.elementAt(_selectedIndex).desc,
      style: const TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 3, 78, 140),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImage() {
    return _selectedIndex == -1
        ? const Text(
            'Выберите бабочку',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          )
        : Image.asset(
            butterfly.elementAt(_selectedIndex).image,
            width: 200,
          );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
