class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :question
      t.text :answer
      t.integer :medium_id

      t.timestamps
    end
  end
end
