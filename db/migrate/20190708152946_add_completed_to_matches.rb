class AddCompletedToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :completed, :boolean, default: false
  end
end
