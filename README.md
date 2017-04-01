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
  *ユーザー・グループ管理機能<br>
***
messageテーブル

|column | type |
|-------|----------|
|body | text |
|image|string|
|user_id | integer |
|group_id | integer |
userテーブル

|column | type |
|-------|----------|
|user_name | text |
|e-mail | text |
|password | text |
groupテーブル

|column | type |
|-------|----------|
|group_name | text |
user_groupテーブル(中間テーブル)

|column | type |
|-------|----------|
|user_id | integer |
|group_id | integer |
