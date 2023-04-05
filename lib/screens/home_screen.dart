// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_music_app_ui/login.dart';
import 'package:flutter_music_app_ui/screens/pengaturan_page.dart';

import '../models/playlist_model.dart';
import '../models/song_model.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('My Music'),
          backgroundColor: Colors.deepPurple.shade800.withOpacity(0.8),
        ),
        drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple.shade400),
            accountName: Text('Wayan Merta'),
            accountEmail: Text('wayan0468@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/merta.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
              // navigate to home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.percent),
            title: Text('Item', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.pop(context);
              // navigate to settings screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              // perform logout action
            },
          ),
        ],
      ),
        ),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              _PlaylistMusic(playlists: playlists),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: ((context, index) {
              return PlaylistCard(playlist: playlists[index]);
            }),
          ),
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.black,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline),
          label: 'Play',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}

// ignore: unused_element
class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'data:image/jpeg;base64,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',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
