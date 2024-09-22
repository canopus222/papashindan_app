class PostsController < ApplicationController
  def new
    # 新規フォームを表示
  end

  def create
    # フォーム送信後の処理
    redirect_to posts_path(
      question1: params[:question1],
      question2: params[:question2],
      question3: params[:question3],
      question4: params[:question4],
      question5: params[:question5]
    )
  end

  def index
    # パラメータを取得
    question1 = params[:question1]
    question2 = params[:question2]
    question3 = params[:question3]
    question4 = params[:question4]
    question5 = params[:question5]

    # 「はい」（1）の数を合計
    yes_count = [question1, question2, question3, question4, question5].map(&:to_i).sum

    # 結果に基づいて表示する内容を決定
    @result = yes_count

    # 診断結果用にすべてのPostレコードを取得
    @posts = Post.all
  end
end

