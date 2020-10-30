# crumb :root do
  # link "Home", root_path
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :top do
  link "ホーム", root_path
end

crumb :posts do
  link "相談一覧", posts_path
  parent :top
end

crumb :post do |post|
  link "相談詳細", post_path(post)
  parent :posts
end

crumb :user do |user|
  link "ユーザー詳細", user_path(user)
  parent :posts
end

crumb :postsq do |post|
  link "検索", posts_path(post)
  parent :posts
end

crumb :tag do |tag_name|
  link "タグ", posts_path(tag_name)
  parent :posts
end

crumb :postnew do 
  link "相談登録", new_post_path
  parent :posts
end

crumb :useredit do |user|
  link "ユーザー編集", edit_user_path(user)
  parent :user, user
end

crumb :postedit do |post|
  link "投稿編集", edit_post_path(post)
  parent :post, post
end

crumb :followed do |user|
  link "フォロー詳細", following_user_path(user)
  parent :user, user
end

crumb :follower do |user|
  link "フォロワー詳細", followers_user_path(user)
  parent :user, user
end