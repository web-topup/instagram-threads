import 'package:animate_do/animate_do.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:threads/state/authState.dart';
import 'package:threads/pages/settings.dart';
import 'edit.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            FadeIn(
                duration: Duration(milliseconds: 1000),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                    child: Icon(CupertinoIcons.list_bullet_indent,
                        color: Colors.white)))
          ],
          leading: FadeIn(
              duration: Duration(milliseconds: 1000),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.globe, color: Colors.white))),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Iconsax.home,
                size: 30,
                color: Colors.white,
              ),
              Container(
                width: 40,
              ),
              Icon(
                Iconsax.search_normal,
                size: 30,
                color: Colors.white,
              ),
              Container(
                width: 40,
              ),
              Icon(
                Iconsax.edit,
                size: 30,
                color: Colors.white,
              ),
              Container(
                width: 40,
              ),
              Icon(
                Iconsax.heart,
                size: 30,
                color: Colors.white,
              ),
              Container(
                width: 40,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MyProfilePage())));
                  },
                  child: Icon(
                    CupertinoIcons.person_solid,
                    size: 30,
                    color: Colors.white,
                  ))
            ])),
        body: Center(
            child: FadeInDown(
                child: ListView(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.profileUserModel?.displayName.toString() ??
                                  "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 8,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfilePage()));
                                    },
                                    child: Text(
                                      state.profileUserModel?.userName
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Container(
                                  width: 5,
                                ),
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 19, 19, 19),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    state.profileUserModel?.link.toString() ??
                                        "",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 63,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()));
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 100,
                                    imageUrl: state.profileUserModel!.profilePic
                                        .toString(),
                                  ),
                                ))),
                      ],
                    ),
                    Container(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()));
                            },
                            child: Text(
                              "${state.profileUserModel?.bio ?? ""}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 40,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text("Edit profile")),
                        Container(
                          width: 10,
                        ),
                        Container(
                            height: 40,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text("Share profile"))
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        onTap: (index) {},
                        controller: _tabController,
                        isScrollable: false,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.white,
                        indicatorWeight: 1,
                        tabs: [
                          FadeInUp(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Tab(
                                    child: Text(
                                      'Threads',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ))),
                          FadeInUp(
                              child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Tab(
                                child: Text(
                              'Replies',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          )),
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child:
                            TabBarView(controller: _tabController, children: [
                          Container(
                            height: 200,
                            width: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "You haven't posted any threads yet.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 63, 63, 63)),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "You haven't posted any threads yet.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 63, 63, 63)),
                            ),
                          )
                        ]))
                  ]))
        ]))));
  }
}