class CreateHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :par
      t.integer :score
      t.integer :outcome
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
