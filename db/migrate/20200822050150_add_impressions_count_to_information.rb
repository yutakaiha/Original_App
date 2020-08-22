class AddImpressionsCountToInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :information, :impressions_count, :integer, default: 0
  end
end
