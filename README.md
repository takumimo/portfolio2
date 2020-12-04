# ノットウォーリー
20代のキャリア悩み相談所
相談者が悩みを投稿し、そこに解決者（転職経験者など）がコメントする事が出来ます。
下記ページで公開中です。
https://notworry.net

## アプリ概要
以下の悩みを抱えるユーザーの問題解決をサポートするアプリです。
・転職を検討している
・自身のキャリアに不安を抱えている
・転職経験者の意見を聞きたいが相談相手がいない
Ruby on Railsで制作しました。

作成した背景や想いなど、より詳細な情報は下記をご覧ください。
[ポートフォリオ解説](https://qiita.com/mtktkm24/private/233e30cfbea367b9cb0c)

## 機能
Ruby on Railsで制作したアプリです。

- 相談内容投稿・コメント機能：相談内容に対し、いいねボタンを押す事でコメントが可能になります
- ストック機能：相談内容をストックする事で後でまとめて閲覧する事が可能です
- 投稿確認機能：投稿完了前に投稿確認画面を挟む事で投稿ミスを防ぎます
- ありがとう機能：有益なコメントにありがとうポイントを与える事が出来ます
- コメント貢献ランキング機能：ありがとうポイントが多い順にユーザーをランキング化しています

## 使い方
### 相談内容投稿
1. 『ゲストログイン（閲覧用）』を押し、ログインする
2. ヘッダーの『投稿する』ボタンをクリックする
3. タイトル、タグ、相談内容をそれぞれ入力し、下部の『投稿内容を確認する』ボタンを押す
4. 内容に間違いがなければ『投稿する』ボタンを押す
### コメント機能
1. ヘッダーの『相談一覧』を押し、投稿一覧ページに遷移する
2. 任意の投稿内容をクリックする
3. 画面下部の『気になる』ボタンを押す
4. コメントフォームが表示されるので入力し、『コメントする』ボタンを押す

## ローカル環境へのインストール方法

```
$ git clone https://github.com/takumimo/portfolio2.git
$ cd portfolio2
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## ER図
https://drive.google.com/file/d/1wFGcRigpah1iXTGFHR4aV89FFRmNjU2m/view?usp=sharing

## その他
現在も開発を継続しており、順次実装予定です。
実装予定の機能はIssuesよりご確認いただけます。
https://github.com/takumimo/portfolio2/issues

## 作者
[：Twitter](https://twitter.com/takumeeem)
mail to: [mtktkm242424@gmail.com](mtktkm242424@gmail.com)
