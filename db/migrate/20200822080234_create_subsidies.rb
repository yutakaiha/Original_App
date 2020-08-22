class CreateSubsidies < ActiveRecord::Migration[6.0]
  def change
    create_table :subsidies do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :limit_amount

      t.timestamps
    end
  end
end
