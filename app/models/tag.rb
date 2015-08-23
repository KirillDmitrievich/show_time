class Tag < ActiveRecord::Base
  has_many :sentences_tags
  has_many :sentences, through: :sentences_tags
end
