import 'package:flutter/material.dart';

// ダミーデータをグローバルに定義
final dummyProfiles = [
  {
    'name': '田中 美咲',
    'age': 25,
    'location': '東京',
    'image': 'https://picsum.photos/200',
    'interests': ['Kotlin', 'Flutter', ],
    'bio': '旅行が大好きで、休みの日は新しい場所を探検しています。料理も得意で、特に和食を作るのが好きです。'
  },
  {
    'name': '佐藤 健',
    'age': 28,
    'location': '大阪',
    'image': 'https://picsum.photos/200',
    'interests': ['PYthon', 'C', 'Dart'],
    'bio': 'スポーツ観戦が趣味です。休日はカフェでゆっくり過ごすのが好きです。'
  },
];

// 現在のユーザーのプロフィール
Map<String, dynamic> currentUserProfile = {
  'name': '山田 太郎',
  'age': 26,
  'location': '東京',
  'image': 'https://picsum.photos/200',
  'interests': ['programming', '読書', '写真'],
  'bio': 'エンジニアとして働いています。趣味は読書と写真撮影です。'
};

void main() {
  runApp(const DatingApp());
}

class DatingApp extends StatelessWidget {
  const DatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マッチングアプリ')),
      body: buildBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person_search), label: '探す'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'メッセージ'),
          NavigationDestination(icon: Icon(Icons.person), label: 'プロフィール'),
        ],
      ),
    );
  }

  Widget buildBody() {
    switch (_selectedIndex) {
      case 0:
        return buildDiscoveryPage();
      case 1:
        return buildMessagesPage();
      case 2:
        return buildProfilePage();
      default:
        return const Center(child: Text('不明なページ'));
    }
  }

  Widget buildDiscoveryPage() {
    return ListView.builder(
      itemCount: dummyProfiles.length,
      itemBuilder: (context, index) {
        final profile = dummyProfiles[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileDetailPage(profile: profile),
            ),
          ),
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(profile['image'] as String),
                    onBackgroundImageError: (exception, stackTrace) => null,
                    child: const Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profile['name']}, ${profile['age']}歳',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text('📍 ${profile['location']}'),
                        Wrap(
                          spacing: 8,
                          children: (profile['interests'] as List<String>)
                              .map((e) => Chip(label: Text(e)))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildMessagesPage() {
    return ListView.builder(
      itemCount: dummyProfiles.length,
      itemBuilder: (context, index) {
        final profile = dummyProfiles[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profile['image'] as String),
            onBackgroundImageError: (exception, stackTrace) => null,
            child: const Icon(Icons.person, size: 30),
          ),
          title: Text(profile['name'] as String),
          subtitle: const Text('メッセージをタップして開始'),
          trailing: const Text('12:30'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(profile: profile),
            ),
          ),
        );
      },
    );
  }

  Widget buildProfilePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(currentUserProfile['image'] as String),
            onBackgroundImageError: (exception, stackTrace) => null,
            child: const Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          Text(
            currentUserProfile['name'] as String,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text('${currentUserProfile['age']}歳'),
          Text('📍 ${currentUserProfile['location']}'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: (currentUserProfile['interests'] as List<String>)
                .map((e) => Chip(label: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileEditPage(
                  profile: currentUserProfile,
                  onSave: (updatedProfile) {
                    setState(() {
                      currentUserProfile = updatedProfile;
                    });
                  },
                ),
              ),
            ),
            child: const Text('プロフィールを編集'),
          ),
        ],
      ),
    );
  }
}

class ProfileDetailPage extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileDetailPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${profile['name']}のプロフィール'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(profile: profile),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              profile['image'] as String,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.person, size: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${profile['name']}, ${profile['age']}歳',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('📍 ${profile['location']}'),
                  const SizedBox(height: 16),
                  const Text(
                    '自己紹介',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(profile['bio'] as String),
                  const SizedBox(height: 16),
                  const Text(
                    '興味・趣味',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8,
                    children: (profile['interests'] as List<String>)
                        .map((e) => Chip(label: Text(e)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  final Map<String, dynamic> profile;
  final Function(Map<String, dynamic>) onSave;

  const ProfileEditPage({
    super.key,
    required this.profile,
    required this.onSave,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController locationController;
  late TextEditingController bioController;
  late TextEditingController interestsController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile['name'] as String);
    ageController =
        TextEditingController(text: widget.profile['age'].toString());
    locationController =
        TextEditingController(text: widget.profile['location'] as String);
    bioController = TextEditingController(text: widget.profile['bio'] as String);
    interestsController = TextEditingController(
        text: (widget.profile['interests'] as List<String>).join(', '));
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    locationController.dispose();
    bioController.dispose();
    interestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final updatedProfile = {
                ...widget.profile,
                'name': nameController.text,
                'age': int.tryParse(ageController.text) ?? widget.profile['age'],
                'location': locationController.text,
                'bio': bioController.text,
                'interests': interestsController.text
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList(),
              };
              widget.onSave(updatedProfile);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(widget.profile['image'] as String),
              onBackgroundImageError: (exception, stackTrace) => null,
              child: const Icon(Icons.person, size: 30),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: '年齢',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: '場所',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: interestsController,
              decoration: const InputDecoration(
                labelText: '興味・趣味（カンマ区切り）',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> profile;

  const ChatPage({super.key, required this.profile});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    if (_messageController.text.isEmpty) return;

    setState(() {
      _messages.add({
        'text': _messageController.text,
        'isMe': true,
        'timestamp': DateTime.now(),
      });

      // デモ用の自動返信
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _messages.add({
              'text': 'ありがとうございます！',
              'isMe': false,
              'timestamp': DateTime.now(),
            });
          });
          _scrollToBottom();
        }
      });
    });
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.profile['image'] as String),
              onBackgroundImageError: (exception, stackTrace) {
                return;
              },
              child: const Icon(Icons.person, size: 25),
            ),
            const SizedBox(width: 8),
            Text(widget.profile['name'] as String),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _MessageBubble(message: message);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'メッセージを入力...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _handleSendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _handleSendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Map<String, dynamic> message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message['isMe'] as bool;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message['text'] as String,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
