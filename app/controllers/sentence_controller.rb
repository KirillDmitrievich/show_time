class SentenceController < ApplicationController
  def index
    tag = params[:tag]
    @sentences = tag ? Tag.where(title: tag).first.sentences : Sentence.all
  end

  def create
    sentence = Sentence.create! params[:user].permit(:title, :description, :author)
    tags     = params[:user][:tags].split(' ').uniq

    tags.each do |t|
      sentence.tags << ( Tag.where(title: t).first || Tag.create!(title: t))
    end

    redirect_to root_path
  end

  def add_comment
    @comment = Sentence.find(params[:sentence_id]).comments.
      create params.permit(:author,:content)
    render json: {
      'html' => render_to_string(partial: 'partials/comment.slim', locals: { comment: @comment })
    }
  end

  def new
    @tags = Tag.all.map(&:title)
  end
end
