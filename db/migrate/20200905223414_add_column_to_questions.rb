class AddColumnToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :best_user_id, :integer
  end
end
