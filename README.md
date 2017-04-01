<!-- == README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>. -->

Chatspace DATABASE設計
==============  
  *メッセージ管理機能<br>
  *ユーザー管理機能<br>
  *グループ管理機能<br>
  *グループ・ユーザー管理機能<br>
## アソシエーションについて
usersテーブルとmessagesテーブル、groupsテーブルとmessagesテーブルがどちらも一対多となるアソシエーションを設定する。<br>
usersテーブルとgroupsテーブルはお互いに多対多となるため中間テーブルのgroup-usersテーブルを作成しアソシエーションを設定する。
## null許可について
messagesテーブルのbodyカラム,imageカラムにのみnullを許可するよう設定する。

***
## messagesテーブル

|column | type |
|-------|----------|
|body | text |
|image|string|
|group_id | references |
|user_id | references |

```
class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end
```

## usersテーブル

|column | type |
|-------|----------|
|user_name | text |
|e-mail | text |
|password | text |

```
class User < ActiveRecord::Base
  has_many :messages
  has_many through :groups
end
```

## groupsテーブル

|column | type |
|-------|----------|
|group_name | text |

```
class Group < ActiveRecord::Base
  has_many :messages
  has_many through :users
end
```

## group_usersテーブル(中間テーブル)

|column | type |
|-------|----------|
|group_id | references |
|user_id | references |
