# POST

## API一覧

### /post/user

- Userを作成してdbに保存する
- path: /post/user

クエリ

| プロパティ      | 型                | 説明                                        |
|----------------|-------------------|--------------------------------------------|
| name           | String            | ユーザーの名前                              |
| birthday       | int               | ユーザーの誕生日（エポックタイム形式）       |
| email          | String            | ユーザーのメールアドレス                    |
| password       | String            | ユーザーのパスワード                        |
| place          | String            | ユーザーの居住地                            |
| githubURL      | String            | ユーザーのGitHubプロフィールURL             |
| selfIntro      | String            | ユーザーの自己紹介                          |
| icon           | Image             | ユーザーのアイコン画像                      |
| preference     | String            | ユーザーの好みや興味                        |

### /post/group

- Groupを作成する(掲示板みたいになる？)
- path: /post/group

クエリ

| プロパティ      | 型                | 説明                                        |
|----------------|-------------------|--------------------------------------------|
| users          | List<User>        | グループ内のユーザーのリスト                 |
| messages       | List<Message>     | グループ内のメッセージのリスト               |
| name           | String            | グループ名                                  |
