class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :best_answer_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
