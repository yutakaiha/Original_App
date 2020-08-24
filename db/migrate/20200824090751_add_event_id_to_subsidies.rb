class AddEventIdToSubsidies < ActiveRecord::Migration[6.0]
  def change
    add_reference :subsidies, :event, foreign_key: :true
  end
end
