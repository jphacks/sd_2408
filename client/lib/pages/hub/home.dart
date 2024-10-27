import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return Center(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(8),
              child: UserCard(
                name: "グループ名 $index",
                email: "email$index@example.com",
                description: "詳細情報です。グループ $index",
                iconUrl: "https://via.placeholder.com/150",
              ));
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String description;
  final String iconUrl;

  const UserCard({
    Key? key,
    required this.name,
    required this.email,
    required this.description,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // カードの角を丸くする
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(iconUrl), // アイコン画像のURL
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            // Email
            Row(
              children: [
                const Icon(Icons.email, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text(
                  email,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
