class SentencesTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :sentence
end
