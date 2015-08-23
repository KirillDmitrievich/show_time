class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :sentences, :tags do |t|
      # t.index [:sentence_id, :tag_id]
      # t.index [:tag_id, :sentence_id]
    end
  end
end
