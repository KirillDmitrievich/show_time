require 'rails_helper'

RSpec.describe "SentenceCreates", type: :request, :js => true do
  describe "sentence" do
    it "create correct sentence" do
      sentence = build(:sentence)

      visit sentence_new_path

      find(:xpath,'//input[contains(@id, "title")]').set sentence.title
      find(:xpath,'//input[contains(@id, "description")]').set sentence.description
      find(:xpath,'//input[contains(@id, "author")]').set sentence.author
      find(:xpath,'//li[contains(@class, "tagit-new")]/input').set 'tag1 tag2 tag3'

      click_button 'add'

      expect(Sentence.last.title).to eq(sentence.title)
      expect(Sentence.last.description).to eq(sentence.description)
      expect(Sentence.last.author).to eq(sentence.author)
      expect(Sentence.last.tags.count).to be(3)
    end

    it "add correct comment to correct sentence" do
      comment = build(:comment)

      visit root_path

      first(:xpath,'//*[contains(@class, "add-comment")]').click

      sentence = Sentence.find find(:css,'#sentence_id',visible: false).value
      current_comments_count = sentence.comments.count

      find(:xpath,'//input[contains(@placeholder, "name")]').set comment.author
      find(:xpath,'//textarea[contains(@placeholder, "comment")]').set comment.content

      click_button 'SEND'

      visit current_path

      expect(Sentence.find(sentence.id).comments.count).to eq(current_comments_count + 1)
      expect(Sentence.find(sentence.id).comments.last.author).to eq(comment.author)
      expect(Sentence.find(sentence.id).comments.last.content).to eq(comment.content)

      expect(Sentence.find(sentence.id).comments.last).to eq(Comment.last)

      expect(page.has_content?(comment.content)).to be(true)
    end
  end
end
