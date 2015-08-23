class Sentence < ActiveRecord::Base
  has_many :comments
  has_many :sentences_tags
  has_many :tags, through: :sentences_tags
end
