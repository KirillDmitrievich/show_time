class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :title
      t.string :description
      t.string :author

      t.timestamps null: false
    end
  end
end
