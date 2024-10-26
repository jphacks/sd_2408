# クラスプロパティ一覧

## User クラス

| プロパティ          | 型         | 説明                     |
|-------------------|------------|--------------------------|
| userID            | int        | ユーザーの一意識別子      |
| name              | String     | ユーザーの名前           |
| birthday          | int        | ユーザーの誕生日（yyyymmdd形式の8桁） |
| email             | String     | ユーザーのメールアドレス   |
| password          | String     | ユーザーのパスワード      |
| place             | String     | ユーザーの居住地          |
| githubURL         | String     | ユーザーのGitHubプロフィールURL |
| selfIntro         | String     | ユーザーの自己紹介        |
| image             | Image      | ユーザーのアイコン        |
| preference        | String     | ユーザーの興味のある技術   |
| followIDs         | List[int]  | ユーザーがフォローしているuserid     |
| groupIDs          | List[int]  | ユーザーが加入中のグループid     |
| DirectMessageIDs  | List[int]  | ユーザーが加入中のグループid                  |

## Group クラス

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| groupID       | int              | グループの一意識別子      |
| users         | List[User]       | グループに所属するユーザーのリスト |
| name          | String           | グループ名               |
| messages      | List[Message]    | グループ内のメッセージのリスト |

## Image クラス

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| imageID       | int              | 画像の一意識別子         |
| userID        | int              | 画像を所有するユーザーのID |
| url           | String           | 画像のURL                |

## Message クラス

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| messageID     | int              | メッセージの一意識別子    |
| userID        | int              | メッセージを送信したユーザーのID |
| message       | String           | メッセージ内容           |

## DirectMessage クラス

| プロパティ         | 型               | 説明                     |
|--------------------|------------------|--------------------------|
| directMessageID    | int              | ダイレクトメッセージの一意識別子 |
| firstUser          | int              | 送信者または最初のユーザーのID   |
| secondUser         | int              | 受信者または2人目のユーザーのID  |
| messages           | List[Message]    | メッセージのリスト        |

## HashTag クラス

| プロパティ     | 型               | 説明                     |
|---------------|------------------|--------------------------|
| hashTagID     | int              | ハッシュタグの一意識別子   |
| name          | String           | ハッシュタグの名前        |
| groupIDs      | List[int]        | このハッシュタグに関連するグループのIDリスト |
