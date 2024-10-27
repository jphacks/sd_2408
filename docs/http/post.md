# POST

## API一覧

### /post/user

- Userを作成してdbに保存する

クエリ

| プロパティ        | 型                | 説明                                        |
|---------------- |-------------------|--------------------------------------------|
| name            | String            | ユーザーの名前                              |
| birthday        | int               | ユーザーの誕生日（エポックタイム形式）       |
| email           | String            | ユーザーのメールアドレス                    |
| password        | String            | ユーザーのパスワード                        |
| place           | String            | ユーザーの居住地                            |
| githubURL       | String            | ユーザーのGitHubプロフィールURL             |
| selfIntro       | String            | ユーザーの自己紹介                          |
| icon            | Image             | ユーザーのアイコン画像                      |
| preference      | String            | ユーザーの好みや興味                        |
| followIDs       | List[int[]         | ユーザーがフォローしているuserid            |
| groupIDs        | List[int[]         | ユーザーが加入中のグループid                  |
| DirectMessageIDs| List[int[]         | ユーザーが加入中のグループid                  |

### /post/group

- Groupを作成する(掲示板みたいになる？)

クエリ

| プロパティ      | 型                | 説明                                        |
|----------------|-------------------|--------------------------------------------|
| users          | List[User]        | グループ内のユーザーのリスト                 |
| messages       | List[Message]     | グループ内のメッセージのリスト               |
| name           | String            | グループ名                                  |

### /post/group/message

- messageを追加するAPI(後回し)

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| messageID     | int              | メッセージの一意識別子    |
| userID        | int              | メッセージを送信したユーザーのID |
| message       | String           | メッセージ内容           |

### /post/direct_message

| プロパティ         | 型               | 説明                     |
|--------------------|------------------|--------------------------|
| directMessageID    | int              | ダイレクトメッセージの一意識別子 |
| firstUser          | int              | 送信者または最初のユーザーのID   |
| secondUser         | int              | 受信者または2人目のユーザーのID  |
| messages           | List[Message]    | メッセージのリスト        |

## /post/hashtag

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| hashTagID     | int              | ハッシュタグの一意識別子   |
| name          | String           | ハッシュタグの名前        |
| groupIDs      | List[int]        | このハッシュタグに関連するグループのIDリスト |
