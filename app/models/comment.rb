class Comment < ActiveRecord::Base
  belongs_to :sentence
end