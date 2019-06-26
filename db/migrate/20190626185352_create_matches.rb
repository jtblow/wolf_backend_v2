class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :course_name
      t.integer :wager

      t.timestamps
    end
  end
end
