# PUT

## API一覧

### /put/user

- Userの最新情報をdbに保存する

クエリ

| プロパティ     　| 型               　| 説明                                        |
|----------------|-------------------|--------------------------------------------|
| name            | String            | ユーザーの名前                              |
| email           | String            | ユーザーのメールアドレス                    |
| password        | String            | ユーザーのパスワード                        |
| place           | String            | ユーザーの居住地                            |
| githubURL       | String            | ユーザーのGitHubプロフィールURL             |
| selfIntro       | String            | ユーザーの自己紹介                          |
| icon            | Image             | ユーザーのアイコン画像                      |
| preference      | String            | ユーザーの好みや興味                        |
| followIDs       | List[int]         | ユーザーがフォローしているuserid            |
| groupIDs        | List[int]         | ユーザーが加入中のグループid                  |
| DirectMessageIDs| List[int]         | ユーザーが加入中のグループid                  |

### /put/group

- Groupの最新情報を保存する(掲示板みたいになる？)

クエリ

| プロパティ       | 型                | 説明                                        |
|----------------|-------------------|--------------------------------------------
| groupID        | int               | グループの一意識別子                       |
| users          | List[User]        | グループ内のユーザーのリスト                 |
| messages       | List[Message]     | グループ内のメッセージのリスト               |
| name           | String            | グループ名                                  |
